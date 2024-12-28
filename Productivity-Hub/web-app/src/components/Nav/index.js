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

import {CircleCheckBig } from 'lucide-react'

const Navbar = () => {
    return (
        <>
            <Nav>
                <Bars />
                
                <NavMenu>
                <Logo to = "/"><CircleCheckBig/> Focusly</Logo>
                    
                    <NavLink to="/Task" >
                        Tasks
                    </NavLink>
                    <NavLink to="/Habits" activeStyle>
                        Habits
                    </NavLink>
                    <NavLink to="/AIInsights" activeStyle>
                        AI Insights
                    </NavLink>
                    <NavLink to="/Pricing" activeStyle>
                        Pricing
                    </NavLink>
                    
                    <NavLink to="/sign-up" activeStyle>
                        Sign Up
                    </NavLink>
                    {/* Second Nav */}
                    {/* <NavBtnLink to='/sign-in'>Sign In</NavBtnLink> */}
                </NavMenu>
                <NavBtn>
                    <NavBtnLink to="/signin">
                        Sign In
                    </NavBtnLink>
                </NavBtn>
            </Nav>
        </>
    );
};

export default Navbar;