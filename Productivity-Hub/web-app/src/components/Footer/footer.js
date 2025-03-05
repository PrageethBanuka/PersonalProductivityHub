import React from "react";
import "./Footer.css";
import My_Logo from "./My Logo.jpeg"
import { Link } from "react-router-dom";

const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer-content">
        <p>Focusly © {new Date().getFullYear()} | Design by<a href="https://prageethbanuka.github.io/Portfolio/">Banuka Rajapaksha</a>| All Rights Reserved</p>
        <nav>
          <a href="/about">About</a>
          <a href="/contact">Contact</a>
          <a href="/privacy">Privacy Policy</a>
        </nav>
        <div className="my-logo"><img alt="" src = {My_Logo} width="150px"/></div>
      </div>
    </footer>
  );
};

export default Footer;