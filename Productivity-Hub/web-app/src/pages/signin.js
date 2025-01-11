import React, { useState } from "react";
import "./signin.css";
import { loginUser } from "../Services/api"; // Replace with your actual API service

const SignIn = () => {
  const [formData, setFormData] = useState({
    email: "",
    password: "",
  });

  const [errorMessage, setErrorMessage] = useState(""); // General errors
  const [fieldErrors, setFieldErrors] = useState({}); // Field-specific errors
  const [showError, setShowError] = useState(false); // Animation trigger

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validateFields = () => {
    const errors = {};
    if (!formData.email) errors.email = "Email is required.";
    if (!formData.password) errors.password = "Password is required.";
    return errors;
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setErrorMessage(""); // Clear previous errors
    setFieldErrors({}); // Clear field-specific errors
    setShowError(false); // Reset animation

    const validationErrors = validateFields();
    if (Object.keys(validationErrors).length > 0) {
      setFieldErrors(validationErrors);
      setShowError(true); // Trigger animation
      return;
    }

    try {
      const response = await loginUser(formData); // Call your API
      alert(response.message); // Notify user on success
    } catch (error) {
      const serverError = error.response?.data?.message || "Login failed.";
      setErrorMessage(serverError);
      setShowError(true); // Trigger animation

      // Handle field-specific errors from backend
      if (error.response?.data?.field) {
        setFieldErrors({ [error.response.data.field]: serverError });
      }
    }
  };

  return (
    <div className="signin-container">
      <div className="signin-box">
        <h2 className="signin-title">Sign In</h2>
        {errorMessage && (
          <p className={`error-message ${showError ? "fade-in" : ""}`}>
            {errorMessage}
          </p>
        )}
        <form className="signin-form" onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="email">Email address</label>
            <input
              id="email"
              name="email"
              type="email"
              onChange={handleChange}
              className={fieldErrors.email ? "input-error" : ""}
            />
            {fieldErrors.email && (
              <p className={`field-error ${showError ? "fade-in" : ""}`}>
                {fieldErrors.email}
              </p>
            )}
          </div>
          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input
              id="password"
              name="password"
              type="password"
              onChange={handleChange}
              className={fieldErrors.password ? "input-error" : ""}
            />
            {fieldErrors.password && (
              <p className={`field-error ${showError ? "fade-in" : ""}`}>
                {fieldErrors.password}
              </p>
            )}
          </div>
          <button type="submit" className="signin-button">
            Sign In
          </button>
        </form>
        <p className="signin-footer">
          Don’t have an account? <a href="/signup">Sign up</a>
        </p>
      </div>
    </div>
  );
};

export default SignIn;