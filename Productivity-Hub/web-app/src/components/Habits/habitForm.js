import React, { useState } from "react";
import { Btn } from "../Global/Button";

const HabitForm = ({ onAddHabit }) => {
  const [habitName, setHabitName] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (habitName.trim()) {
      onAddHabit({ name: habitName, streak: 0, maxStreak: 7 });
      setHabitName("");
    }
  };

  return (
    <form onSubmit={handleSubmit} className="habit-form">
      <input
        type="text"
        placeholder="Add a new habit"
        value={habitName}
        onChange={(e) => setHabitName(e.target.value)}
      />
      <Btn type="submit" className="add-habit-btn">
        + Add Habit
      </Btn>
    </form>
  );
};

export default HabitForm;