import React, { createContext, useContext, useState, useEffect } from "react";

const TaskContext = createContext();

export const useTasks = () => {
  const context = useContext(TaskContext);
  if (!context) {
    throw new Error("useTasks must be used within a TaskProvider");
  }
  return context;
};

export const TaskProvider = ({ children }) => {
  const [tasks, setTasks] = useState([]);

  const addTask = (newTask) => {
    setTasks([...tasks, { id: Date.now(), text: newTask, completed: false, timer: null }]);
  };

  const deleteTask = (id) => {
    setTasks(tasks.filter((task) => task.id !== id));
  };

  const toggleTaskCompletion = (id) => {
    setTasks(
      tasks.map((task) =>
        task.id === id ? { ...task, completed: !task.completed, timer: null } : task
      )
    );
  };

  const setTimer = (id, duration) => {
    setTasks((prevTasks) =>
      prevTasks.map((task) =>
        task.id === id ? { ...task, timer: duration } : task
      )
    );
  };

  const decreaseTimers = () => {
    setTasks((prevTasks) =>
      prevTasks.map((task) => {
        if (task.timer && task.timer > 0) {
          return { ...task, timer: task.timer - 1 };
        }
        return task;
      })
    );
  };

  // Use an effect to create a global timer that ticks every second
  useEffect(() => {
    const interval = setInterval(() => {
      decreaseTimers();
    }, 1000);

    return () => clearInterval(interval); // Cleanup on unmount
  }, []);

  return (
    <TaskContext.Provider
      value={{
        tasks,
        addTask,
        deleteTask,
        toggleTaskCompletion,
        setTimer,
      }}
    >
      {children}
    </TaskContext.Provider>
  );
};
