require('dotenv').config();
const { CONNECTION_STRING } = process.env;

const Sequelize = require('sequelize');

const sequelize = new Sequelize(CONNECTION_STRING, {
    dialect: 'postgres',
    dialectOptions: {
        ssl: {
            rejectUnauthorized: false,
        },
    },
});

module.exports = {
    getCountries: (req, res) => {
        sequelize
            .query(
                `
		SELECT * FROM countries;
		`
            )
            .then((dbRes) => {
                console.log(dbRes[0]);
                res.status(200).send(dbRes[0]);
            })
            .catch((err) =>
                console.log('Unable to retrieve countries data.', err)
            );
    },
    createCity: (req, res) => {
        const { name, rating, countryId } = req.body;
        sequelize
            .query(
                `
				INSERT INTO cities (name, rating, country_id)
				VALUES ('${name}, ${rating}, ${countryId})
				`
            )
            .then((dbRes) => {
                res.status(200).send(dbRes[0]);
            })
            .catch((err) =>
                console.log('Unable to create new city entry.', err)
            );
    },
    getCities: (req, res) => {
        sequelize
            .query(
                `
				SELECT cities.city_id, cities.name city, cities.rating, countries.country_id, countries.name country
				FROM countries
				JOIN cities
				ON countries.country_id = cities.country_id
				ORDER BY countries.rating DESC;
				`
            )
            .then((dbRes) => {
                res.status(200).send(dbRes[0]);
            })
            .catch((err) => console.log('Unable to retrieve city data.', err));
    },
    deleteCity: (req, res) => {
        const { id } = req.params;
        sequelize
            .query(
                `
			DELETE
			FROM cities
			WHERE city_id = ${id};
			`
            )
            .then((dbRes) => {
                res.status(200).send(dbRes[0]);
            })
            .catch((err) => console.log('Unable to delete city.', err));
    },
};
