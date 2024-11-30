const express = require('express');
const router = express.Router();
const pool = require('../config/db'); // Database connection

// Middleware to verify JWT token (authentication)
const { verifyToken } = require('../middleware/auth');

// Get user profile
router.get('/', verifyToken, async (req, res) => {
    try {
        const userId = req.user.id; // Extract user id from JWT
        const result = await pool.query('SELECT id, username, email, profile_pic FROM users WHERE id = $1', [userId]);
        if (result.rows.length > 0) {
            res.json(result.rows[0]); // Send user profile data
        } else {
            res.status(404).json({ message: 'User not found' });
        }
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

// Update user profile
router.put('/', verifyToken, async (req, res) => {
    const { username, email, profile_pic } = req.body;
    const userId = req.user.id;

    try {
        const result = await pool.query(
            'UPDATE users SET username = $1, email = $2, profile_pic = $3 WHERE id = $4 RETURNING *',
            [username, email, profile_pic, userId]
        );
        res.json(result.rows[0]); // Return updated profile
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

module.exports = router;
