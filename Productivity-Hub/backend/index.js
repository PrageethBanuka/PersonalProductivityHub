const express = require("express");
const cors = require("cors");
const { PrismaClient } = require("@prisma/client");
const dotenv = require("dotenv");
const insightsRouteFactory = require("./models/insights");

dotenv.config(); // Load environment variables from .env file
const app = express();
const prisma = new PrismaClient();
const PORT = process.env.PORT || 5001;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use("/auth", require("./routes/auth")(prisma)); // Authentication routes
app.use("/tasks", require("./models/tasks")(prisma)); // Tasks routes
app.use("/user", require("./routes/user")(prisma));
app.use("/habits", require("./models/habits")(prisma));
app.use("/insights", insightsRouteFactory(prisma));
app.get("/", (req, res) => {
  res.send("Focusly API is Running 🚀");
});
app.get("/auth", (req, res) => {
  res.send("Auth Success 🚀");
});


// New route to fetch user profile data
// Deprecated: /api/user (use /user/profile instead)
// app.get("/api/user", async (req, res) => { /* removed - use /user/profile */ });

// Error Handler Middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send({ message: "Something went wrong!" });
});

// Export the app for serverless; only listen when run directly
if (require.main === module) {
  app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
  });
}

module.exports = app;

// Note: Habit routes moved to /habits with auth in models/habits.js

