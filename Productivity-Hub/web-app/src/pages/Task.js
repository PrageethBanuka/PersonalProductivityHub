import React, { useState, useEffect } from "react";
import "./Task.css";
import TaskForm from "../components/Task/taskForm";
import TaskList from "../components/Task/taskList";
import { motion } from "framer-motion";

function Task() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  // Fetch tasks from the backend
  const fetchTasks = async () => {
    setLoading(true);
    setError("");
    try {
      const response = await fetch("http://localhost:5001/tasks");
      if (!response.ok) {
        throw new Error("Failed to fetch tasks");
      }
      const data = await response.json();
      setTasks(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  // Add a new task
  const addTask = async (taskText) => {
    try {
      const response = await fetch("http://localhost:5001/tasks", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ text: taskText }),
      });
      if (!response.ok) {
        throw new Error("Failed to create task");
      }
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  // Toggle task completion
  const toggleTaskCompletion = async (taskId, completed) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ completed }),
      });
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  // Set timer for a task
  const setTimer = async (taskId, timer) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ timer: new Date(timer).toISOString() }),
      });
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  // Delete a task
  const deleteTask = async (taskId) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "DELETE",
      });
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  useEffect(() => {
    fetchTasks();
  }, []);

  return (
    <motion.div
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
      <h1>Tasks</h1>
      <div className="task-container">
        {error && <p className="error">{error}</p>}
        <TaskForm onAddTask={addTask} />
        <TaskList
          tasks={tasks}
          onToggleTaskCompletion={toggleTaskCompletion}
          onDeleteTask={deleteTask}
          onSetTimer={setTimer}
        />
      </div>
    </motion.div>
  );
}

export default Task;
