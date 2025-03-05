import React from "react";
import { motion } from "framer-motion";
import "./About.css";
import Features from "../components/Features";

const About = () => {
  return (
    <motion.div
      className="about-container"
      initial={{ opacity: 0, y: 50 }}
      animate={{ opacity: 1, y: 0 }}
      exit={{ opacity: 0, y: -50 }}
      transition={{ duration: 0.8, ease: "easeInOut" }}
    >
      <h1>About</h1>
      <motion.p
        initial={{ opacity: 0, x: -20 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ delay: 0.2 }}
      >
        Welcome to <strong>Focusly</strong>, your AI-Powered Productivity Hub.
      </motion.p>

      <motion.p
        initial={{ opacity: 0, x: 20 }}
        animate={{ opacity: 1, x: 0 }}
        transition={{ delay: 0.4 }}
      >
        Focusly helps you manage your <strong>Tasks</strong>, track your <strong>Habits</strong>, and gain personalized insights through AI-Powered Summaries.
      </motion.p>

      <motion.div className="about-section">
        {/* <h2>Our Features</h2>
        <ul>
          <motion.li
            whileHover={{ scale: 1.05 }}
            transition={{ type: "spring", stiffness: 100 }}
          >
            Task Management
          </motion.li>
          <motion.li
            whileHover={{ scale: 1.05 }}
            transition={{ type: "spring", stiffness: 100 }}
          >
            Habit Tracking with Streaks
          </motion.li>
          <motion.li
            whileHover={{ scale: 1.05 }}
            transition={{ type: "spring", stiffness: 100 }}
          >
            AI Productivity Insights
          </motion.li>
          <motion.li
            whileHover={{ scale: 1.05 }}
            transition={{ type: "spring", stiffness: 100 }}
          >
            Timer-Based Task Reminders
          </motion.li>
          <motion.li
            whileHover={{ scale: 1.05 }}
            transition={{ type: "spring", stiffness: 100 }}
          >
            Export Tasks & Habits as CSV
          </motion.li>
        </ul> */}
        
      </motion.div>

      <motion.p
        initial={{ opacity: 0, y: 30 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.6 }}
      >
        Focusly is designed by <strong>Banuka Rajapaksha</strong> to boost productivity and help users build positive habits.
      </motion.p>

      {/* <div className="contact-link">
        <a href="/contact">Get in Touch →</a>
      </div> */}
    </motion.div>
  );
};

export default About;