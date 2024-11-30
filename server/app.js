const express = require('express')
const cors = require('cors')  // Add CORS for cross-origin requests
const pool = require('./config/db')  // Import the pool from db.js
const auth = require('./routes/auth')  // Correct path to auth.js file
const app = express()
const port = 3001

// Middleware to handle JSON requests
app.use(express.json())

// Enable CORS for all domains
app.use(cors())

// Use the authentication routes
app.use('/api', auth)

// Example route to fetch data from the database
app.get('/api/data', (req, res) => {
  pool.query('SELECT * FROM your_table_name', (err, result) => {
    if (err) {
      console.error('Error executing query', err.stack)
      res.status(500).json({ error: 'Database query failed' })
    } else {
      res.status(200).json(result.rows) // Send the result from the query
    }
  })
})

// Start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`)
})

// Gracefully handle server shutdown
process.on('SIGINT', () => {
  pool.end(() => {
    console.log('Database connection pool has ended')
    process.exit(0)
  })
})
