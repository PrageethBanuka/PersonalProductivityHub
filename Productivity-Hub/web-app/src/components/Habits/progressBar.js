import React from "react";

const ProgressBar = ({ progress, max }) => {
  const percentage = (progress / max) * 100;

  return (
    <div className="progress-bar">
      <div
        className="progress-bar-fill"
        style={{ width: `${percentage}%` }}
      ></div>
    </div>
  );
};

export default ProgressBar;