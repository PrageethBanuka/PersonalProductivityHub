import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./signin.css";
import { loginUser } from "../Services/api"; // API services
import { motion } from "framer-motion";

const DEFAULT_AVATAR = "TopHat"; // Default avatar style for new users

const SignIn = () => {
  const [formData, setFormData] = useState({ email: "", password: "" });
  const [errorMessage, setErrorMessage] = useState(""); // General error message
  const [fieldErrors, setFieldErrors] = useState({}); // Field-specific errors
  const [showError, setShowError] = useState(false); // Animation trigger
  const navigate = useNavigate();

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
    setErrorMessage("");
    setFieldErrors({});
    setShowError(false);

    const validationErrors = validateFields();
    if (Object.keys(validationErrors).length > 0) {
      setFieldErrors(validationErrors);
      setShowError(true);
      return;
    }

    try {
      const response = await loginUser(formData); // Call login API
      localStorage.setItem("token", response.token); // Store JWT
      localStorage.setItem("avatar", response.user.avatar || DEFAULT_AVATAR); // Set default or stored avatar
      navigate("/"); // Redirect to Task page
    } catch (error) {
      const serverError = error.response?.data?.message || "Login failed.";
      setErrorMessage(serverError);
      setShowError(true);

      if (error.response?.data?.field) {
        setFieldErrors({ [error.response.data.field]: serverError });
      }
    }
  };

  return (
    <motion.div
      initial={{ opacity: 0, filter: "blur(10px)" }}
      animate={{ opacity: 1, filter: "blur(0px)" }}
      exit={{ opacity: 0, filter: "blur(10px)" }}
      transition={{ duration: 0.5, ease: "easeInOut" }}
    >
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
    </motion.div>
  );
};

export default SignIn;
