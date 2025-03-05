// filename - App.js

import React, { Suspense, lazy, useState, useEffect } from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import Navbar from "./components/Nav";
import "./App.css";

import { TaskProvider } from "./context/taskContext"; // TaskProvider for Task page
import { AuthProvider } from "./context/authProvider"; // Add AuthProvider
import Footer from "./components/Footer/footer";
import About from "./pages/About";

// Lazy loading for better performance
const Home = lazy(() => import("./pages"));
const Task = lazy(() => import("./pages/Task"));
const Habits = lazy(() => import("./pages/Habits"));
const Insights = lazy(() => import("./pages/Insights"));
const Pricing = lazy(() => import("./pages/Pricing"));
const SignUp = lazy(() => import("./pages/signup"));
const SignIn = lazy(() => import("./pages/signin"));
const Profile = lazy(() => import("./pages/Profile"));

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [avatar, setAvatar] = useState("/default-avatar.png");

  useEffect(() => {
    const token = localStorage.getItem("token");
    const savedAvatar = localStorage.getItem("avatar");
    if (token) {
      setIsAuthenticated(true);
      if (savedAvatar) {
        setAvatar(savedAvatar);
      }
    }
  }, []);

  const handleLogin = (avatar) => {
    setIsAuthenticated(true);
    setAvatar(avatar || "/public/images/user.png");
  };

  const handleLogout = () => {
    setIsAuthenticated(false);
    setAvatar("/public/images/user.png");
  };
  const [isDarkTheme, setIsDarkTheme] = useState(false);

  const toggleTheme = () => {
    const root = document.documentElement; // Access <html> element
    if (isDarkTheme) {
      root.classList.remove("dark-theme");
    } else {
      root.classList.add("dark-theme");
    }
    setIsDarkTheme(!isDarkTheme);
  };
  useEffect(() => {
    const cursor = document.querySelector(".custom-cursor");

    // Update cursor position
    const moveCursor = (e) => {
      const { clientX: x, clientY: y } = e;
      cursor.style.left = `${x}px`;
      cursor.style.top = `${y}px`;
    };

    // Add hover effect
    const addHoverEffect = () => cursor.classList.add("active");
    const removeHoverEffect = () => cursor.classList.remove("active");

    // Attach event listeners
    window.addEventListener("mousemove", moveCursor);
    document.querySelectorAll("button, a").forEach((el) => {
      el.addEventListener("mouseenter", addHoverEffect);
      el.addEventListener("mouseleave", removeHoverEffect);
    });

    // Cleanup event listeners
    return () => {
      window.removeEventListener("mousemove", moveCursor);
      document.querySelectorAll("button, a").forEach((el) => {
        el.removeEventListener("mouseenter", addHoverEffect);
        el.removeEventListener("mouseleave", removeHoverEffect);
      });
    };
  }, []);


  return (
    <div>
    <div className="custom-cursor"></div>
    <AuthProvider>
      <Router>
        <Navbar
          isAuthenticated={isAuthenticated}
          avatar={avatar}
          onLogout={handleLogout}
        />
        {/* Suspense fallback for lazy-loaded components */}
        <Suspense fallback={<div>Loading...</div>}>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route
              path="/Task"
              element={
                <TaskProvider>
                  <Task />
                </TaskProvider>
              }
            />
            <Route path="/Habits" element={<Habits />} />
            <Route path="/Insights" element={<Insights />} />
            <Route path="/About" element={<About />} />
            <Route path="/signup" element={<SignUp />} />
            <Route path="/signin" element={<SignIn onLogin={handleLogin} />} />
            <Route
              path="/Profile"
              element={<Profile setAvatar={setAvatar} />}
            />
          </Routes>
        </Suspense>
        <Footer/>
      </Router>
    </AuthProvider>
    </div>
  );
}

export default App;
