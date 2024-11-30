const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const pool = require('../config/db');  // Assuming db.js is in the same directory
const router = express.Router();

// Middleware to verify JWT
const verifyToken = (req, res, next) => {
  const token = req.header('auth-token');
  if (!token) return res.status(401).send('Access Denied');
  
  try {
    const verified = jwt.verify(token, 'your_jwt_secret'); // Use your JWT secret here
    req.user = verified;  // Attach user to the request
    next();
  } catch (err) {
    res.status(400).send('Invalid Token');
  }
};

// 1. User Registration Route
router.post('/register', async (req, res) => {
  const { username, email, password } = req.body;

  // Hash password before saving to DB
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash(password, salt);

  try {
    const result = await pool.query(
      'INSERT INTO users (username, email, password_hash) VALUES ($1, $2, $3) RETURNING *',
      [username, email, hashedPassword]
    );

    res.status(201).json({
      message: 'User registered successfully!',
      user: result.rows[0]
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// 2. User Login Route
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  try {
    const result = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
    const user = result.rows[0];

    if (!user) {
      return res.status(400).send('User not found');
    }

    // Compare password with stored hash
    const validPassword = await bcrypt.compare(password, user.password_hash);
    if (!validPassword) {
      return res.status(400).send('Invalid password');
    }

    // Create and assign a token
    const token = jwt.sign({ id: user.id }, 'your_jwt_secret', { expiresIn: '1h' });

    res.json({
      message: 'Logged in successfully!',
      token: token
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// 3. Protected Route Example (using JWT middleware)
router.get('/dashboard', verifyToken, async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM violations WHERE user_id = $1', [req.user.id]);
    res.json({
      message: 'Welcome to your dashboard!',
      violations: result.rows
    });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// Close the database connection when the server is shut down
process.on('exit', () => {
  pool.end();
});

module.exports = router;
