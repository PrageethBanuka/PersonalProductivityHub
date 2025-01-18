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
  cursor: url("src/components/Hero/custom-cursor.png"), auto;
  cursor: none;

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
  .background::before {
    content: "";
    position: absolute;
    top: var(--cursor-y, 50%);
    left: var(--cursor-x, 50%);
    width: 50px;
    height: 50px;
    border-radius: 50%;
    /* background: radial-gradient(
      circle,
      rgba(0, 0, 0, 0.6) 0%,
      transparent 100%
    ); */
    background-color:rgba(12, 12, 12, 0.8);
    backdrop-filter: blur(3px);
    pointer-events: none; /* Ensure no interference with clicks */
    transform: translate(-50%, -50%);
    border: 0.1px solid rgba(0, 0, 0, 0.2);
    mask-effect: invert;
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
    filter: blur(3px);
    transition: filter 0.5s ease-in-out;
  }
  h1:hover {
    scale: 1.001;
    filter: blur(0.4px);
    opacity: 80%;
  }
  .title {
    position: relative;
    font-size: 8rem;
    font-weight:bold;
    margin-bottom: 1rem;
    /* filter: blur(2.5px); */
    scale: 1.001;
    transition: filter 0.5s ease-in-out;
    z-index: 1;
    opacity: 0.6;
    @media screen and (max-width: 768px) {
    font-size: 4rem;
  }
  }
  .title:hover {
    scale: 1;
    /* filter: blur(0.4px); */
    /* opacity: 80%; */
  }

  p {
    font-size: 1.25rem;
    margin-bottom: 2rem;
    width: 50%;
    text-align: center;
  }

  /* Button */
  button {
    position: absolute;
    border-radius: 4px;
    background: #0c0c0c;
    padding: 10px 22px;
    color: #fcfcfc;
    outline: none;
    border: none;
    cursor: pointer;
    transition: all 0.2s ease-in-out;
    text-decoration: none;
    width: fit-content;
    margin-left: auto;
    margin-right: auto;
    /* Second Nav */
    &:hover {
      transition: all 0.2s ease-in-out;
      background: rgb(196, 195, 195);
      color: #fff;
      position: relative;
      z-index: 1; /* Ensure it's clickable and above all layers */
      cursor: pointer;
    }
    
  }
  .Btn {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  width: 100%; /* Ensure it spans the full width of the parent */
  margin-left: -24px;
  margin-right: auto;
  
  height: fit-content; /* Ensure height only depends on the content */
}
`;
