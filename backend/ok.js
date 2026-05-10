import { getCar, getCars } from './database.js';
import cors from 'cors';
import express from "express";

const app = express();

const port = process.env.PORT || 7000;

app.use(express.json());
app.use(cors());

app.get('/', (req, res) => {
    res.send("Server Running");
});

app.get('/Supercars', async (req, res) => {
    const cars = await getCars();
    res.send(cars);
});

app.get('/Supercars/:id', async (req, res) => {

    const id = req.params.id;

    const car = await getCar(id);

    res.send(car);

});

app.listen(port, () => {
    console.log(`listening on port ${port}`);
});