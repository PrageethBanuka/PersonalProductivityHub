// pages/events.js

import React from "react";
import Hero from "../components/Hero/index";
import Features from "../components/Features/index";
import { motion, spring } from "framer-motion";
import { filter } from "framer-motion/client";
import Demo from "../components/DemoSection";

const Events = () => {
  return (
    <motion.div
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut", spring }}
    >
      <div>
        <Hero />
      </div>
      <div>
        <Features />
      </div>
      <div>
        <Demo />
      </div>
    </motion.div>
  );
};

export default Events;
