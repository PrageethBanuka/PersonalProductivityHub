import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import "./Task.css";
import TaskForm from "../components/Task/taskForm";
import TaskList from "../components/Task/taskList";
import { motion } from "framer-motion";

function Task() {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem("token");
    if (!token) {
      navigate("/signin"); // Redirect to login if no token
    }
  }, [navigate]);

  const fetchTasks = async () => {
    setLoading(true);
    setError("");
    try {
      const response = await fetch("http://localhost:5001/tasks", {
        headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
      });
      if (!response.ok) throw new Error("Failed to fetch tasks");
      const data = await response.json();
      setTasks(data);
    } catch (err) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const addTask = async (taskText) => {
    try {
      const response = await fetch("http://localhost:5001/tasks", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify({ text: taskText }),
      });
      if (!response.ok) throw new Error("Failed to create task");
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  const toggleTaskCompletion = async (taskId, completed) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify({ completed }),
      });
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  const setTimer = async (taskId, timer) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
        body: JSON.stringify({ timer: new Date(timer).toISOString() }),
      });
      await fetchTasks();
    } catch (err) {
      setError(err.message);
    }
  };

  const deleteTask = async (taskId) => {
    try {
      await fetch(`http://localhost:5001/tasks/${taskId}`, {
        method: "DELETE",
        headers: {
          Authorization: `Bearer ${localStorage.getItem("token")}`,
        },
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
