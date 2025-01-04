import React from "react";
import "./Task.css";

import { TaskForm, TaskList } from "../components/Task";


function Task() {
  return (
    <>
    <h1>Tasks</h1>
    <div className="task-container">
      
      <TaskForm />
      {/* <ul className="task-list">
        <li className="task-item">
          <input type="checkbox" />
          <span className="task-text">Complete project proposal</span>
          <div className="task-actions">
            <Pencil />
            <Calendar />
            <Timer />
            <Trash2 />
          </div>
        </li>
      </ul> */}
      <TaskList />
    </div>
    </>
  );
}

export default Task;
