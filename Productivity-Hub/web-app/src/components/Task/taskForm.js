import React, { useState } from "react";
import "./taskForm.css";
import { Btn } from "../Global/Button";


const TaskForm = ({ onAddTask }) => {
  const [task, setTask] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (task.trim()) {
      onAddTask(task);
      setTask("");
    }
  };

  return (
    <form className="task-form" onSubmit={handleSubmit}>
      <input
        type="text"
        placeholder="Add a new task"
        value={task}
        onChange={(e) => setTask(e.target.value)}
      />
      <Btn type="submit">+ Add Task</Btn>
    </form>
  );
};

export default TaskForm;
