
import styled from "styled-components";



export const Btn = styled.button`
  border-radius: 4px;
  background: #0c0c0c;
  padding: 10px 22px;
  color: #fcfcfc;
  outline: none;
  border: none;
  cursor: pointer;
  z-index:1;
  transition: all 0.2s ease-in-out;
  text-decoration: none;
  /* Second Nav */
  margin-left: 24px;
  &:hover {
    transition: all 0.2s ease-in-out;
    background-color: #555555;
    color: #fff;
  }
`;