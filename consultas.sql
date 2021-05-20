-- a) Consulta de produtos por corredor, depois de selecionado o supermercado
SELECT P.nome, descricao, C.nome AS 'Corredor', unidade, SP.preco
FROM SUPERMERCADO_PRODUTO SP
INNER JOIN PRODUTO P
    ON SP.idProduto = P.idProduto
    INNER JOIN CORREDOR C
        ON C.idCorredor = P.idCorredor
WHERE idSuperMercado = 1 -- Escolher o supermercado aqui
ORDER BY C.nome

-- b) Consulta a pedidos dos clientes, status, valor total, etc
SELECT idPedido, UC.nome AS 'cliente', UE.nome AS 'Entregador', statusPedido, valorTotal, dataPedido,
CASE
    WHEN PD.idMetodoPagamento IS NULL THEN 'Dinheiro'
    WHEN PIX.idPix IS NOT NULL THEN PIX.chave
    ELSE CARTAO.numero
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
LEFT JOIN PIX
    ON PIX.idMetodoPagamento = PD.idMetodoPagamento
LEFT JOIN CARTAO
    ON CARTAO.idMetodoPagamento = PD.idMetodoPagamento

-- c) Relatório Financeiro por supermercado
SELECT S.nome AS 'Supermercado', P.nome AS 'Produto vendido', I.idPedido, preco, desconto, promocao
FROM ITEM I
INNER JOIN SUPERMERCADO S
    ON I.idSuperMercado = S.idSuperMercado
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
ORDER BY S.nome, I.idPedido

-- d) Relatório de Produtos mais vendidos, por corredor
SELECT P.nome AS 'Produto', C.nome AS 'Corredor', COUNT(I.idProduto) AS 'Quantidade'
FROM ITEM I
INNER JOIN PRODUTO P
    ON P.idProduto = I.idProduto
    INNER JOIN CORREDOR C
    	ON C.idCorredor = P.idCorredor
GROUP BY I.idProduto
ORDER BY COUNT(I.idProduto) DESC, C.nome

-- e) Listar clientes com maior volume de pedidos
SELECT U.nome AS 'Cliente', COUNT(P.idCliente) AS 'Pedidos'
FROM PEDIDO P
INNER JOIN CLIENTE C
    ON P.idCliente = C.idCliente
    INNER JOIN USUARIO U
        ON U.idUser = C.idUser
GROUP BY P.idCliente
ORDER BY COUNT(P.idCliente) DESC

-- f) Listar CE com extrato de movimentação de sua carteira
SELECT E.idEntregador, En.idPedido, U.nome, valorEntrega, gorjeta, valorEntrega + gorjeta AS 'Total'
FROM ENTREGA En
INNER JOIN ENTREGADOR E
    ON En.idEntregador = E.idEntregador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
ORDER BY idEntregador

-- g) Listar pedidos por CE
SELECT E.idEntregador, U.nome, idPedido, P.statusPedido AS 'Status'
FROM PEDIDO P
INNER JOIN ENTREGADOR E
    ON P.idEntregador = E.idEntregador
    INNER JOIN USUARIO U
        ON U.idUser = E.idUser
ORDER BY E.idEntregador

-- h) Bole mais uma consulta interessante
-- Quantos produtos cada supermercado vendeu
SELECT S.nome, COUNT(I.idSuperMercado) AS 'Produtos vendidos'
FROM ITEM I
INNER JOIN SUPERMERCADO S
    ON I.idSuperMercado = S.idSuperMercado
GROUP BY I.idSuperMercado
ORDER BY COUNT(I.idSuperMercado) DESC