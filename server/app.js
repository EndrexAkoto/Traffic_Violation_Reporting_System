const express = require('express')
const { Client } = require('pg')
const app = express()

// PostgreSQL client setup
const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
})

client.connect()
  .then(() => {
    console.log('Database connected successfully!')
  })
  .catch((err) => {
    console.error('Database connection error', err.stack)
  })

// Your routes and middleware
app.get('/', (req, res) => {
  res.send('Hello World!')
})

// Add your other routes or logic here

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`)
})
