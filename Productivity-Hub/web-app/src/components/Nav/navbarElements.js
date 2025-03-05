import { NavLink as Link } from "react-router-dom";
import styled from "styled-components";
import { motion } from "framer-motion";

export const Nav = styled.nav`
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(10px);
  padding: 1rem 0;
`;

export const Logo = styled(Link)`
  display: flex;
  justify-content: center;
  align-items: center;
  text-decoration: none;
`;

export const BottomNav = styled.div`
  position: fixed;
  bottom: 30px;
  left: 50%;
  transform: translateX(-50%);
  width: 50%;
  max-width: 600px;
  background: transparent;
  backdrop-filter: blur(15px);
  border-radius: 30px;
  box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.2);
  padding: 1rem;
  display: flex;
  justify-content: center;
  z-index: 999;

  @media screen and (max-width: 768px) {
    display: none;
  }
`;

export const NavMenu = styled.div`
  display: flex;
  justify-content: center;
  gap: 1rem;
  position: relative;
`;

export const NavLink = styled(Link)`
  color: ${(props) => (props.isActive ? "#fcfcfc" : "#808080")};
  background-color: ${(props) => (props.isActive ? "rgba(0,0,0,0.5)" : "transparent")};
  text-decoration: none;
  padding: 0.5rem 1rem;
  font-size: 1rem;
  font-weight: 500;
  border-radius: 20px;
  position: relative;

  &:hover {
    color: ${(props) => (props.isActive ? "#fcfcfc" : "#555")};
  }
`;

export const BtnLink = styled(Link)`
  padding: 0.5rem 1rem;
  background: #0c0c0c;
  color: #fff;
  border-radius: 20px;
  text-decoration: none;
  font-weight: bold;
  transition: background-color 0.2s;
  &:hover {
    color: #fff;
    background: #333;
  }
`;

export const Indicator = styled(motion.div)`
  display: none;
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 20px; /* Default width; dynamically adjusted */
  height: 5px;
  background: #0c0c0c;
  border-radius: 4px;
  z-index: 1;
`;

export const AvatarNavLink = styled(Link)`
  width: 40px;
  height: 40px;
  border-radius: 50%;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
  border: 2px solid #ddd;
  cursor: pointer;
  background-color: #f9f9f9;

  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
`;

export const PlaceholderNavLink = styled(Link)`
  color: #555;
  font-size: 16px;
  font-weight: 500;
  text-decoration: none;
  cursor: pointer;
  padding: 0.5rem 1rem;
  border-radius: 8px;

  &:hover {
    color: #000;
  }
`;
