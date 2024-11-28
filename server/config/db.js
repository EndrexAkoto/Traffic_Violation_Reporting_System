const { Client } = require('pg')
require('dotenv').config()

// Set up the PostgreSQL client
const client = new Client({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
})

// Connect to the database
client.connect()
  .then(() => {
    console.log('Database connected successfully!')
    client.end() // Close the connection
  })
  .catch(err => {
    console.error('Database connection error:', err.stack)
    client.end() // Ensure to close connection on error
  })

module.exports = client
