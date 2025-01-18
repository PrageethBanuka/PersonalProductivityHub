const express = require("express");
const jwt = require("jsonwebtoken");

module.exports = (prisma) => {
  const router = express.Router();
  const SECRET_KEY = process.env.SECRET_KEY || "Banuka@2002";

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

  // Fetch all tasks for the authenticated user
  router.get("/", authenticate, async (req, res) => {
    const { filter } = req.query;

    try {
      const where = { userId: req.user.id };
      if (filter === "completed") where.completed = true;
      if (filter === "pending") where.completed = false;

      const tasks = await prisma.task.findMany({
        where,
        orderBy: { createdAt: "desc" },
      });

      res.json(tasks);
    } catch (error) {
      res.status(500).json({ message: "Error fetching tasks", error: error.message });
    }
  });

  // Create a new task for the authenticated user
  router.post("/", authenticate, async (req, res) => {
    const { text } = req.body;

    if (!text) return res.status(400).json({ message: "Task text is required" });

    try {
      const newTask = await prisma.task.create({
        data: { text, userId: req.user.id },
      });
      res.status(201).json(newTask);
    } catch (error) {
      res.status(500).json({ message: "Error creating task", error: error.message });
    }
  });

  // Update a task
  router.put("/:id", authenticate, async (req, res) => {
    const { id } = req.params;
    const { text, completed, timer } = req.body;

    try {
      const updatedTask = await prisma.task.updateMany({
        where: { id: parseInt(id), userId: req.user.id },
        data: { text, completed, timer },
      });

      if (updatedTask.count === 0) {
        return res.status(404).json({ message: "Task not found" });
      }

      res.json(updatedTask);
    } catch (error) {
      res.status(500).json({ message: "Error updating task", error: error.message });
    }
  });

  // Delete a task
  router.delete("/:id", authenticate, async (req, res) => {
    const { id } = req.params;

    try {
      const deletedTask = await prisma.task.deleteMany({
        where: { id: parseInt(id), userId: req.user.id },
      });

      if (deletedTask.count === 0) {
        return res.status(404).json({ message: "Task not found" });
      }

      res.status(204).send();
    } catch (error) {
      res.status(500).json({ message: "Error deleting task", error: error.message });
    }
  });

  return router;
};
