import React, { useState } from "react";
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
  Hamburger,
  MobileNav
} from "./navbarElements";
import logo from "./logo.png";

const Navbar = () => {
  const [menuOpen, setMenuOpen] = useState(false);
  const location = useLocation();
  const avatar = localStorage.getItem("user.avatar");
  const token = localStorage.getItem("token");

  return (
    <>
      <Nav>
        <Logo to="/">
          <img src={logo} alt="FOCUSLY" width="300px" height="auto" />
        </Logo>
        <Hamburger className="hamburger" onClick={() => setMenuOpen(!menuOpen)}>
          <span />
          <span />
          <span />
        </Hamburger>
      </Nav>
      {/* Desktop Nav */}
      <BottomNav>
        <NavMenu>
          <NavLink to="/" isActive={location.pathname === "/"}>Home</NavLink>
          <NavLink to="/Task" isActive={location.pathname === "/Task"}>Tasks</NavLink>
          <NavLink to="/Habits" isActive={location.pathname === "/Habits"}>Habits</NavLink>
          <NavLink to="/Insights" isActive={location.pathname === "/Insights"}>AI Insights</NavLink>
          <NavLink to="/About" isActive={location.pathname === "/About"}>About</NavLink>
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
      {/* Mobile Nav */}
      <MobileNav className={menuOpen ? "open" : ""}>
        <NavMenu>
          <NavLink to="/" isActive={location.pathname === "/"} onClick={() => setMenuOpen(false)}>Home</NavLink>
          <NavLink to="/Task" isActive={location.pathname === "/Task"} onClick={() => setMenuOpen(false)}>Tasks</NavLink>
          <NavLink to="/Habits" isActive={location.pathname === "/Habits"} onClick={() => setMenuOpen(false)}>Habits</NavLink>
          <NavLink to="/Insights" isActive={location.pathname === "/Insights"} onClick={() => setMenuOpen(false)}>AI Insights</NavLink>
          <NavLink to="/About" isActive={location.pathname === "/About"} onClick={() => setMenuOpen(false)}>About</NavLink>
          {token ? (
            avatar ? (
              <AvatarNavLink to="/Profile" onClick={() => setMenuOpen(false)}>
                <img src={avatar} alt="Avatar" />
              </AvatarNavLink>
            ) : (
              <NavLink to="/Profile" isActive={location.pathname === "/Profile"} onClick={() => setMenuOpen(false)}>Profile</NavLink>
            )
          ) : (
            <NavLink to="/signin" isActive={location.pathname === "/signin"} onClick={() => setMenuOpen(false)}>Sign In</NavLink>
          )}
        </NavMenu>
      </MobileNav>
    </>
  );
};

export default Navbar;
