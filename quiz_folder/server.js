const express = require('express');
const { Pool } = require('pg');
const path = require('path');
const cors = require('cors');

// Create an express app
const app = express();

// Set the port for the server
const port = 3000;

// Configure PostgreSQL connection using pg
const pool = new Pool({
  user: 'postgres',       // Replace with your DB username
  host: 'localhost',      // If your DB is on localhost
  database: 'postgres',   // Replace with your DB name
  password: 'new_password', // Replace with your DB password
  port: 5432,             // Default PostgreSQL port
});

// Enable CORS (optional)
app.use(cors());

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname)));

// Serve the main HTML file at the root route
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html')); // Ensure the path matches your project structure
});

// API route to get categories
app.get('/categories', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM category');
    res.json(result.rows);  // Send the categories as a JSON response
  } catch (err) {
    console.error(err);
    res.status(500).send('Database error');
  }
});

// API route to get questions for a specific category
app.get('/questions/:categoryId', async (req, res) => {
  const { categoryId } = req.params; // Get categoryId from URL parameters
  try {
    const result = await pool.query('SELECT * FROM questions WHERE Category_id = $1', [categoryId]);

    if (result.rows.length === 0) {
      return res.status(404).send('No questions found for this category');
    }

    res.json(result.rows);  // Send the questions as a JSON response
  } catch (err) {
    console.error(err);
    res.status(500).send('Database error');
  }
});

// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
