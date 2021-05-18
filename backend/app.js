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
app.get('/', (req,res) =>{
    res.render('index')
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

    res.redirect('/')
})

//CADASTRO PEDIDO
let total = 0;
app.get('/carrinho/:id', async(req,res) => {
    const idCliente = req.params.id;
    const conn = await pool.getConnection();
    const produtos =[{nome: 'achocolatado',supermercado: 'bretas',preco: 3.00},{nome: 'carne',supermercado: 'bahamas',preco: 15.25}];
    const ende = await conn.query("SELECT * FROM `ENDERECO` WHERE idCliente = (?);", [idCliente]);
    const card = await conn.query("SELECT CARTAO.numero, CARTAO.idCartao, CARTAO.idMetodoPagamento FROM CARTAO INNER JOIN METODOPAGAMENTO ON CARTAO.idMetodoPagamento = METODOPAGAMENTO.idMetodoPagamento WHERE METODOPAGAMENTO.idCliente = (?) ", [idCliente]);
    for(let i = 0;i<produtos.length;i++){
        total += produtos[i].preco
    }
    const valorEntrega = 5;
    total += valorEntrega;
    res.render('carrinho', {
        itens: produtos,
        valorFinal: total,
        endereco: ende,
        cartao: card,
        idC: idCliente,
        frete: valorEntrega
    })
})

app.post('/addPedido/:id', async(req,res) =>{
    const conn = await pool.getConnection();
    const idCliente = req.params.id;
    const {endereco,cartao} = req.body;
    //1 é um idEntregador genérico
    
    const result = await conn.query("INSERT INTO `PEDIDO` (`idCliente`, `idEndereco`,`idEntregador`,`idMetodoPagamento`, `dataPedido`, `valorTotal`, `statusPedido`) VALUES (?, ?,?,?,150221,?,?);", [idCliente, endereco,1, cartao,total,'Realizado']);
    const idPedido = result.insertId
    await conn.query("UPDATE ENTREGADOR SET carteira = carteira + 5 WHERE idEntregador = (?);", [1]);
    await conn.query("INSERT INTO ENTREGA (`idEntregador`, `idCliente`, `idPedido`, `idEndereco`, `gorjeta`, `dataEntrega`, `valorEntrega`) VALUES (?,?,?,?,?,?,?);",[1,idCliente,idPedido,endereco,0,'150221',5]);


    res.redirect('/');
})





app.listen(port, () => console.log(`Listening on port ${port}`))