import axios from "axios";

const API_URL = "http://localhost:5001";

export const registerUser = async (data) => {
  const response = await axios.post(`${API_URL}/auth/register`, data);
  return response.data;
};

export const loginUser = async (data) => {
  const response = await axios.post(`${API_URL}/auth/login`, data);
  return response.data;
};
export const fetchTasks = () => axios.get(`${API_URL}/tasks`);
export const createTask = (task) =>
  axios.post(`${API_URL}/tasks`, { text: task });
export const updateTask = (id, updates) =>
  axios.patch(`${API_URL}/tasks/${id}`, updates);
export const deleteTask = (id) => axios.delete(`${API_URL}/tasks/${id}`);

export const fetchProfile = () =>
  axios.get(`${API_URL}/user/profile`, {
    headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
  });

export const updateAvatar = (avatar) =>
  axios.put(
    `${API_URL}/user/profile/avatar`,
    { avatar },
    { headers: { Authorization: `Bearer ${localStorage.getItem("token")}` } }
  );

export const fetchAIInsights = async () => {
  const response = await axios.get(`${API_URL}/insights`, {
    headers: { Authorization: `Bearer ${localStorage.getItem("token")}` },
  });
  return response.data;
};
