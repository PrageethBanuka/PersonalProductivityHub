import styled from "styled-components";

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
  cursor: url("src/components/Hero/custom-cursor.png"),auto;

  /* Background Layer */
  .background {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: radial-gradient(#e5e5e5 1px, transparent 1px),
      radial-gradient(#0c0c0c 1px, transparent 1px);
    background-size: 30px 30px;
    background-position: 0 0, 10px 10px;
    z-index: 0; /* Keep it behind the content */
    pointer-events: none; /* Ensure no interference with clicks */
  }

  /* Blur Effect */
  .background::after {
    content: "";
    position: absolute;
    top: var(--cursor-y, 50%);
    left: var(--cursor-x, 50%);
    width: 150px;
    height: 150px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(0, 0, 0, 0.05) 0%, transparent 100%);
    backdrop-filter: blur(3px);
    pointer-events: none; /* Ensure no interference with clicks */
    transform: translate(-50%, -50%);
    border:0.1px solid rgba(0, 0, 0, 0.2);
    mask-effect:invert;
    
  }

  /* Content Styling */
  h1,
  p,
  button {
    position: relative;
    z-index: 1; /* Place above the background */
  }

  h1 {
    font-size: 4rem;
    margin-bottom: 1rem;
  }

  p {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    width: 50%;
    text-align: center;
  }

  /* Button */
  button {
  border-radius: 4px;
  background: #0c0c0c;
  padding: 10px 22px;
  color: #fcfcfc;
  outline: none;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease-in-out;
  text-decoration: none;
  /* Second Nav */
  margin-left: 24px;
  &:hover {
    transition: all 0.2s ease-in-out;
    background: #rgb(196, 195, 195);
    color: #fff;
    position: relative;
    z-index: 1; /* Ensure it's clickable and above all layers */
    cursor: pointer;
  }
`;
