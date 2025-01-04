import styled from "styled-components";
import { NavLink as Link } from "react-router-dom";

export const BtnLink = styled(Link)`
  border-radius: 4px;
  z-index:1;
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
`;