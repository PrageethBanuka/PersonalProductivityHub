// src/components/Task/taskList.js
import React from "react";
import { useTasks } from "../../context/taskContext";
import TaskItem from "./taskItem";

const TaskList = () => {
  const { tasks } = useTasks();

  return (
    <div className="task-list">
      {tasks.length > 0 ? (
        tasks.map((task) => <TaskItem key={task.id} task={task} />)
      ) : (
        <p>No tasks available</p>
      )}
    </div>
  );
};

export default TaskList;