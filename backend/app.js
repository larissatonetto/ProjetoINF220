const express = require('express')
const mariadb = require('mariadb')
const handlebars = require('express-handlebars')


const app = express()
const port = process.env.PORT || 5000

app.use (express.urlencoded({extended: false}))
app.use(express.json()) 

//MariaDB
const connection = mariadb.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'elComprador'
})


//HandleBars
app.engine('handlebars',handlebars({defaultLayout: 'main'}))
app.set('view engine', 'handlebars')

//Rotas
app.get('/registro-cliente', (req,res) =>{
    res.render('cliente')
})

app.post('/addCliente', (req,res) =>{
    res.send('Nome: '+req.body.nome)
})

app.listen(port, () => console.log(`Listening on port ${port}`))