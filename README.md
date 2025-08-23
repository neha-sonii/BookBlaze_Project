# 📚 BookBlaze

BookBlaze is a full-stack web application for managing and exploring books.  
It includes features like authentication, book CRUD operations, and integration with external APIs.

---

## 🚀 Features
- User authentication (Login/Register)
- Add, update, and delete books
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

# PostgreSQL Database
PG_HOST=HOST_NAME
PG_PORT=DATABASE_PORT
PG_USER=your_username
PG_PASSWORD=your_password
PG_DATABASE=DATABASE_NAME

# JWT Secret
JWT_SECRET=your_jwt_secret

# External APIs
GOOGLE_BOOKS_API_KEY=your_api_key
```
