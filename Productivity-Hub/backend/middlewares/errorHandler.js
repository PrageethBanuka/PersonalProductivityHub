module.exports = (err, req, res, next) => {
    console.error("Error:", err.message);
  
    if (res.headersSent) {
      return next(err);
    }
  
    res.status(err.status || 500).json({
      message: err.message || "Internal server error",
    });
  };