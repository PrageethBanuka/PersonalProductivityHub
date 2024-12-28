// filename -App.js

import React from "react";
import "./App.css";
import Navbar from "./components/Nav";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages";
import Task from "./pages/Task";
import Habits from "./pages/Habits";
import AIInsights from "./pages/AIInsights";
import Pricing from "./pages/Pricing";

import SignUp from "./pages/signup";

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/Task" element={<Task />} />
        <Route path="/Habits" element={<Habits />} />
        <Route path="/AIInsights" element={<AIInsights />} />
        <Route path="/Pricing" element={<Pricing />} />

        <Route path="/sign-up" element={<SignUp />} />
      </Routes>
    </Router>
  );
}

export default App;
