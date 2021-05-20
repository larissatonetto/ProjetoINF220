-- a) Consulta de produtos por corredor, depois de selecionado o supermercado
SELECT P.nome, descricao, C.nome, unidade, SP.preco
FROM SUPERMERCADO_PRODUTO SP
INNER JOIN PRODUTO P
    ON SP.idProduto = P.idProduto
    INNER JOIN CORREDOR C
        ON C.idCorredor = P.idCorredor
WHERE idSuperMercado = 1
ORDER BY C.nome

-- b) Consulta a pedidos dos clientes, status, valor total, etc
SELECT idPedido, UC.nome, UE.nome, statusPedido, valorTotal, dataPedido, dataEntrega,
CASE
    WHEN PD.idMetodoPagamento IS NULL THEN 'Dinheiro'
    WHEN PIX.idPix IS NOT NULL THEN PIX.idPIX
    ELSE CARTAO.idCartao
END AS 'Metodo de Pagamento'
FROM PEDIDO PD
INNER JOIN ENTREGADOR E
    ON PD.idEntregador = E.idEntregrador
    INNER JOIN USUARIO UE
        ON UE.idUser = E.idUser
INNER JOIN CLIENTE C
    ON PD.idCliente = C.idCliente
    INNER JOIN USUARIO UC
        ON UC.idUser = C.idUser
INNER JOIN PIX
    ON PIX.idMetodoPagamento = PD.idMetodoPagamento
INNER JOIN CARTAO
    ON CARTAO.idMetodoPagamento = PD.idMetodoPagamento

-- c) Relatório Financeiro por supermercado
SELECT S.nome, P.nome, preco, desconto, promocao
FROM ITEM I
INNER JOIN SUPERMERCADO S
    ON I.idSuperMercado = S.idSuperMercado
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
GROUP BY S.nome

-- d) Relatório de Produtos mais vendidos, por corredor
SELECT P.nome, COUNT(I.idProduto)
FROM ITEM I
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
GROUP BY I.idProduto
ORDER BY COUNT(I.idProduto) DESC

-- e) Listar clientes com maior volume de pedidos
SELECT U.nome, COUNT(P.idCliente)
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON P.idCliente = C.idCliente
    INNER JOIN USUARIO U
        ON U.idUser = C.idUser
GROUP BY P.idCliente
ORDER BY COUNT(P.idCliente) DESC

-- f) Listar CE com extrato de movimentação de sua carteira
SELECT E.idEntregrador, U.nome, valorEntrega, gorjeta, valorEntrega + gorjeta AS 'Total'
FROM ENTREGA En
INNER JOIN ENTREGADOR E
    ON En.idEntregador = E.idEntregrador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
GROUP BY idEntregrador

-- g) Listar pedidos por CE
SELECT P.idEntregador, U.nome, idPedido
FROM PEDIDO P
INNER JOIN ENTREGADOR E
    ON P.idEntregador = E.idEntregrador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
GROUP BY E.idEntregrador

-- h) Bole mais uma consulta interessante
-- Supermercados com maior número de pedidos
SELECT S.nome, COUNT(P.idSupermercado)
FROM PEDIDO P
INNER JOIN SUPERMERCADO S
    ON P.idSuperMercado = S.idSupermercado
GROUP BY P.idSuperMercado
ORDER BY COUNT(P.idSupermercado) DESC