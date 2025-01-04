import React from "react";
import HabitItem from "./habitItem";

const HabitList = ({ habits, onCheckIn }) => {
  return (
    <div className="habit-list">
      {habits.map((habit) => (
        <HabitItem
          key={habit.name}
          habit={habit}
          onCheckIn={onCheckIn}
        />
      ))}
    </div>
  );
};

export default HabitList;