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

// Lazy loading for better performance
const Home = lazy(() => import("./pages"));
const Task = lazy(() => import("./pages/Task"));
const Habits = lazy(() => import("./pages/Habits"));
const AIInsights = lazy(() => import("./pages/AIInsights"));
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

  return (
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
                isAuthenticated ? (
                  <TaskProvider>
                    <Task />
                  </TaskProvider>
                ) : (
                  <Navigate to="/signin" />
                )
              }
            />
            <Route path="/Habits" element={<Habits />} />
            <Route path="/AIInsights" element={<AIInsights />} />
            <Route path="/Pricing" element={<Pricing />} />
            <Route path="/signup" element={<SignUp />} />
            <Route path="/signin" element={<SignIn onLogin={handleLogin} />} />
            <Route
              path="/Profile"
              element={
                <Profile setAvatar={setAvatar} />
              }
            />
          </Routes>
        </Suspense>
      </Router>
    </AuthProvider>
  );
}

export default App;
