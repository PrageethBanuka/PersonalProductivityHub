const serverless = require('serverless-http');
const express = require('express');
const app = require('../index');

// Wrap the main Express app under /api so routes like /auth become /api/auth on Vercel
const wrapper = express();
wrapper.use('/api', app);

module.exports = serverless(wrapper);
