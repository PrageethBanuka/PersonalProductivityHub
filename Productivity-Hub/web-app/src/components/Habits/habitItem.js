import React from "react";
import "./habitItem.css";

const HabitItem = ({ habit, onUpdate, onDelete }) => {
  const incrementStreak = () => {
    if (habit.streak < habit.goal) {
      onUpdate(habit.id, {
        ...habit,
        streak: habit.streak + 1,
      });
    }
  };

  return (
    <div className="habit-item">
      <div className="habit-header">
        <h3>{habit.name}</h3>
        <button className="delete-button" onClick={() => onDelete(habit.id)}>
          Delete
        </button>
      </div>
      <div className="progress-container">
        <div
          className="progress-bar"
          style={{ width: `${(habit.streak / habit.goal) * 100}%` }}
        ></div>
      </div>
      <p>
        Streak: {habit.streak} / {habit.goal}
      </p>
      <button
        className="check-in-button"
        onClick={incrementStreak}
        disabled={habit.streak >= habit.goal}
      >
        {habit.streak >= habit.goal ? "Goal Achieved!" : "Check In"}
      </button>
    </div>
  );
};

export default HabitItem;
