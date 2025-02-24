import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Habits.css";
import HabitForm from "../components/Habits/habitForm";
import HabitItem from "../components/Habits/habitItem";
import { motion } from "framer-motion";

function Habits() {
  const [habits, setHabits] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      navigate("/signin");
    }
  }, [navigate]);

  const fetchHabits = async () => {
    setLoading(true);
    setError("");
    try {
      const response = await fetch("http://localhost:5001/habits", {
        headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
      });
      if (!response.ok) throw new Error("Failed to fetch habits");
      const data = await response.json();
      setHabits(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const addHabit = async (habit) => {
    try {
      await fetch("http://localhost:5001/habits", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify(habit),
      });
      fetchHabits();
    } catch (err) {
      setError(err.message);
    }
  };

  const updateHabit = async (habitId, updatedHabit) => {
    try {
      await fetch(`http://localhost:5001/habits/${habitId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify(updatedHabit),
      });
      fetchHabits();
    } catch (err) {
      setError(err.message);
    }
  };

  const deleteHabit = async (habitId) => {
    try {
      await fetch(`http://localhost:5001/habits/${habitId}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
      });
      fetchHabits();
    } catch (err) {
      setError(err.message);
    }
  };

  useEffect(() => {
    fetchHabits();
  }, []);

  return (
    <motion.div
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
      <h1>Habits</h1>
      <div className="habit-container">
        {error && <p className="error">{error}</p>}
        <HabitForm onAdd={addHabit} />
        <div className="habit-list">
          {loading ? (
            <p>Loading...</p>
          ) : (
            habits.map((habit) => (
              <HabitItem
                key={habit.id}
                habit={habit}
                onUpdate={updateHabit}
                onDelete={deleteHabit}
              />
            ))
          )}
        </div>
      </div>
    </motion.div>
  );
}

export default Habits;
