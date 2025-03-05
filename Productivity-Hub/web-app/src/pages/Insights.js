import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { Btn } from "../components/Global/Button";
import { motion } from "framer-motion";
import { Bar } from "react-chartjs-2";
import "chart.js/auto";
import "./Insights.css";
import ReactMarkdown from "react-markdown";
import ShinyText from "../animations/ShinyText";

const Insights = () => {
  const [userInput, setUserInput] = useState("");
  const [aiResponse, setAiResponse] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [summary, setSummary] = useState(null);
  const [chartData, setChartData] = useState(null);
  const [isGenerating, setIsGenerating] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    if (!localStorage.getItem("token")) {
      navigate("/signin");
    } else {
      fetchSummary();
    }
  }, [navigate]);

  const fetchSummary = async () => {
    setLoading(true);
    setError("");
    try {
      const token = localStorage.getItem("token");
      const response = await axios.get("http://localhost:5001/insights/summary", {
        headers: { Authorization: `Bearer ${token}` },
      });

      setSummary(response.data);
      setChartData({
        labels: ["Tasks", "Habits", "Streak"],
        datasets: [
          {
            label: "Progress",
            data: [response.data.tasksCompleted, response.data.habitsCompleted, response.data.longestStreak],
            backgroundColor: ["#5555", "#5555", "#5555"],
            borderRadius: 8,
          },
        ],
      });
    } catch {
      setError("Failed to fetch summary.");
    } finally {
      setLoading(false);
    }
  };

  const fetchAIResponse = async () => {
    if (!userInput.trim()) return;
    setLoading(true);
    setIsGenerating(true);
    setError("");

    try {
      const token = localStorage.getItem("token");
      const response = await axios.post(
        "http://localhost:5001/insights",
        { userMessage: userInput },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      const formattedResponse = response.data.aiResponse
        .split("\n")
        .filter(line => line.trim() !== "")
        .map((line, index) => ({ id: index, text: line }));

      setAiResponse(formattedResponse);
    } catch {
      setError("Failed to get AI insights.");
    } finally {
      setLoading(false);
      setTimeout(() => setIsGenerating(false), 500);
    }
  };

  return (
    <motion.div
      className="insights-container"
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
      <h1 className="insights-title">AI Insights</h1>

      {loading && <p className="loading-text">Analyzing...</p>}
      {error && <p className="error">{error}</p>}

      {summary && (
        <motion.div
          className="summary-section"
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
        >
          <div className="summary-stats">
            <div className="stat"><span>{summary.tasksCompleted}</span><p>Tasks Done</p></div>
            <div className="stat"><span>{summary.habitsCompleted}</span><p>Habits Completed</p></div>
            <div className="stat"><span>{summary.longestStreak}</span><p>Best Streak</p></div>
          </div>

          <div className="chart-container">
            <Bar data={chartData} />
          </div>
        </motion.div>
      )}

      <div className="chat-box">
        <textarea
          className="chat-input"
          placeholder="Ask AI for productivity tips..."
          value={userInput}
          onChange={(e) => setUserInput(e.target.value)}
        />
        <Btn className="chat-btn" onClick={fetchAIResponse} disabled={loading}>
         <ShinyText text={loading ? "Analyzing..." : "Get Insights"} disabled={false} speed={3} className='custom-class'/> 
        </Btn>
      </div>

      {aiResponse.length > 0 && (
        <motion.div
          className="ai-response"
          initial={{ opacity: 0, scale: 0.9 }}
          animate={{ opacity: 1, scale: 1  }}
          transition={{ duration: 0.3 }}
        >
          <h2>🔍 AI Suggestions</h2>
          <div>
            {aiResponse.map(item => (
              <motion.div
                key={item.id}
                initial={{ opacity: 0, x: -10 ,filter: "blur(10px)"}}
                animate={{ opacity: 1, x: 0 ,filter: "blur(0px)"}}
                transition={{ delay: item.id * 0.2 }}
              >
                <ReactMarkdown
                  components={{
                    p: ({ node, ...props }) => (
                      <p {...props} className={isGenerating ? "glow-text" : ""} />
                    ),
                  }}
                >
                  {item.text}
                </ReactMarkdown>
              </motion.div>
            ))}
          </div>
        </motion.div>
      )}
    </motion.div>
  );
};

export default Insights;