// components/Navbar/navbarElements.js

import { FaBars } from "react-icons/fa";
import { NavLink as Link } from "react-router-dom";
import styled from "styled-components";

export const Nav = styled.nav`
  position: fixed;
  top: 0;
  width: 100%;
  background: rgba(255, 255, 255, 0.9);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid rgba(62, 62, 62, 0.23);
  z-index: 1000;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.5rem 2rem;
`;

export const NavLink = styled(Link)`
  color: #808080;
  display: flex;
  text-align: center;
  align-items: center;
  text-decoration: none;
  padding: 1rem 1rem;
  height: 100%;
  cursor: pointer;
  font-weight: 500;
  &.active {
    color: #0c0c0c;
  }
  &:hover {
    color: #0c0c0c;
  }
  @media screen and (max-width: 768px) {
    display: none;
  }
`;
export const Logo = styled(Link)`
  color: #0c0c0c;
  font-size: 2rem;
  align-items: center;
  text-decoration: none;
  font-weight: bold;
  padding: 0 1rem;
  height: 100%;
  display: flex;
  left: 50px;
  @media screen and (max-width: 768px) {
    left: 0px;
    padding: 0;
  }
`;

export const Bars = styled(FaBars)`
  display: none;
  color: #0c0c0c;
  @media screen and (max-width: 768px) {
    display: block;
    position: absolute;
    top: 10px;
    right: 80px;
    transform: translate(-100%, 75%);
    font-size: 1.8rem;
    cursor: pointer;
    align-content:center;
  }
    
`;

export const NavMenu = styled.div`
  display: flex;
  margin-left: 0;
  /* Second Nav */
  /* margin-right: 24px; */
  /* Third Nav */
  /* width: 100vw;
  white-space: nowrap; */
`;

export const NavBtn = styled.nav`
  display: flex;
  align-items: center;
  float: right;
  margin-right: 50px;
  /* Third Nav */
  /* justify-content: flex-end;
  width: 100vw; */
  @media screen and (max-width: 768px) {
    display: none;
  }
`;

export const NavBtnLink = styled(Link)`
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
`;
