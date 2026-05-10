import sql from 'mssql'
import dotenv from 'dotenv'

dotenv.config()

// Create configuration
const config = process.env.DATABASE_URL || {
    server: process.env.MYSQL_HOST, // Keep legacy env vars fallback if needed
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_DATABASE_PASSWORD, 
    database: process.env.MYSQL_DATABASE,
    options: {
        encrypt: true, // For Azure
        trustServerCertificate: false
    }
}

// Create a connection pool promise
const poolPromise = new sql.ConnectionPool(config)
    .connect()
    .then(pool => {
        console.log('Connected to MSSQL')
        return pool
    })
    .catch(err => console.log('Database Connection Failed! Bad Config: ', err))

export async function getCars(){
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM cars`
    return result.recordset
}

export async function getCar(id){
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM cars WHERE idCar = ${id}`
    return result.recordset[0]
}
