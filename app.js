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
// secure password
import bcrypt from 'bcrypt';
import dotenv from 'dotenv';
dotenv.config();

const app = express();
// Start server
const PORT = process.env.PORT;

// Database connection
const db = new pg.Client({
  connectionString: process.env.DATABASE_URL,
  ssl: { rejectUnauthorized: false },
  family: 4
});

db.connect()
  .then(() => console.log("Connected to DB"))
  .catch(err => console.error("DB Connection Error:", err));

console.log(process.env.DATABASE_URL);

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
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
    cookie: {
        maxAge: 1000 * 60 * 60 * 24 * 365 // 1 year
    }
}));
// Middleware to require login for all routes except login, register, and static assets
function ensureAuthenticated(req, res, next) {
    // Allow access to login, register, and static files
    if (
        req.isAuthenticated && req.isAuthenticated() ||
        req.path === '/login' ||
        req.path === '/logedin' ||
        req.path === '/register' ||
        req.path === '/logout' ||
        req.path === '/reset-password' ||
        req.path.startsWith('/public/') ||
        req.path.startsWith('/css/') ||
        req.path.startsWith('/js/') ||
        req.path.startsWith('/assets/')
    ) {
        return next();
    }
    // If not logged in, redirect to login page
    return res.redirect('/login');
}
// Apply the middleware globally (after session and passport middlewares)
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());
app.use(ensureAuthenticated);


// flash messages available in all views
app.use((req, res, next) => {
    // Use session user if available, else fallback to req.user (passport)
    res.locals.user = req.session.user || req.user;
    res.locals.messages = req.flash();
    next();
});


// Passport local strategy using PostgreSQL users table
// Assumes users table has columns: id, email, password
passport.use(new LocalStrategy({ usernameField: 'email' }, async (email, password, done) => {
    try {
        const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            // Auto-register: create user if not found
            const hashedPassword = await bcrypt.hash(password, 10);
            const insertResult = await db.query('INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *', [email, hashedPassword]);
            return done(null, insertResult.rows[0]);
        }
        const user = result.rows[0];
        const match = await bcrypt.compare(password, user.password);
        if (!match) return done(null, false, { Messages: 'Incorrect password.' });
        return done(null, user);
    } catch (err) {
        return done(err);
    }
}));
passport.serializeUser((user, done) => {
    done(null, user.id);
});
passport.deserializeUser(async (id, done) => {
    try {
        const result = await db.query('SELECT * FROM users WHERE id = $1', [id]);
        if (result.rows.length === 0) return done(null, false);
        done(null, result.rows[0]);
    } catch (err) {
        done(err);
    }
});


// send email to admin using nodemailer
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL_USER,
        pass: process.env.EMAIL_PASS
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
    res.render("About", { bgColor: '#e1d3c9d7', textColor: '#1b3c53ff', menuBorder: '#1b3c53ff' });
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
        // Order by id DESC so newest books are first
        const result = await db.query("SELECT * FROM books ORDER BY id DESC");
        const BookFromDB = result.rows;
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
    // check if user is logged in and is bookblaze5432@gmail.com
    if (!req.isAuthenticated() || req.user.email !== "bookblaze5432@gmail.com") {
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
        res.status(500).send('Error loading page');
    }
});




// Route for login page
app.get("/login", (req, res) => {
    // If already logged in, redirect to home
    if (req.isAuthenticated && req.isAuthenticated()) {
        req.flash("info", "You are already logged in");
        return res.redirect("/");
    }
    res.render("login");
});


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
        from: 'BookBlaze <bookblaze5432@gmail.com>',
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
            // Send admin notification
            const adminMailOptions = {
                from: 'BookBlaze <bookblaze5432@gmail.com>',
                to: 'bookblaze5432@gmail.com',
                subject: 'Contact Form Submitted',
                text: `A user (${email}) submitted the contact form.\nName: ${fname} ${lname}\nMessage: ${message}`
            };
            transporter.sendMail(adminMailOptions, (adminErr, adminInfo) => {
                if (adminErr) {
                    console.log("Error sending admin notification:", adminErr);
                } else {
                    console.log("Admin notified:", adminInfo.response);
                }
                return res.redirect("/bookstore");
            });
        }
    });

});


// subscribe to our newslatter
app.post("/subscribe", (req, res) => {
    const { email } = req.body;
    console.log("Subscribed successfully", req.body);
    req.flash("success", "Subscribed successfully");

    const mailOptions = {
        from: 'BookBlaze <bookblaze5432@gmail.com>',
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
            // Send admin notification
            const adminMailOptions = {
                from: 'BookBlaze <bookblaze5432@gmail.com>',
                to: 'bookblaze5432@gmail.com',
                subject: 'New Newsletter Subscription',
                text: `A user (${email}) subscribed to the newsletter.`
            };
            transporter.sendMail(adminMailOptions, (adminErr, adminInfo) => {
                if (adminErr) {
                    console.log("Error sending admin notification:", adminErr);
                } else {
                    console.log("Admin notified:", adminInfo.response);
                }
                return res.redirect("/");
            });
        }
    });

});


// Route for user login
app.post("/logedin", (req, res, next) => {
    passport.authenticate('local', function (err, user, info) {
        if (err) { return next(err); }
        if (!user) {
            req.flash('error', info && info.messages ? info.messages : 'Login failed.');
            return res.redirect('/login');
        }
        req.logIn(user, function (err) {
            if (err) { return next(err); }
            req.flash("success", "Logged in successfully");
            req.session.user = user;
            // Send login notification email to user
            const email = user.email;
            const mailOptions = {
                from: 'BookBlaze <bookblaze5432@gmail.com>',
                to: email,
                subject: 'New Login Notification',
                text: `Hi,\n\nYou have successfully logged in to your BookBlaze account.\n\nIf this wasn't you, please contact support immediately.\n\nThank you,\nBookBlaze Team`
            };
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.log("Error sending email to user:", error);
                } else {
                    console.log("Email sent to user:", info.response);
                }
            });
            // Send login notification email to admin
            const adminMailOptions = {
                from: 'BookBlaze <bookblaze5432@gmail.com>',
                to: 'bookblaze5432@gmail.com',
                subject: 'User Logged In',
                text: `A user (${email}) logged in to BookBlaze at ${new Date().toLocaleString()}`
            };
            transporter.sendMail(adminMailOptions, (error, info) => {
                if (error) {
                    console.log("Error sending email to admin:", error);
                } else {
                    console.log("Admin notified of login:", info.response);
                }
                return res.redirect("/");
            });
        });
    })(req, res, next);
}
);

// Logout route
app.post("/logout", (req, res) => {
    const userEmail = req.session.user ? req.session.user.email : 'Unknown';
    req.flash("success", "Logged out successfully");
    // Send admin notification
    const adminMailOptions = {
        from: 'BookBlaze <bookblaze5432@gmail.com>',
        to: 'bookblaze5432@gmail.com',
        subject: 'User Logged Out',
        text: `A user (${userEmail}) logged out of BookBlaze at ${new Date().toLocaleString()}`
    };
    transporter.sendMail(adminMailOptions, (adminErr, adminInfo) => {
        if (adminErr) {
            console.log("Error sending admin notification:", adminErr);
        } else {
            console.log("Admin notified of logout:", adminInfo.response);
        }
        req.session.destroy(() => {
            res.redirect("/login");
        });
    });
});

// Reset password routes
app.get('/reset-password', (req, res) => {
    res.render('reset-password');
});

app.post('/reset-password', async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        req.flash('error', 'Email and new password are required.');
        return res.redirect('/reset-password');
    }
    try {
        const result = await db.query('SELECT * FROM users WHERE email = $1', [email]);
        if (result.rows.length === 0) {
            req.flash('error', 'No user found with that email.');
            return res.redirect('/reset-password');
        }
        const hashedPassword = await bcrypt.hash(password, 10);
        await db.query('UPDATE users SET password = $1 WHERE email = $2', [hashedPassword, email]);
        req.flash('success', 'Password reset successful! You can now log in.');
        // send an email
        const mailOptions = {
            from: 'BookBlaze <bookblaze5432@gmail.com>',
            to: email,
            subject: 'Password Reset Successful',
            text: `Hi ${email},\n\nYour password has been successfully reset. You can now log in with your new password.`
        };
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                console.log("Error sending email:", error);
                // Don't block password reset on email failure
            } else {
                console.log("Email sent:", info.response);
                res.redirect('/login');
            }
        });
    } catch (err) {
        console.error('Password reset error:', err);
        res.status(500).send('Error loading page');
        req.flash('error', 'Password reset failed.');
        res.redirect('/reset-password');

    }
});

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);

});
