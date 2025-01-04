// src/components/Task/taskItem.js
import React from "react";
import { useTasks } from "../../context/taskContext";
import { Btn } from "../Global/Button";
import "./taskItem.css";
import { Link } from "react-router-dom";
import { X } from "lucide-react";
const TaskItem = ({ task }) => {
  const { toggleTaskCompletion, deleteTask } = useTasks();

  return (
    <div className="task-item">
      <input
        type="checkbox"
        checked={task.completed}
        onChange={() => toggleTaskCompletion(task.id)}
      />
      
      <span className={task.completed ? "completed" : "not-completed"}>
        {task.text}
      </span>
      <div className="task-actions">
        <Link onClick={() => deleteTask(task.id)}>
          <X />
        </Link>
        
      </div>
    </div>
  );
};

export default TaskItem;
