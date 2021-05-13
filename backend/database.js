const Sequelize = require('sequelize')

const database = new Sequelize('elComprador','root','',{
    host: 'localhost',
    dialect: 'mariadb',
})

module.exports = {
    Sequelize: Sequelize,
    database: database
}
