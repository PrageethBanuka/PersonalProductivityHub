import React, { useState } from "react";
import "./habitForm.css";
import { Btn } from "../Global/Button";

const HabitForm = ({ onAdd }) => {
  const [text, setText] = useState("");
  const [goal, setGoal] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (text.trim() && goal > 0) {
      onAdd({ text, goal });
      setText("");
      setGoal(1);
    }
  };

  return (
    <form className="habit-form" onSubmit={handleSubmit}>
      <input
        className="habit-input"
        type="text"
        placeholder="Add a new habit"
        value={text}
        onChange={(e) => setText(e.target.value)}
      />
      <input
        className="goal-input"
        type="number"
        placeholder="Goal (e.g., 7 days)"
        value={goal}
        onChange={(e) => setGoal(Number(e.target.value))}
        min="1"
      />
      <Btn type="submit">+ Add Habit</Btn>
    </form>
  );
};

export default HabitForm;
