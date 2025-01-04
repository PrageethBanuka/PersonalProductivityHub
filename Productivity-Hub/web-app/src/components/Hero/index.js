import React, { useState } from "react";
import { HeroContainer } from "./heroElements";
import { BtnLink } from "../Global/ButtonLink";
import { Btn } from "../Global/Button";

const Hero = () => {
  const [cursorPos, setCursorPos] = useState({ x: "50%", y: "50%" });

  const handleMouseMove = (event) => {
    const { clientX, clientY } = event;
    const { left, top } = event.currentTarget.getBoundingClientRect();

    // Calculate cursor position relative to the container
    const x = ((clientX - left) / event.currentTarget.offsetWidth) * 100;
    const y = ((clientY - top) / event.currentTarget.offsetHeight) * 100;

    setCursorPos({ x: `${x}%`, y: `${y}%` });
  };

  return (
    <HeroContainer
      style={{
        "--cursor-x": cursorPos.x,
        "--cursor-y": cursorPos.y,
      }}
      onMouseMove={handleMouseMove}
    >
      
      <h1>Your personal productivity companion</h1>
      <p>
        Seamlessly manage tasks, build habits, and get AI-powered insights to
        boost your productivity. Available on web and desktop, always in sync.
      </p>
      <BtnLink to="/signup">Get Started Free</BtnLink>
      <div className="background" />
    </HeroContainer>
  );
};

export default Hero;