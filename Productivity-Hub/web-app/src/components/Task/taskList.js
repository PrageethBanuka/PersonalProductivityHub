import React, { useState } from "react";
import TaskItem from "./taskItem";
import "./taskList.css";

const TaskList = ({ tasks, onToggleTaskCompletion, onDeleteTask, onSetTimer }) => {
  const [filter, setFilter] = useState("All");

  const filteredTasks = tasks.filter((task) => {
    if (filter === "All") return true;
    if (filter === "Completed") return task.completed;
    if (filter === "Pending") return !task.completed;
    return true;
  });

  return (
    <div className="task-list-container">
      <div className="filter-container">
        <button
          className={`filter-btn ${filter === "All" ? "active" : ""}`}
          onClick={() => setFilter("All")}
        >
          All
        </button>
        <button
          className={`filter-btn ${filter === "Completed" ? "active" : ""}`}
          onClick={() => setFilter("Completed")}
        >
          Completed
        </button>
        <button
          className={`filter-btn ${filter === "Pending" ? "active" : ""}`}
          onClick={() => setFilter("Pending")}
        >
          Pending
        </button>
      </div>
      {filteredTasks.map((task) => (
        <TaskItem
          key={task.id}
          task={task}
          onToggleTaskCompletion={onToggleTaskCompletion}
          onDeleteTask={onDeleteTask}
          onSetTimer={onSetTimer}
        />
      ))}
    </div>
  );
};

export default TaskList;
