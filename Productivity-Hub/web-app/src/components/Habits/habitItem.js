import React from "react";
import "./habitItem.css";
import { Btn } from "../Global/Button";
import { Trash2 } from "lucide-react";

const HabitItem = ({ habit, onUpdate, onDelete }) => {
  const incrementStreak = () => {
    if (habit.streak < habit.goal) {
      onUpdate(habit.id, {
        ...habit,
        streak: habit.streak + 1,
        completed: habit.streak + 1 >= habit.goal, // Mark habit as completed if the goal is reached
      });
    }
  };

  const progressPercentage = Math.min(
    (habit.streak / habit.goal) * 100,
    100
  ).toFixed(2);

  return (
    <div className="habit-item">
      <div className="habit-header">
        <h3 className="habit-name">{habit.text}</h3>
        <button
          className="delete-button"
          onClick={() => onDelete(habit.id)}
          aria-label={`Delete habit ${habit.text}`}
        >
          <Trash2/>
        </button>
      </div>

      <div className="progress-container">
        <div className="progress-bar" style={{ width: `${progressPercentage}%` }}></div>
      </div>

      <p className="streak-info">
        Streak: <strong>{habit.streak}</strong> / Goal: <strong>{habit.goal}</strong>
      </p>

      <Btn
        className="check-in-button"
        onClick={incrementStreak}
        disabled={habit.streak >= habit.goal}
        aria-label={habit.streak >= habit.goal ? "Succeed!" : "Check In"}
      >
        {habit.streak >= habit.goal ? "Succeed!" : "Check In"}
      </Btn>
    </div>
  );
};

export default HabitItem;
