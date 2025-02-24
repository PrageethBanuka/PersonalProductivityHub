const express = require("express");
const axios = require("axios");
const router = express.Router();
const { PrismaClient } = require("@prisma/client");
const authMiddleware = require("../middlewares/auth");

const prisma = new PrismaClient();
require("dotenv").config(); // Load environment variables

// ✅ Mistral API Setup
const MISTRAL_API_URL = "https://api.mistral.ai/v1/chat/completions";
const API_KEY = process.env.MISTRAL_API_KEY; // 🔥 Ensure this is set in .env

// ✅ Fetch task & habit summary
router.get("/summary", authMiddleware, async (req, res) => {
    try {
        const userId = req.user?.id;
        if (!userId) return res.status(401).json({ error: "Unauthorized" });

        const tasksCompleted = await prisma.task.count({ where: { userId, completed: true } });
        const habitsCompleted = await prisma.habit.count({ where: { userId, completed: true } });

        const longestStreak = await prisma.habit.aggregate({
            where: { userId },
            _max: { streak: true },
        });

        res.json({
            tasksCompleted,
            habitsCompleted,
            longestStreak: longestStreak._max.streak || 0,
        });
    } catch (error) {
        console.error("❌ Error fetching summary:", error);
        res.status(500).json({ error: "Failed to fetch summary" });
    }
});

// ✅ AI Response for user input
router.post("/", authMiddleware, async (req, res) => {
    const { userMessage } = req.body;

    if (!userMessage) {
        return res.status(400).json({ error: "Message is required" });
    }

    try {
        const response = await axios.post(
            MISTRAL_API_URL,
            {
                model: "mistral-large-latest", // 🔹 Adjust model if needed
                messages: [{ role: "user", content: userMessage }],
                max_tokens: 10000,
            },
            {
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${API_KEY}`, // 🔥 Ensure API key is added!
                },
            }
        );

        res.json({
            aiResponse: response.data.choices?.[0]?.message?.content || "No response generated.",
        });
    } catch (error) {
        console.error("❌ AI API Error:", error.response?.data || error.message);
        res.status(500).json({ error: "Failed to fetch AI insights." });
    }
});

module.exports = router;