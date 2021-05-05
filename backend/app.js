const express = require('express')
const mariadb = require('mariadb')

const app = express()
const port = process.env.PORT || 5000

app.use (express.urlencoded({extended: false}))
app.use(express.json()) 



//MariaDB

const pool = mariadb.createPool({
    connectionLimit : 10,
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'INF220'
})





//

app.listen(port, () => console.log(`Listening on port ${port}`))