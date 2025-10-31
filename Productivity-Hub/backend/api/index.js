const express = require('express');
const app = require('../index');

// Wrap the main Express app under /api so routes like /auth become /api/auth on Vercel
const wrapper = express();
wrapper.use('/api', app);

// Export a (req, res) handler compatible with Vercel Node functions
module.exports = (req, res) => {
	wrapper.handle(req, res);
};
