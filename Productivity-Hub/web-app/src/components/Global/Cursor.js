import React, { useState } from "react";
import { motion } from "framer-motion";

const AnimatedCursor = () => {
  const [cursorPos, setCursorPos] = useState({ x: 0, y: 0 });
  const [isHovering, setIsHovering] = useState(false);

  // Mouse move handler
  const handleMouseMove = (e) => {
    setCursorPos({ x: e.clientX, y: e.clientY });
  };

  return (
    <div
      onMouseMove={handleMouseMove}
      style={{
        height: "100vh",
        backgroundColor: "white", // Background for observing inversion
        cursor: "none", // Hide the default cursor
      }}
    >
      {/* Custom Cursor */}
      <motion.div
        animate={{
          x: cursorPos.x - 15, // Offset to center the cursor
          y: cursorPos.y - 15,
          backgroundColor: isHovering ? "black" : "white",
          borderColor: isHovering ? "white" : "black",
        }}
        transition={{
          type: "spring",
          stiffness: 500,
          damping: 30,
        }}
        style={{
          position: "absolute",
          width: 30,
          height: 30,
          borderRadius: "50%",
          border: "2px solid black",
          pointerEvents: "none", // Prevent interaction
          zIndex: 1000,
        }}
      />

      {/* Example Interactive Element */}
      {/* <button
        style={{
          position: "absolute",
          top: "50%",
          left: "50%",
          transform: "translate(-50%, -50%)",
          padding: "10px 20px",
          background: "black",
          color: "white",
          border: "none",
          fontSize: "16px",
          cursor: "default", // Override default cursor
        }}
        onMouseEnter={() => setIsHovering(true)}
        onMouseLeave={() => setIsHovering(false)}
      >
        Hover Me!
      </button> */}
    </div>
  );
};

export default AnimatedCursor;