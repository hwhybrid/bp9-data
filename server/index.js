require('dotenv').config();
const express = require('express');
const app = express();
const cors = require('cors');
const { seed } = require('./seed');
const { SERVER_PORT } = process.env;
const {
    getCountries,
    getCities,
    createCity,
    deleteCity,
} = require('./controller.js');

app.use(express.json());
app.use(cors());

// // DEV
app.post('/seed', seed);

// COUNTRIES
app.get('/countries', getCountries);

// CITIES
app.post('/cities', createCity)
app.get('/cities', getCities)
app.delete('/cities/:id', deleteCity)

app.listen(SERVER_PORT, () => console.log(`up on ${SERVER_PORT}`));
