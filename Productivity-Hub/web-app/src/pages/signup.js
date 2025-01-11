import React, { useState } from "react";
import "./signup.css";
import { registerUser } from "../Services/api";

const SignUp = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    password: "",
    confirmPassword: "",
    username: "",
  });

  const [errorMessage, setErrorMessage] = useState(""); // For general errors
  const [fieldErrors, setFieldErrors] = useState({}); // For field-specific errors
  const [showError, setShowError] = useState(false); // Animation trigger

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const validateFields = () => {
    const errors = {};
    if (!formData.name) errors.name = "Name is required.";
    if (!formData.username) errors.username = "Username is required.";
    if (!formData.email) errors.email = "Email is required.";
    if (!formData.password) errors.password = "Password is required.";
    if (formData.password !== formData.confirmPassword) {
      errors.confirmPassword = "Passwords do not match.";
    }
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
      const response = await registerUser(formData);
      alert(response.message); // Notify user on success
    } catch (error) {
      const serverError = error.response?.data?.message || "Registration failed.";
      setErrorMessage(serverError);
      setShowError(true); // Trigger animation

      // Handle specific field errors from the backend
      if (error.response?.data?.field) {
        setFieldErrors({ [error.response.data.field]: serverError });
      }
    }
  };

  return (
    <div className="signup-container">
      <div className="signup-box">
        <h2 className="signup-title">Create your account</h2>
        {errorMessage && (
          <p className={`error-message ${showError ? "fade-in" : ""}`}>
            {errorMessage}
          </p>
        )}
        <form className="signup-form" onSubmit={handleSubmit}>
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input
              id="name"
              name="name"
              type="text"
              onChange={handleChange}
              className={fieldErrors.name ? "input-error" : ""}
            />
            {fieldErrors.name && (
              <p className={`field-error ${showError ? "fade-in" : ""}`}>
                {fieldErrors.name}
              </p>
            )}
          </div>
          <div className="form-group">
            <label htmlFor="username">Username</label>
            <input
              id="username"
              name="username"
              type="text"
              onChange={handleChange}
              className={fieldErrors.username ? "input-error" : ""}
            />
            {fieldErrors.username && (
              <p className={`field-error ${showError ? "fade-in" : ""}`}>
                {fieldErrors.username}
              </p>
            )}
          </div>
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
          <div className="form-group">
            <label htmlFor="confirmPassword">Confirm Password</label>
            <input
              id="confirmPassword"
              name="confirmPassword"
              type="password"
              onChange={handleChange}
              className={fieldErrors.confirmPassword ? "input-error" : ""}
            />
            {fieldErrors.confirmPassword && (
              <p className={`field-error ${showError ? "fade-in" : ""}`}>
                {fieldErrors.confirmPassword}
              </p>
            )}
          </div>
          <button type="submit" className="signup-button">
            Sign up
          </button>
        </form>
        <p className="signup-footer">
          Already have an account? <a href="/signin">Sign in</a>
        </p>
      </div>
    </div>
  );
};

export default SignUp;