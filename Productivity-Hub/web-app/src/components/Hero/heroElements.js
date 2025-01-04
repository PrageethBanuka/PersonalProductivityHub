import styled from "styled-components";

// Hero container styled component
export const HeroContainer = styled.section`
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  text-align: center;
  background: #fcfcfc;
  color: #0c0c0c;
  overflow: hidden;

  /* Grid Background */
  &::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: transparent;
    pointer-events: none;
    z-index: -1; /* Behind the content */
    transition: background 0.5s ease;
  }

  /* Grid Animation on Hover */
  &:hover::before {
    background: radial-gradient(circle, rgba(0, 0, 0, 0.98) 1px, transparent 1px) 0 0 / 40px 40px; /* Increase grid size */
    animation: gridAnimation 1.5s infinite;
  }

  /* Grid Animation Keyframe */
  @keyframes gridAnimation {
    0% {
      transform: scale(1);
    }
    50% {
      transform: scale(1.1);
    }
    100% {
      transform: scale(1);
    }
  }

  /* Ensuring Content is in Front */
  h1, p, button {
    position: relative; /* Add relative positioning to ensure it's above the grid */
    z-index: 1; /* Place the text and button above the grid background */
  }

  h1 {
    font-size: 4rem;
    margin-bottom: 1rem;
    /* Optional gradient text */
    // background: -webkit-linear-gradient(-65deg, #eee, #333);
    // -webkit-background-clip: text;
    // -webkit-text-fill-color: transparent;
  }

  p {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    width: 50%;
    text-align: center;
  }
`;