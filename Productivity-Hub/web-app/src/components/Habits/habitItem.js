import React from "react";
import ProgressBar from "./progressBar";
import { Btn } from "../Global/Button";
import { Zap } from "lucide-react";
import "./habitItem.css";

const HabitItem = ({ habit, onCheckIn }) => {
  return (
    <div className="habit-card">
      <div className="habit-details">
        <h3>{habit.name}</h3>
        <ProgressBar progress={habit.streak} max={habit.maxStreak} />
        <p>
          Streak: {habit.streak} / {habit.maxStreak} days
        </p>
      </div>
      <div className="Text-Wrapper">
        <Btn className="check-in-btn" onClick={() => onCheckIn(habit.name)}>
          <Zap size={10} /> Check In
        </Btn>
      </div>
    </div>
  );
};

export default HabitItem;
