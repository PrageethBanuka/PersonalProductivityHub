import React, { useState, useEffect } from "react";
import "./taskItem.css";
import { Trash2, Timer, Check } from "lucide-react";
import Popup from "reactjs-popup";

const TaskItem = ({ task, onToggleTaskCompletion, onDeleteTask, onSetTimer }) => {
  const [selectedTime, setSelectedTime] = useState("");
  const [remainingTime, setRemainingTime] = useState("");

  useEffect(() => {
    if (!task.timer) return;

    const updateRemainingTime = () => {
      const now = Date.now();
      const timeLeft = new Date(task.timer) - now;

      if (timeLeft > 0) {
        const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
        const hours = Math.floor((timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

        setRemainingTime(
          days > 0 ? `${days}d` : hours > 0 ? `${hours}h ${minutes}m` : `${minutes}m ${seconds}s`
        );
      } else {
        setRemainingTime("Time's up!");
      }
    };

    updateRemainingTime();
    const interval = setInterval(updateRemainingTime, 1000);
    return () => clearInterval(interval);
  }, [task.timer]);

  const handleSetTimer = () => {
    if (new Date(selectedTime) > new Date()) {
      onSetTimer(task.id, selectedTime);
    } else {
      alert("Please select a valid future time.");
    }
  };

  return (
    <div className={`task-item ${task.completed ? "task-completed" : ""}`}>
      <input
        type="checkbox"
        checked={task.completed}
        onChange={() => onToggleTaskCompletion(task.id, !task.completed)}
      />
      <span className={task.completed ? "completed" : "not-completed"}>{task.text}</span>
      {task.timer && <div className="task-timer">{remainingTime}</div>}
      <div className="task-actions">
        <Popup
          trigger={<Timer className="Timer_ico" />}
          position="bottom center"
        >
          <div className="popup-content">
            <input
              type="datetime-local"
              value={selectedTime}
              onChange={(e) => setSelectedTime(e.target.value)}
              className="DatePicker"
            />
            <Check className="Check_ico" onClick={handleSetTimer} />
          </div>
        </Popup>
        <Trash2 className="X_ico" onClick={() => onDeleteTask(task.id)} />
      </div>
    </div>
  );
};

export default TaskItem;
