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
        select: {
          id: true,
          name: true,
          email: true,
          username: true,
          avatar: true,
        },
      });
      res.json(user);
    } catch (error) {
      res.status(500).json({ message: "Error fetching profile", error: error.message });
    }
  });

  // Update Profile (name, username, avatar)
  router.put("/profile", authMiddleware, async (req, res) => {
    const { name, username, avatar } = req.body;

    const updateData = {};
    if (name) updateData.name = name;
    if (username) updateData.username = username;
    if (avatar) updateData.avatar = avatar;

    try {
      console.log("Incoming Data:", updateData); // Debug

      const updatedUser = await prisma.user.update({
        where: { id: req.user.id }, // Mokka User Id is correct here
        data: updateData, // Directly passing the object
      });

      console.log("User Updated:", updatedUser);
      res.json(updatedUser);
    } catch (error) {
      console.error("Update Error:", error.message);
      res.status(500).json({ message: "Error updating profile", error: error.message });
    }
  });

  // Update Avatar Only
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