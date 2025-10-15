# 📚 BookBlaze

BookBlaze is a full-stack web application for managing and exploring books.  
It includes features like authentication, book CRUD operations, and integration with external APIs.

---

## 🚀 Features
- User authentication (Login/Register)
- View all books
- Search books by title
- PostgreSQL database integration
- JWT-based authentication
- Secure environment variables with `.env`

---

## 🛠️ Tech Stack
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Node.js, Express.js
- **Database:** PostgreSQL (managed via pgAdmin)
- **Authentication:** JWT
- **Environment Management:** dotenv

---

## ⚙️ Installation

Clone the repository:
```bash
git clone https://github.com/neha-sonii/BookBlaze_Project.git
cd bookblaze
```
## Inatall Dependencies

```
npm install
node app.js
```

## Create .env file

```
# server
PORT=YOUR_PORT_NUMBER

## Database Setup
This project uses **PostgreSQL** hosted on [Vercel](https://book-blaze-project.vercel.app/).  
Make sure you have a valid database URL. In your `.env` file, add:

```env
DATABASE_URL=postgres://<username>:<password>@<host>:<port>/<database>


# JWT Secret
JWT_SECRET=your_jwt_secret

# External APIs
GOOGLE_BOOKS_API_KEY=your_api_key
```
