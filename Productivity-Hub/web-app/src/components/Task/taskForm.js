// src/components/Task/taskForm.js
import React, { useState } from "react";
import { useTasks } from "../../context/taskContext";
import { Btn} from "../Global/Button";
import "./"

const TaskForm = () => {
  const [task, setTask] = useState("");
  const { addTask } = useTasks(); // Correctly destructuring addTask

  const handleSubmit = (e) => {
    console.log("clicked");
    e.preventDefault();
    if (task.trim()) {
      addTask(task); // Call addTask to add the task
      setTask(""); // Clear the input field
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
      <Btn >+ Add Task</Btn>
    </form>
  );
};

export default TaskForm;
