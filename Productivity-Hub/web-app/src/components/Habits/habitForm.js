import React, { useState } from "react";
import "./habitForm.css";

const HabitForm = ({ onAdd }) => {
  const [name, setName] = useState("");
  const [goal, setGoal] = useState(7);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (name.trim() !== "" && goal > 0) {
      onAdd({ name, goal, streak: 0 });
      setName("");
      setGoal(7);
    }
  };

  return (
    <form className="habit-form" onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Add a new habit"
        value={name}
        onChange={(e) => setName(e.target.value)}
      />
      <input
        type="number"
        min="1"
        value={goal}
        onChange={(e) => setGoal(Number(e.target.value))}
        placeholder="Goal (e.g., 7)"
      />
      <button type="submit">+ Add Habit</button>
    </form>
  );
};

export default HabitForm;
