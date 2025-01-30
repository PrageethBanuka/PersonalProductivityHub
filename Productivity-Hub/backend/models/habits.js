const express = require("express");
const router = express.Router();
const authMiddleware = require("../middlewares/auth");

module.exports = (prisma) => {
  // Fetch all habits for the logged-in user
  router.get("/", authMiddleware, async (req, res) => {
    try {
      const habits = await prisma.habit.findMany({
        where: { userId: req.user.id },
        orderBy: { createdAt: "desc" },
      });
      res.json(habits);
    } catch (error) {
      res.status(500).json({ message: "Failed to fetch habits" });
    }
  });

  // Create a new habit
  router.post("/", authMiddleware, async (req, res) => {
    const { text, goal } = req.body;

    if (!text || !goal) {
      return res.status(400).json({ message: "Text and goal are required" });
    }

    try {
      const newHabit = await prisma.habit.create({
        data: { text, goal, streak: 0, userId: req.user.id },
      });
      res.status(201).json(newHabit);
    } catch (error) {
      res.status(500).json({ message: "Failed to create habit" });
    }
  });

  // Update habit streak or completion
  router.put("/:id", authMiddleware, async (req, res) => {
    const { id } = req.params;
    const { streak, completed, goal } = req.body;

    try {
      const updatedHabit = await prisma.habit.update({
        where: { id: parseInt(id) },
        data: { streak, completed, goal },
      });
      res.json(updatedHabit);
    } catch (error) {
      res.status(500).json({ message: "Failed to update habit" });
    }
  });

  // Delete a habit
  router.delete("/:id", authMiddleware, async (req, res) => {
    const { id } = req.params;

    try {
      await prisma.habit.delete({
        where: { id: parseInt(id) },
      });
      res.status(204).send();
    } catch (error) {
      res.status(500).json({ message: "Failed to delete habit" });
    }
  });

  return router;
};
