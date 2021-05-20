-- a) Consulta de produtos por corredor, depois de selecionado o supermercado
SELECT P.nome, descricao, C.nome, unidade, SP.preco
FROM SUPERMERCADO_PRODUTO SP
INNER JOIN PRODUTO P
    ON SP.idProduto = P.idProduto
    INNER JOIN CORREDOR C
        ON C.idCorredor = P.idCorredor
WHERE idSuperMercado = 1
ORDER BY C.nome;

/*
SELECT nome,descricao,C.nome,unidade,SP.preco
FROM SUPERMERCADO_PRODUTO SP
INNER JOIN PRODUTO P
    ON SP.idProduto = P.idProduto
    INNER JOIN CORREDOR C
        ON C.idCorredor = P.idCorredor
WHERE idSuperMercado = id
ORDER BY C.nome
SELECT nome,descric
*/

-- b) Consulta a pedidos dos clientes, status, valor total, etc
SELECT idPedido, UC.nome, UE.nome, statusPedido, valorTotal, dataPedido, dataEntrega,
CASE
    WHEN PD.idMetodoPagamento IS NULL THEN 'Dinheiro'
    WHEN PIX.idPix IS NOT NULL THEN PIX.idPIX
    ELSE CARTAO.idCartao
END AS 'Metodo de Pagamento'
FROM PEDIDO PD
INNER JOIN ENTREGADOR E
    ON PD.idEntregador = E.idEntregador
    INNER JOIN USUARIO UE
        ON UE.idUser = E.idUser
INNER JOIN CLIENTE C
    ON PD.idCliente = C.idCliente
    INNER JOIN USUARIO UC
        ON UC.idUser = C.idUser
INNER JOIN PIX
    ON PIX.idMetodoPagamento = PD.idMetodoPagamento
INNER JOIN CARTAO
    ON CARTAO.idMetodoPagamento = PD.idMetodoPagamento;

-- c) Relatório Financeiro por supermercado
SELECT S.nome, P.nome, preco, desconto, promocao
FROM ITEM I
INNER JOIN SUPERMERCADO S
    ON I.idSuperMercado = S.idSuperMercado
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
GROUP BY S.nome;

-- d) Relatório de Produtos mais vendidos, por corredor
SELECT P.nome, COUNT(I.idProduto)
FROM ITEM I
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
GROUP BY I.idProduto;

-- e) Listar clientes com maior volume de pedidos
SELECT U.nome, COUNT(P.idCliente)
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON P.idCliente = C.idCliente
    INNER JOIN USUARIO U
        ON U.idUser = C.idUser
GROUP BY P.idCliente;

-- f) Listar CE com extrato de movimentação de sua carteira
SELECT E.idEntregador, U.nome, valorEntrega, gorjeta, valorEntrega + gorjeta AS 'Total'
FROM ENTREGA En
INNER JOIN ENTREGADOR E
    ON En.idEntregador = E.idEntregador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
GROUP BY idEntregador;

-- g) Listar pedidos por CE
SELECT P.idEntregador, U.nome, idPedido
FROM PEDIDO P
INNER JOIN ENTREGADOR E
    ON P.idEntregador = E.idEntregador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
GROUP BY E.idEntregador

-- h) Bole mais uma consulta interessante


/* if idMetodoPagamento = NULL THEN "Dinheiro" */

-- Trocar idEntregador por idEntregador