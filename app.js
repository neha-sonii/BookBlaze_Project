import express from "express";
import bodyParser from "body-parser";
import generateNotes from "./generateNotes.js"; // Adjust the path as necessary
import pg from "pg"; // To store data in pgAdmin
import flash from 'connect-flash'; // For flash messages
import session from 'express-session'; // For session management
import nodemailer from 'nodemailer'; //to send mails to the user 
import pgSession from 'connect-pg-simple';
import passport from "passport";  //passport for authentication
import LocalStrategy from "passport-local"; //passport strategy for local authentication
// import env from "dotenv";
import dotenv from 'dotenv';
dotenv.config();

const app = express();

// Database connection
const db = new pg.Client({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    database: process.env.DB_NAME,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
});

db.connect();


// Set EJS as view engine
app.set("view engine", "ejs");

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use(express.json());
const pgsession = pgSession(session);
app.use(session({
    store: new pgsession({
        pool: db, // Connection pool
        createTableIfMissing: true // Use another table-name than the default "session" one
    }),
    secret: 'SESSION_SECRET',
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 3600000 * 24 * 7 //7 days
    }
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());


// flash messages available in all views
app.use((req, res, next) => {
    res.locals.user = req.session.user; // Make user available in all views
    res.locals.messages = req.flash(); // Make flash messages available in all views
    next();
});


// Passport local strategy
passport.use(new LocalStrategy(
    function (username, password, done) {
        // Replace this with your actual user lookup logic
        User.findOne({ username: username }, function (err, user) {
            if (err) return done(err);
            if (!user || user.password !== password) return done(null, false);
            return done(null, user);
        });
    }
));
passport.serializeUser((user, done) => {
    done(null, user.id);
});
passport.deserializeUser((id, done) => {
    User.findById(id, (err, user) => {
        done(err, user);
    });
});


// send email to admin using nodemailer
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'nehasoni052005@gmail.com',
        pass: "lqtfxvgjfceklgdz"
    }
});



// home page Routes
app.get("/", async (req, res) => {
    try {
        const result = await db.query("SELECT * FROM books ORDER BY id ASC");
        const BookFromDB = result.rows;
        // books = BookFromDB; // Update the books array with data from the database
        res.render("index", {
            books: BookFromDB,
            contact_title: 'Have a story to share ? We are listening',
            bgColor: 'none',
            textColor: '#e1d3c9d7',
            border: 'none',
            menuBorder: '#1b3c53ff'
        });

    } catch (error) {
        console.log(error, "error fetching book");
        res.sendStatus(500).send("Error fetching books");

    }
});

// about page
app.get("/about", (req, res) => {
    res.render("about", { bgColor: '#e1d3c9d7', textColor: '#1b3c53ff', menuBorder: '#1b3c53ff' });
});

// Contact page
app.get("/contact", (req, res) => {
    res.render("contact", {
        contact_title: "Let's connect",
        border: "3px solid #7EC8E3",
        bgColor: '#e1d3c9d7',
        textColor: '#1b3c53ff',
        menuBorder: '#1b3c53ff'
    });
});



// bookstore page
app.get("/bookstore", async (req, res) => {
    try {
        const result = await db.query("SELECT * FROM books ORDER BY id ASC");
        const BookFromDB = result.rows;
        // books = BookFromDB; // Update the books array with data from the database
        res.render("shop", {
            books: BookFromDB,
            bgColor: '#e1d3c9d7',
            textColor: '#1b3c53ff',
            menuBorder: '#1b3c53ff',
            title: "Explore",
        });

    } catch (error) {
        console.error("Error fetching books:", error);
        res.status(500).send("Error fetching books");
    }
});


// add-book route
app.post("/add-book", async (req, res) => {
    // check if user is logged in and is neha soni
    if (!req.isAuthenticated() || req.user.email !== "nehasoni052005@gmail.com") {
        req.flash("success", "Book added successfully");
        res.redirect("/bookstore");
    }
    const { title, author, description, genre, price, isbn, rating } = req.body;

    try {
        await db.query(
            "INSERT INTO books (title, author, description, genre, price, isbn, rating) VALUES ($1, $2, $3, $4, $5, $6, $7)",
            [title, author, description, genre, parseFloat(price), isbn, parseInt(rating)]
        );
        res.redirect("/bookstore");

    } catch (error) {
        console.log("Error fetching books:", error);
        req.flash("error", "failed to add book");
        res.status(500).send("Error adding book");
    }
});

// route to delete a book
app.post("/delete-book/:id", async (req, res) => {
    const bookId = req.params.id;
    try {
        await db.query("DELETE FROM books WHERE id = ($1)", [bookId]);
        req.flash("success", "Book deleted successfully");
        res.redirect('/bookstore');

    } catch (error) {
        console.log(error);
        req.flash("error", "failed to delete book");
        res.sendStatus(500).send("Error deleting book");
    }
});

// Update book in database
app.post("/edit-book/:id", async (req, res) => {
    const { title, author, description, genre, price, isbn, rating } = req.body;
    try {
        await db.query(
            "UPDATE books SET title=$1, author=$2, description=$3, genre=$4, price=$5, isbn=$6, rating=$7 WHERE id=$8",
            [title, author, description, genre, parseFloat(price), isbn, parseInt(rating), req.params.id]
        );
        req.flash("success", "Book updated successfully");
        res.redirect("/bookstore");
    } catch (error) {
        console.log("Error updating book:", error);
        req.flash("error", "Failed to update book");
        res.status(500).send("Error updating book");
    }
});

// Edit book data
app.get("/edit-book/:id", async (req, res) => {
    try {
        const result = await db.query("SELECT * FROM books WHERE id = $1", [req.params.id]);
        if (result.rows.length === 0) {
            return res.status(404).json({ error: "Book not found" });
        }
        res.json(result.rows[0]);
    } catch (error) {
        res.status(500).json({ error: "Error fetching book" });
    }
});

// read notes page using their unique id
app.get("/notes/:id", async (req, res) => {
    try {
        const result = await db.query("SELECT * FROM books WHERE id = $1", [req.params.id]);
        const book = result.rows[0];

        if (!book) {
            return res.status(404).send("Book not found");
        }
        if (!book.notes) {
            //  generate notes only if not present
            try {
                const notes = await generateNotes(book.title, book.author);
                book.notes = notes;
                console.log("Generated notes:", notes);
            } catch (error) {
                return res.status(500).send("Error generating notes");
            }
        }
        res.render("readnotes", {
            book: [book], // not books: [book]
            title: "Read Notes",
            bgColor: '#e1d3c9d7',
            textColor: '#1b3c53ff',
            menuBorder: '#1b3c53ff'
        });
    } catch (error) {
        console.log(error);
    }
});




// Route for login page
app.get("/login", (req, res) => {
    res.render("login");
})


// add to cart route
app.get("/cart/:id", async (req, res) => {
    try {
        const result = await db.query("SELECT * FROM books WHERE id = $1", [req.params.id]);
        const bookfromDB = result.rows[0];
        res.render("AddToCart", {
            books: [bookfromDB],
            bgColor: '#e1d3c9d7',
            textColor: '#1b3c53ff',
            menuBorder: '#1b3c53ff'
        })
    } catch (error) {
        console.log("error fetching book", error);
        res.status(500).send("error fetching books");

    }

})

// route to submit the contact form
app.post("/submit", (req, res) => {
    const { fname, lname, email, message } = req.body;
    console.log("form submitted succesfully", req.body);
    req.flash("success", "form submitted successfully");

    const mailOptions = {
        from: 'nehasoni052005@gmail.com',
        to: email,
        subject: 'New Contact Form Submission',
        text: `Hi ${fname} ${lname},\n\nWe have received a new message from your contact form.\n\nMessage:\n${message} \n\nYou can reply to this email`
    };
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log("Error sending email:", error);
            return res.status(500).send("Error sending email" + error.message);
        } else {
            console.log("Email sent:", info.response);
            return res.redirect("/bookstore"); // redirect to home page after form submission
        }
    });

});


// subscribe to our newslatter
app.post("/subscribe", (req, res) => {
    const { email } = req.body;
    console.log("Subscribed successfully", req.body);
    req.flash("success", "Subscribed successfully");

    const mailOptions = {
        from: 'nehasoni052005@gmail.com',
        to: email,
        subject: 'New Subscription',
        text: `Hi ${email},\n\nYou have successfully subscribed to our newsletter.`
    };
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log("Error sending email:", error);
            return res.status(500).send("Error sending email " + error.message);
        } else {
            console.log("Email sent:", info.response);
            return res.redirect("/"); // redirect to home page after form submission
        }
    });

});


// Route for user login
app.post("/logedin", async (req, res) => {
    const { email, password } = req.body;
    // Set user in session
    req.flash("success", "Logged in successfully");
    req.session.user = { email };
    console.log(req.body);

    // sent an email for logged in
    const mailOptions = {
        from: 'nehasoni052005@gmail.com',
        to: email,
        subject: 'New Login Notification',
        text: `Hi ${email},\n\nYou have successfully logged in to your account.`
    };
    transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
            console.log("Error sending email:", error);
            return res.status(500).send("Error sending email" + error.message);
        } else {
            console.log("Email sent:", info.response);
            return res.redirect("/"); // redirect to home page after form submission
        }
    });
});

// Logout route
app.post("/logout", (req, res) => {
    req.flash("success", "Logged out successfully");
    req.session.destroy(() => {
        res.redirect("/");
    });
});


// Start server
const PORT = process.env.PORT;
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});