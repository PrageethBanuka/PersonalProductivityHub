const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const router = express.Router();
const SECRET_KEY = process.env.SECRET_KEY || "Banuka@2002";

module.exports = (prisma) => {
  // User Registration
  router.post("/register", async (req, res) => {
    const { name, email, password, username } = req.body;

    // Validate user input
    if (!name || !email || !password || !username) {
      return res.status(400).json({ message: "All fields are required." });
    }

    try {
      // Check if email or username already exists
      const existingUser = await prisma.user.findFirst({
        where: {
          OR: [{ email }, { username }],
        },
      });
      if (existingUser) {
        if (existingUser.email === email) {
          return res
            .status(400)
            .json({ message: "This email is already registered. Please use a different email." });
        }
        if (existingUser.username === username) {
          return res
            .status(400)
            .json({ message: "This username is already taken. Please choose another username." });
        }
      }

      // Hash the password
      const hashedPassword = await bcrypt.hash(password, 10);

      // Create user
      const user = await prisma.user.create({
        data: { name, email, password: hashedPassword, username },
      });

      res.status(201).json({ message: "User registered successfully!" });
    } catch (error) {
      console.error("Error during registration:", error.message);
      res.status(500).json({ message: "Something went wrong. Please try again later." });
    }
  });

  // User Login
  router.post("/login", async (req, res) => {
    const { email, password } = req.body;

    // Validate user input
    if (!email || !password) {
      return res.status(400).json({ message: "Email and password are required." });
    }

    try {
      // Find user by email
      const user = await prisma.user.findUnique({ where: { email } });
      if (!user) {
        return res.status(400).json({ message: "Invalid email or password." });
      }

      // Compare passwords
      const isValidPassword = await bcrypt.compare(password, user.password);
      if (!isValidPassword) {
        return res.status(400).json({ message: "Invalid email or password." });
      }

      // Generate JWT token
      const token = jwt.sign({ id: user.id }, SECRET_KEY, { expiresIn: "1d" });

      // Respond with success and token
      res.status(200).json({
        message: "Login successful",
        token,
        user: {
          id: user.id,
          email: user.email,
          name: user.name,
          username: user.username,
        },
      });
    } catch (error) {
      console.error("Error during login:", error.message);
      res.status(500).json({ message: "Internal server error" });
    }
  });
  // Middleware to authenticate the user
  const authenticate = (req, res, next) => {
    const token = req.headers.authorization?.split(" ")[1];
    if (!token) {
      return res.status(401).json({ message: "Unauthorized" });
    }
    try {
      const decoded = jwt.verify(token, SECRET_KEY);
      req.user = decoded;
      next();
    } catch (error) {
      res.status(401).json({ message: "Invalid token" });
    }
  };

  // Fetch the authenticated user's profile
  router.get("/profile", authenticate, async (req, res) => {
    try {
      const user = await prisma.user.findUnique({
        where: { id: req.user.id }, // Correct usage of user ID
      });
  
      if (!user) {
        return res.status(404).json({ message: "User not found" });
      }
  
      res.json(user);
    } catch (error) {
      res.status(500).json({ message: "Error fetching user profile", error: error.message });
    }
  });
  

  return router;
};