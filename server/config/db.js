const { Client } = require('pg')  // Import Client from 'pg'

// Directly define your credentials here
const client = new Client({
  user: 'postgres',  // Your DB username
  host: 'localhost',  // Your DB host (e.g., 'localhost')
  database: 'traffic_violations',  // Your DB name
  password: 'Akoto@2015',  // Your DB password
  port: 5432,  // Your DB port (usually 5432 for PostgreSQL)
})

client.connect()
  .then(() => {
    console.log('Database connected successfully!')
  })
  .catch((err) => {
    console.error('Database connection error', err.stack)
  })

module.exports = client  // Export the client instance for use in other files
