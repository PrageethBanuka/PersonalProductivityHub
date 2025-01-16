import React from "react";
import {
  Nav,
  NavLink,
  Bars,
  NavMenu,
  NavBtn,
  NavBtnLink,
  Logo,
} from "./navbarElements";

import { CircleCheckBig } from "lucide-react";
import { BtnLink } from "../Global/ButtonLink";
import logo from "./logo.png"

const Navbar = () => {
  return (
    <>
      <Nav>
        <Bars />

        <NavMenu>
          <Logo to="/">
            <img src={logo} alt="FOCUSLY" width="150px" height="auto"></img>
          </Logo>

          <NavLink to="/Task">Tasks</NavLink>
          <NavLink to="/Habits" activeStyle>
            Habits
          </NavLink>
          <NavLink to="/AIInsights" activeStyle>
            AI Insights
          </NavLink>
          <NavLink to="/Pricing" activeStyle>
            Pricing
          </NavLink>

          <NavLink to="/signup" activeStyle>
            Sign Up
          </NavLink>
          {/* Second Nav */}
          
        </NavMenu>
        <NavBtn>
            <BtnLink to="/signin">Sign In</BtnLink>
          </NavBtn>
      </Nav>
    </>
  );
};

export default Navbar;
