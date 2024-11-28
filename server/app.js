// app.js
const express = require('express')
const pool = require('./config/db')  // Import the pool from db.js
const app = express()
const port = 3000

// Middleware to handle JSON requests
app.use(express.json())

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

// Example route to post data to the database
app.post('/api/data', (req, res) => {
  const { data } = req.body

  // Insert data into the database
  pool.query('INSERT INTO your_table_name (data_column) VALUES ($1)', [data], (err, result) => {
    if (err) {
      console.error('Error executing insert', err.stack)
      res.status(500).json({ error: 'Failed to insert data' })
    } else {
      res.status(201).json({ message: 'Data inserted successfully' })
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
