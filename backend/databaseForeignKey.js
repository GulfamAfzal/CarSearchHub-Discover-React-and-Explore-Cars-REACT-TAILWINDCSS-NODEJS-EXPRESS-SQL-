import sql from 'mssql'
import dotenv from 'dotenv'

dotenv.config()

// Create configuration
const config = process.env.DATABASE_URL || {
    server: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_DATABASE_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    options: {
        encrypt: true, // For Azure SQL
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

export async function getCars() {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM cars`
    return result.recordset
}

export async function getCar(id) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM cars WHERE Car_ID = ${id}`
    return result.recordset[0]
}

// export async function addCar{Name_Car,Marque_Car,Color_Car}
// const [result] = await pool.query(`INSERT INTO cars (idCar,Name_Car,Marque_Car,Color_Car) VALUES)`,[Name_Car,Marque_Car,]

export async function getClients() {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * From client`
    return result.recordset
}

export async function getCategories() {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM categories`
    return result.recordset
}

export async function getClient(id) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM client where Client_ID = ${id} `
    return result.recordset[0]
}

export async function getclientCar(id) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT cars.Car_ID,cars.Car_Name,cars.Car_Marque,cars.Car_Matricule,cars.Car_Color,cars.Car_img, cars.img1, cars.img2, cars.img3 , cars.Car_likes, client.Client_ID,client.Client_Name,client.Client_Email,client.Client_Phone ,client.Client_Pic FROM cars INNER JOIN client on cars.Client_ID = client.Client_ID WHERE client.Client_ID = ${id}`
    if (result.recordset.length > 0) {
        return result.recordset[0]
    } else {
        return []
    }
}

export async function getAllCarData(id) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT cars.Car_ID, cars.Car_Name, cars.Car_Marque, cars.Car_Matricule, cars.Car_Color, cars.Car_img, cars.img1, cars.img2, cars.img3 , cars.Car_likes, client.Client_ID, client.Client_Name, client.Client_Email, client.Client_Phone, client.Client_Pic ,categories.Categorie_ID , categories.Categorie_Name  from cars JOIN client ON cars.Client_ID = client.Client_ID JOIN categories ON cars.Categorie_ID = categories.Categorie_ID WHERE cars.Car_ID = ${id}`
    return result.recordset[0]
}

export async function getCategorieData(id) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT cars.Car_ID ,cars.Car_Name, cars.Car_Marque,cars.Car_Matricule,cars.Car_img, cars.img1, cars.img2, cars.img3, cars.Car_likes ,categories.Categorie_Name from cars JOIN categories on cars.Categorie_ID = categories.Categorie_ID WHERE categories.Categorie_ID = ${id}`
    return result.recordset[0]
}

export async function registerClient(name, surname, email, phone, password) {
    const pool = await poolPromise
    const result = await pool.request().query`INSERT INTO client (Client_Name, Client_Surname, Client_Email, Client_Phone, Client_Password) VALUES ( ${name}, ${surname}, ${email}, ${phone}, ${password}); SELECT SCOPE_IDENTITY() AS insertId;`
    return result.recordset[0].insertId; // Return the ID of the newly inserted client
}

export async function checkEmailExists(email) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT count (*) as count from client where Client_Email= ${email}`
    return result.recordset[0].count > 0
}

export async function authenticateClient(emailAuth, passwordAuth) {
    const pool = await poolPromise
    const result = await pool.request().query`SELECT * FROM client WHERE Client_Email = ${emailAuth} AND Client_Password = ${passwordAuth}`
    return result.recordset[0]; // Return the client if found, otherwise undefined
}

export async function updateLikes(carId, newLikes) {
    try {
        const pool = await poolPromise
        await pool.request().query`UPDATE cars SET Car_likes = ${newLikes} WHERE Car_ID = ${carId}`
        return true; // Return true if the update was successful
    } catch (error) {
        console.error(error);
        return false; // Return false if there was an error
    }
}


