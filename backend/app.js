const express = require('express')
const mariadb = require('mariadb')
const handlebars = require('express-handlebars')


const app = express()
const port = process.env.PORT || 5000

app.use (express.urlencoded({extended: false}))
app.use(express.json()) 

const pool = mariadb.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'elComprador',
    connectionLimit: 5
});


//HandleBars
app.engine('handlebars',handlebars({defaultLayout: 'main'}))
app.set('view engine', 'handlebars')

//Rotas
app.get('/registro-cliente', (req,res) =>{
    res.render('cliente')
})

//CADASTRO DE CLIENTE
app.post('/addCliente', async(req,res) =>{
    const conn = await pool.getConnection();
    const {nome,sobrenome,celular, email, senha} = req.body
    const {cidade, numero, bairro, rua, complemento, geolocalizacao, UF, apelido} = req.body
    const {tipo, numCartao, nomeTitular, validade, CVV} = req.body

    let result = await conn.query("INSERT INTO `USUARIO` (`nome`, `sobrenome`, `celular`, `email`, `senha`) VALUES (?, ?, ?,?,?);", [nome, sobrenome, celular,email,senha]);
    const idUser = result.insertId
    result = await conn.query("INSERT INTO `CLIENTE` (`idUser`) VALUES (?);", [idUser]);
    const idCliente = result.insertId
    await conn.query("INSERT INTO `ENDERECO`(`idCliente`, `cidade`, `numero`, `bairro`, `rua`, `complemento`, `geolocalizacao`, `UF`, `apelido`) VALUES (?,?,?,?,?,?,?,?,?) ", [idCliente, cidade, numero, bairro, rua, complemento, geolocalizacao, UF, apelido])
    result = await conn.query("INSERT INTO `METODOPAGAMENTO` (`idCliente`) VALUES (?);", [idCliente]);
    const idPagamento = result.insertId
    await conn.query("INSERT INTO `CARTAO` (`idMetodoPagamento`, `tipo`, `numero`, `nomeTitular`, `validade`, `CVV`) VALUES (?, ?, ?, ?, ?, ?);", [idPagamento, tipo, numCartao, nomeTitular, validade, CVV]);
})

app.listen(port, () => console.log(`Listening on port ${port}`))