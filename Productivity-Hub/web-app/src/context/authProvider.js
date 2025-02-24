// filename: authProvider.js

import React, { createContext, useState, useContext } from "react";

// Create the AuthContext
export const AuthContext = createContext();

// AuthProvider component that wraps around your app
export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);

  const login = (userData) => {
    setUser(userData);
    localStorage.setItem("token", userData.token); // Store token in localStorage
  };

  const logout = () => {
    setUser(null);
    localStorage.removeItem("token"); // Remove token on logout
  };

  return (
    <AuthContext.Provider value={{ user, setUser, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

// Custom hook to use AuthContext
export const useAuth = () => useContext(AuthContext);
