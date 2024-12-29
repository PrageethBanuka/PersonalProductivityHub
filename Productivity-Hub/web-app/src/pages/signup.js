import React from "react";
import './signup.css'; 

const SignUp = () => {
  return (
    <div className="signup-container">
      <div className="signup-box">
        <h2 className="signup-title">Create your account</h2>
        <form className="signup-form">
          <div className="form-group">
            <label htmlFor="email">Email address</label>
            <input id="email" name="email" type="email" required />
          </div>
          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input id="password" name="password" type="password" required />
          </div>
          <div className="form-group">
            <label htmlFor="confirm-password">Confirm Password</label>
            <input id="confirm-password" name="confirm-password" type="password" required />
          </div>
          <div className="checkbox-group">
            <input type="checkbox" id="remember-me" />
            <label htmlFor="remember-me">Remember me</label>
          </div>
          <button type="submit" className="signup-button">Sign up</button>
        </form>
        <p className="signup-footer">
          Already have an account?{" "}
          <a href="/signin">Sign in</a>
        </p>
      </div>
    </div>
  );
};

export default SignUp;