import React from "react";
import { useLocation } from "react-router-dom";
import {
  Nav,
  NavMenu,
  Logo,
  BottomNav,
  NavLink,
  BtnLink,
  Indicator,
  AvatarNavLink,
  PlaceholderNavLink,
} from "./navbarElements";
import logo from "./logo.png";

const Navbar = () => {
  const location = useLocation();
  const avatar = localStorage.getItem("user.avatar");
  const token = localStorage.getItem("token");

  return (
    <>
      <Nav>
        <Logo to="/">
          <img src={logo} alt="FOCUSLY" width="300px" height="auto" />
        </Logo>
      </Nav>
      <BottomNav>
        <NavMenu>
          <NavLink to="/" isActive={location.pathname === "/"}>
            Home
          </NavLink>
          <NavLink to="/Task" isActive={location.pathname === "/Task"}>
            Tasks
          </NavLink>
          <NavLink to="/Habits" isActive={location.pathname === "/Habits"}>
            Habits
          </NavLink>
          <NavLink to="/Insights" isActive={location.pathname === "/Insights"}>
            AI Insights
          </NavLink>
          <NavLink to="/Pricing" isActive={location.pathname === "/Pricing"}>
            Pricing
          </NavLink>
          {token ? (
            avatar ? (
              <AvatarNavLink to="/Profile">
                <img src={avatar} alt="Avatar" />
              </AvatarNavLink>
            ) : (
              <NavLink to="/Profile" isActive={location.pathname === "/Profile"}>Profile</NavLink>
            )
          ) : (
            <NavLink to="/signin" isActive={location.pathname === "/signin"}>Sign In</NavLink>
          )}
          <Indicator />
        </NavMenu>
      </BottomNav>
    </>
  );
};

export default Navbar;
