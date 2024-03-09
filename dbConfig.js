const { Pool } = require('pg');

// Create a new Pool instance to manage database connections
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'AirTribedataBase',
    password: 'manish',
    port: 5432 // PostgreSQL default port
});

// Test the database connection
pool.connect((err, client, release) => {
    if (err) {
        console.error('Error acquiring client', err.stack);
        return;
    }
    console.log('Connected to PostgreSQL database');
    release();
});

module.exports = pool