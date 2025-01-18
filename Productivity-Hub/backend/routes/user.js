const express = require("express");
const jwt = require("jsonwebtoken");
const authMiddleware = require("../middlewares/auth");

module.exports = (prisma) => {
  const router = express.Router();
  const SECRET_KEY = process.env.SECRET_KEY || "Banuka@2002";

  // Fetch user profile
  router.get("/profile", authMiddleware, async (req, res) => {
    try {
      const user = await prisma.user.findUnique({
        where: { id: req.user.id },
        select: { id: true, name: true, email: true, username: true, avatar: true },
      });
      res.json(user);
    } catch (error) {
      res.status(500).json({ message: "Error fetching profile", error: error.message });
    }
  });

  // Update avatar
  router.put("/profile/avatar", authMiddleware, async (req, res) => {
    const { avatar } = req.body;
    try {
      const updatedUser = await prisma.user.update({
        where: { id: req.user.id },
        data: { avatar },
      });
      res.json(updatedUser);
    } catch (error) {
      res.status(500).json({ message: "Error updating avatar", error: error.message });
    }
  });

  return router;
};
