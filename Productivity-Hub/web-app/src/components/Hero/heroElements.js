import styled from "styled-components";

export const HeroContainer = styled.section`
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  text-align: center;
  background: #fcfcfc;
  color: #0c0c0c;

  h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
  //   background: -webkit-linear-gradient(-65deg,#eee, #333);
  // -webkit-background-clip: text;
  // -webkit-text-fill-color: transparent;
  }

  p {
    font-size: 1.25rem;
    margin-bottom: 2rem;
  }

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
    }
  }
`;
