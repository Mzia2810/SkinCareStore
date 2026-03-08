// backend/index.js
require('dotenv').config();
const express = require('express');
const app = express();
const connectDB = require("./src/config/db");
const cookieParser = require('cookie-parser');
const cors = require('cors');

// Middleware
app.use(
  cors({
    origin: [
      "http://localhost:5173", // frontend local
      "https://skin-store-clone-h1p8.vercel.app" // deployed frontend
    ],
    credentials: true,
  })
);
app.use(cookieParser());
app.use(express.json());

// Routes
app.use("/user", require('./src/routes/userRegister'));
app.use("/user", require('./src/routes/login'));
app.use("/user", require('./src/routes/forgotPass'));
app.use("/product", require('./src/routes/getproduct'));
app.use("/product", require('./src/routes/cart'));

// Test Route
app.get('/', (req, res) => {
    res.send('Hello World I am backend from git pipeline ab to chal jaa !');
});

// Connect to MongoDB and start server
const PORT = process.env.PORT || 8000;

connectDB()
  .then(() => {
      console.log("MongoDB connected");
         app.listen(PORT, "0.0.0.0", () => {
          console.log(`Server running on port ${PORT}`);
      });
  })
  .catch((err) => {
      console.error("Failed to connect to MongoDB", err);
      process.exit(1);
  });
