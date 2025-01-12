const express = require("express");
const cors = require("cors");
const { PrismaClient } = require("@prisma/client");
const dotenv = require("dotenv");

dotenv.config();
const app = express();
const prisma = new PrismaClient();
const PORT = process.env.PORT || 5001;



// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use("/auth", require("./routes/auth")(prisma));

// Start Server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});

const errorHandler = require("./middlewares/errorHandler");

app.use(errorHandler);