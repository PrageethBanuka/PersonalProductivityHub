import styled from "styled-components";
import { NavLink as Link } from "react-router-dom";

export const BtnLink = styled(Link)`
  border-radius: 20px; 
  z-index:1;
  background: #0c0c0c;
  padding: 10px 22px;
  color: #fcfcfc;
  outline: none;
  border: none;
  cursor: none;
  transition: all 0.2s ease-in-out;
  text-decoration: none;
  height: 20px ;

  /* Second Nav */
  margin-left: 24px;
  &:hover {
    transition: all 0.2s ease-in-out;
    background-color: #555555;
    color: #fff;
  }
`;