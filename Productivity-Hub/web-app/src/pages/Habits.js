import React, { useState } from "react";
import HabitForm from "../components/Habits/habitForm";
import HabitList from "../components/Habits/habitList";
import "./Habits.css";

const Habits = () => {
  const [habits, setHabits] = useState([
    { name: "Read for 30 minutes", streak: 5, maxStreak: 7 },
    { name: "Exercise", streak: 3, maxStreak: 5 },
    { name: "Meditate", streak: 1, maxStreak: 7 },
  ]);

  const addHabit = (newHabit) => {
    setHabits((prev) => [...prev, newHabit]);
  };

  const checkInHabit = (name) => {
    setHabits((prev) =>
      prev.map((habit) =>
        habit.name === name
          ? { ...habit, streak: Math.min(habit.streak + 1, habit.maxStreak) }
          : habit
      )
    );
  };

  return (
    <>
      <h1>Habits</h1>
      <div className="habits-container">
        <HabitForm onAddHabit={addHabit} />
        <HabitList habits={habits} onCheckIn={checkInHabit} />
      </div>
    </>
  );
};

export default Habits;
