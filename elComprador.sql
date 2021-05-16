-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 16-Maio-2021 às 02:20
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `elComprador`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ADMINISTRACAOSUPERMERCADO`
--

CREATE TABLE `ADMINISTRACAOSUPERMERCADO` (
  `idAdministracaoSupermercado` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idGerente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ADMINISTRADOR`
--

CREATE TABLE `ADMINISTRADOR` (
  `idAdministrador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CARTAO`
--

CREATE TABLE `CARTAO` (
  `idCartao` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `numero` bigint(16) NOT NULL,
  `nomeTitular` varchar(45) NOT NULL,
  `validade` varchar(7) NOT NULL,
  `CVV` bigint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `idCliente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `CLIENTE`
--

INSERT INTO `CLIENTE` (`idCliente`, `idUser`) VALUES
(3, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `CORREDOR`
--

CREATE TABLE `CORREDOR` (
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `DINHEIRO`
--

CREATE TABLE `DINHEIRO` (
  `idDinheiro` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ENDERECO`
--

CREATE TABLE `ENDERECO` (
  `idEndereco` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `complemento` varchar(60) NOT NULL,
  `geolocalizacao` text NOT NULL,
  `UF` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ENTREGA`
--

CREATE TABLE `ENTREGA` (
  `idEntrega` bigint(20) NOT NULL,
  `idEntregador` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `gorjeta` float NOT NULL,
  `dataEntrega` varchar(20) NOT NULL,
  `valorEntrega` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ENTREGADOR`
--

CREATE TABLE `ENTREGADOR` (
  `idEntregrador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `carteira` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `GERENTE`
--

CREATE TABLE `GERENTE` (
  `idGerente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ITEM`
--

CREATE TABLE `ITEM` (
  `idItem` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `promocao` tinyint(1) NOT NULL,
  `desconto` float DEFAULT NULL,
  `preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `METODOPAGAMENTO`
--

CREATE TABLE `METODOPAGAMENTO` (
  `idMetodoPagamento` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `PEDIDO`
--

CREATE TABLE `PEDIDO` (
  `idPedido` bigint(20) NOT NULL,
  `idEntregador` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) DEFAULT NULL,
  `dataPedido` datetime(6) NOT NULL,
  `dataEntrega` datetime(6) NOT NULL,
  `valorTotal` float NOT NULL,
  `statusPedido` varchar(20) NOT NULL,
  `valorRecebido` bigint(20) NOT NULL,
  `observacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `PIX`
--

CREATE TABLE `PIX` (
  `idPix` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL,
  `chave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `PRODUTO`
--

CREATE TABLE `PRODUTO` (
  `idProduto` bigint(20) NOT NULL,
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(35) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `descricao` text NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `SUPERMERCADO`
--

CREATE TABLE `SUPERMERCADO` (
  `idSuperMercado` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `cnpj` bigint(20) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `SUPERMERCADO_PRODUTO`
--

CREATE TABLE `SUPERMERCADO_PRODUTO` (
  `idSupermercado_Produto` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `desconto` bigint(20) DEFAULT NULL,
  `preco` bigint(20) NOT NULL,
  `promocao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `USUARIO`
--

CREATE TABLE `USUARIO` (
  `idUser` bigint(20) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `sobrenome` varchar(256) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `USUARIO`
--

INSERT INTO `USUARIO` (`idUser`, `nome`, `sobrenome`, `celular`, `email`, `senha`) VALUES
(8, 'qweqweqw', 'qweqwe', '31989229456', 'lucaskermessi@gmail.com', 'qweqewqeqw');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `ADMINISTRACAOSUPERMERCADO`
--
ALTER TABLE `ADMINISTRACAOSUPERMERCADO`
  ADD PRIMARY KEY (`idAdministracaoSupermercado`);

--
-- Índices para tabela `ADMINISTRADOR`
--
ALTER TABLE `ADMINISTRADOR`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Índices para tabela `CARTAO`
--
ALTER TABLE `CARTAO`
  ADD PRIMARY KEY (`idCartao`);

--
-- Índices para tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `CORREDOR`
--
ALTER TABLE `CORREDOR`
  ADD PRIMARY KEY (`idCorredor`);

--
-- Índices para tabela `DINHEIRO`
--
ALTER TABLE `DINHEIRO`
  ADD PRIMARY KEY (`idDinheiro`);

--
-- Índices para tabela `ENDERECO`
--
ALTER TABLE `ENDERECO`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices para tabela `ENTREGA`
--
ALTER TABLE `ENTREGA`
  ADD PRIMARY KEY (`idEntrega`);

--
-- Índices para tabela `ENTREGADOR`
--
ALTER TABLE `ENTREGADOR`
  ADD PRIMARY KEY (`idEntregrador`);

--
-- Índices para tabela `GERENTE`
--
ALTER TABLE `GERENTE`
  ADD PRIMARY KEY (`idGerente`);

--
-- Índices para tabela `METODOPAGAMENTO`
--
ALTER TABLE `METODOPAGAMENTO`
  ADD PRIMARY KEY (`idMetodoPagamento`);

--
-- Índices para tabela `PEDIDO`
--
ALTER TABLE `PEDIDO`
  ADD PRIMARY KEY (`idPedido`);

--
-- Índices para tabela `PIX`
--
ALTER TABLE `PIX`
  ADD PRIMARY KEY (`idPix`);

--
-- Índices para tabela `PRODUTO`
--
ALTER TABLE `PRODUTO`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `SUPERMERCADO`
--
ALTER TABLE `SUPERMERCADO`
  ADD PRIMARY KEY (`idSuperMercado`);

--
-- Índices para tabela `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `ADMINISTRADOR`
--
ALTER TABLE `ADMINISTRADOR`
  MODIFY `idAdministrador` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `CARTAO`
--
ALTER TABLE `CARTAO`
  MODIFY `idCartao` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `idCliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `ENDERECO`
--
ALTER TABLE `ENDERECO`
  MODIFY `idEndereco` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ENTREGA`
--
ALTER TABLE `ENTREGA`
  MODIFY `idEntrega` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ENTREGADOR`
--
ALTER TABLE `ENTREGADOR`
  MODIFY `idEntregrador` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `GERENTE`
--
ALTER TABLE `GERENTE`
  MODIFY `idGerente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `METODOPAGAMENTO`
--
ALTER TABLE `METODOPAGAMENTO`
  MODIFY `idMetodoPagamento` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `PEDIDO`
--
ALTER TABLE `PEDIDO`
  MODIFY `idPedido` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `PIX`
--
ALTER TABLE `PIX`
  MODIFY `idPix` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `PRODUTO`
--
ALTER TABLE `PRODUTO`
  MODIFY `idProduto` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `SUPERMERCADO`
--
ALTER TABLE `SUPERMERCADO`
  MODIFY `idSuperMercado` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `idUser` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
