var cart = {};
var metaCart = {
    supermercado: {},
    produto:{}
};
var qtdCart;
function loadCart(){
    cart = JSON.parse(localStorage.getItem('shoppingCart'));
    if(cart == undefined) cart = {};
    metaCart= JSON.parse(localStorage.getItem('metaCart'))
    if(metaCart ==undefined) metaCart = {
        supermercado: {},
        produto:{}
    };
}

function addCart(superMercadoId, produtoId, nome, preco, mercado){
    if(cart==undefined)
        cart = {}
    if(cart[superMercadoId]==undefined)
        cart[superMercadoId] = {}
    if(cart[superMercadoId][produtoId]==undefined)
        cart[superMercadoId][produtoId] = 0
    cart[superMercadoId][produtoId]++;
    localStorage.setItem('shoppingCart', JSON.stringify(cart));
    updateQtdCart()

    if(metaCart==undefined) metaCart = {
        supermercado: {},
        produto:{}
    };

    if(metaCart.supermercado[idSuperMercado]==undefined)
        metaCart.supermercado[idSuperMercado] = mercado
    if(metaCart.produto[produtoId]==undefined)
        metaCart.produto[produtoId] = {
            nome,
            preco
        }
    localStorage.setItem('metaCart', JSON.stringify(metaCart));
}
function updateQtdCart(){
    if(qtdCart==undefined) qtdCart = 0;
    qtdCart = 0
    for (let supermercado in cart) {
        for(let produto in cart[supermercado]){
            qtdCart++;
        }
    }
    document.getElementById('countCarrinho').innerHTML = qtdCart;
}
loadCart();
console.log(cart)
updateQtdCart();
console.log(qtdCart)