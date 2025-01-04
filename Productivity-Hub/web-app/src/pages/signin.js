import React from "react";
import './signup.css'; 

const SignIn = () => {
  return (
    <div className="signup-container">
      <div className="signup-box">
        <h2 className="signup-title">Sign in</h2>
        <form className="signup-form">
          <div className="form-group">
            <label htmlFor="email">Email address</label>
            <input id="email" name="email" type="email" required />
          </div>
          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input id="password" name="password" type="password" required />
          </div>
          <div className="checkbox-group">
            <input type="checkbox" id="remember-me" />
            <label htmlFor="remember-me">Remember me</label>
          </div>
          <button type="submit" className="signup-button">Sign in</button>
        </form>
        <p className="signup-footer">
          Don't have an account?{" "}
          <a href="/signup">Sign Up</a>
        </p>
      </div>
    </div>
  );
};

export default SignIn;