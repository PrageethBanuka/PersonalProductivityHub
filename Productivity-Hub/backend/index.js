const express = require("express");
const cors = require("cors");
const { PrismaClient } = require("@prisma/client");
const dotenv = require("dotenv");

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


// New route to fetch user profile data
app.get("/api/user", async (req, res) => {
  try {
    // Assuming you want the user with ID = 1 for now
    const user = await prisma.user.findUnique({
      where: {
        id: parseInt(id, 10), // Modify this ID based on your requirement or make it dynamic
      },
    });

    if (user) {
      res.json(user); // Respond with the user data as JSON
    } else {
      res.status(404).json({ message: "User not found" }); // Handle case when user is not found
    }
  } catch (err) {
    console.error("Error fetching user data:", err);
    res.status(500).json({ message: "Failed to fetch user data" }); // Handle server errors
  }
});

// Error Handler Middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send({ message: "Something went wrong!" });
});

// Start Server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});

// Get all habits
app.get("/api/habits", async (req, res) => {
  try {
    const habits = await prisma.habit.findMany();
    res.json(habits);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch habits." });
  }
});

// Create a new habit
app.post("/api/habits", async (req, res) => {
  const { name, goal } = req.body;
  try {
    const newHabit = await prisma.habit.create({
      data: { name, goal },
    });
    res.status(201).json(newHabit);
  } catch (error) {
    res.status(500).json({ error: "Failed to add habit." });
  }
});

// Update a habit
app.put("/api/habits/:id", async (req, res) => {
  const { id } = req.params;
  const { name, streak, goal } = req.body;
  try {
    const updatedHabit = await prisma.habit.update({
      where: { id: parseInt(id) },
      data: { name, streak, goal },
    });
    res.json(updatedHabit);
  } catch (error) {
    res.status(404).json({ error: "Habit not found." });
  }
});

// Delete a habit
app.delete("/api/habits/:id", async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.habit.delete({
      where: { id: parseInt(id) },
    });
    res.status(204).send();
  } catch (error) {
    res.status(404).json({ error: "Habit not found." });
  }
});

