// Import the required libraries
const promClient = require('prom-client');
const express = require('express');
const app = express();

// Create a register to hold metrics
const register = new promClient.Registry();
promClient.collectDefaultMetrics({ register }); // Collect default system metrics

// Expose the metrics at /metrics endpoint
app.get('/metrics', async (req, res) => {
  res.set('Content-Type', register.contentType); // Set content type to Prometheus format
  res.end(await register.metrics()); // Return the metrics
});

// Set the app to listen on port 3000
app.listen(3000, () => {
  console.log('App running on port 3000');
});
