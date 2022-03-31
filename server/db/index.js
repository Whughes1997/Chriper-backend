import * as mysql from 'mysql'


export const Connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'username',
    password: 'password',
    database: 'c16_chirpr',
});


export const Query = (query, values) => {

    return new Promise((resolve, reject) => {
        Connection.query(query, values, (err, res) => {
            if (err) return reject(err);
            return resolve(res)
        });

    });

}

import chirps from "./chirps";

export default {
    chirps
};