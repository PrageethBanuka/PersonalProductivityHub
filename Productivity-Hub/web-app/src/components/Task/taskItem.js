import React, { useState, useEffect } from "react";
import { useTasks } from "../../context/taskContext";
import "./taskItem.css";
import { Link } from "react-router-dom";
import {  Trash2, Timer, Check } from "lucide-react";
import Popup from "reactjs-popup";

const TaskItem = ({ task }) => {
  const { toggleTaskCompletion, deleteTask, setTimer } = useTasks();
  const [selectedTime, setSelectedTime] = useState("");
  const [remainingTime, setRemainingTime] = useState("");

  // Update the countdown for active timers
  useEffect(() => {
    if (!task.timer) return;

    const updateRemainingTime = () => {
      const now = Date.now();
      const timeLeft = task.timer - now;

      if (timeLeft > 0) {
        const days = Math.floor(timeLeft / (1000 * 60 * 60 * 24));
        const hours = Math.floor(
          (timeLeft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
        );
        const minutes = Math.floor((timeLeft % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((timeLeft % (1000 * 60)) / 1000);

        var timer ;

        if (days > 0) {
          timer = `${days}d `;

        }
        else if (hours > 0) {
          timer = `${hours}h ${minutes}m`;
        }
        else {
          timer = `${minutes}m ${seconds}s `;
        }

        setRemainingTime(timer);
      } else {
        setRemainingTime("Time's up!");
      }
    };

    updateRemainingTime(); // Initial update
    const interval = setInterval(updateRemainingTime, 1000);

    return () => clearInterval(interval); // Cleanup
  }, [task.timer]);

  const handleSetTimer = () => {
    const timerDate = new Date(selectedTime).getTime();
    if (timerDate > Date.now()) {
      setTimer(task.id, timerDate);
    } else {
      alert("Please select a valid future time.");
    }
  };

  return (
    <div className={`task-item ${task.completed ? "task-completed" : ""}`}>
      <input
        type="checkbox"
        checked={task.completed}
        onChange={() => toggleTaskCompletion(task.id)}
      />

      <span className={task.completed ? "completed" : "not-completed"}>
        {task.text}
      </span>

      {task.timer && (
        <div className="task-timer">
          <span>{remainingTime}</span>
        </div>
      )}

      <div className="task-actions">
        <Popup
          trigger={
            <Link>
              <Timer className="Timer_ico"/>
            </Link>
          }
          position={"bottom center"}
        >
          <div className="popup-content">
            {/* <label>Set Timer: </label> */}
            <input
              type="datetime-local"
              value={selectedTime}
              onChange={(e) => setSelectedTime(e.target.value)}
              placeholder=""
              className="DatePicker"
            />
            <div className="SetTimer">
              <Link onClick={handleSetTimer}>
                <Check className="Check_ico"/>
              </Link>
            </div>
          </div>
        </Popup>

        <Link onClick={() => deleteTask(task.id)}>
          <Trash2 className="X_ico"/>
        </Link>
      </div>
    </div>
  );
};

export default TaskItem;
