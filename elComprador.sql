-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Maio-2021 às 19:05
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
-- Banco de dados: `elcomprador`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `administracaosupermercado`
--

CREATE TABLE `administracaosupermercado` (
  `idAdministracaoSupermercado` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idGerente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `administrador`
--

CREATE TABLE `administrador` (
  `idAdministrador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartao`
--

CREATE TABLE `cartao` (
  `idCartao` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `numero` bigint(16) NOT NULL,
  `nomeTitular` varchar(45) NOT NULL,
  `validade` varchar(7) NOT NULL,
  `CVV` bigint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cartao`
--

INSERT INTO `cartao` (`idCartao`, `idMetodoPagamento`, `tipo`, `numero`, `nomeTitular`, `validade`, `CVV`) VALUES
(14, 14, 'Débito', 5534564985035517, 'Gabriel B Soares', '12/2018', 111),
(15, 15, 'Débito', 100000, 'Antonio Gonçalves', '02/2018', 103),
(16, 16, 'Crédito', 5555666677778884, 'Jéssica S Silveira', '03/2028', 312);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `idUser`) VALUES
(20, 26),
(21, 27),
(22, 28),
(23, 29),
(24, 31);

-- --------------------------------------------------------

--
-- Estrutura da tabela `corredor`
--

CREATE TABLE `corredor` (
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `corredor`
--

INSERT INTO `corredor` (`idCorredor`, `nome`) VALUES
(26, 'Café da manhã e lanches'),
(27, 'Produtos de mercearia'),
(28, 'Produtos de hortifrúti'),
(29, 'Carnes'),
(30, 'Enlatados'),
(31, 'Produtos de higiene'),
(32, 'Produtos de limpeza'),
(33, 'Produtos do dia a dia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dinheiro`
--

CREATE TABLE `dinheiro` (
  `idDinheiro` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `idEndereco` bigint(20) NOT NULL,
  `idCliente` bigint(20) DEFAULT NULL,
  `cidade` varchar(30) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `rua` varchar(60) NOT NULL,
  `complemento` varchar(60) NOT NULL,
  `geolocalizacao` text NOT NULL,
  `UF` varchar(2) DEFAULT NULL,
  `apelido` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`idEndereco`, `idCliente`, `cidade`, `numero`, `bairro`, `rua`, `complemento`, `geolocalizacao`, `UF`, `apelido`) VALUES
(12, 25, 'Viçosa', 0, 'Lourdes', 'Tabelião Machado', '', '', 'MG', 'Minha Casa'),
(13, NULL, 'Viçosa', 123, 'Lourdes', 'Tabelião Machado', '', '', 'MG', NULL),
(14, 21, 'Viçosa', 11, 'Lourdes', 'Tabelião Machado', '', 'A', 'MG', 'Casa'),
(15, 23, 'Viçosa', 1000, 'Centro', 'Av PH Rolfs', '', '-26.9993, 16.9976', 'MG', 'Casa'),
(16, 23, 'Viçosa', 23, 'Centro', 'Av PH Rolfs', '', '51.1616, -173.6756', 'MG', 'Trabalho'),
(17, 24, 'Contagem', 906, 'Vila Cristina', 'Beco da Paz', 'Apartamento 71', '-41.2565, -9.1641', 'MG', 'Casa'),
(18, NULL, 'Viçosa', 380, 'Centro', 'Av Milton Bandeira', '', '-12.3042834, 20.2392134', 'MG', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `idEntrega` bigint(20) NOT NULL,
  `idEntregador` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `gorjeta` float NOT NULL,
  `dataEntrega` varchar(20) NOT NULL,
  `valorEntrega` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`idEntrega`, `idEntregador`, `idCliente`, `idPedido`, `idEndereco`, `gorjeta`, `dataEntrega`, `valorEntrega`) VALUES
(1, 1, 21, 3, 14, 10, '2021-05-12 11:32:36', 10),
(2, 2, 24, 5, 17, 5, '2021-05-07 10:48:46', 0),
(3, 2, 23, 6, 16, 8, '2021-05-03 21:43:26', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `idEntregador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `carteira` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`idEntregador`, `idUser`, `carteira`) VALUES
(1, 25, 0),
(2, 30, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `gerente`
--

CREATE TABLE `gerente` (
  `idGerente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `idItem` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `idPedido` bigint(20) NOT NULL,
  `promocao` tinyint(1) NOT NULL,
  `desconto` float DEFAULT NULL,
  `preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `item`
--

INSERT INTO `item` (`idItem`, `idSuperMercado`, `idProduto`, `idPedido`, `promocao`, `desconto`, `preco`) VALUES
(1, 1, 1, 3, 0, 10, 10),
(2, 1, 2, 4, 1, 10, 10),
(3, 1, 3, 3, 0, NULL, 10),
(4, 1, 2, 3, 0, 10, 10),
(5, 2, 3, 5, 0, 2, 5),
(6, 2, 4, 5, 1, 3, 8),
(7, 2, 4, 7, 1, 3, 8),
(8, 1, 2, 7, 1, 10, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `metodopagamento`
--

CREATE TABLE `metodopagamento` (
  `idMetodoPagamento` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `metodopagamento`
--

INSERT INTO `metodopagamento` (`idMetodoPagamento`, `idCliente`) VALUES
(14, 20),
(15, 21),
(16, 23),
(17, 24),
(18, 23);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
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

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `idEntregador`, `idCliente`, `idEndereco`, `idMetodoPagamento`, `dataPedido`, `dataEntrega`, `valorTotal`, `statusPedido`, `valorRecebido`, `observacao`) VALUES
(3, 1, 21, 14, NULL, '2021-05-12 10:15:36.000000', '2021-05-12 11:32:36.374000', 150.72, 'Entregue', 160, 'Deixar na portaria'),
(4, 1, 21, 14, 15, '2021-05-20 10:15:36.000000', '0000-00-00 00:00:00.000000', 450, 'Saiu para entrega', 0, NULL),
(5, 2, 24, 17, 17, '2021-05-04 10:48:46.000000', '2021-05-07 10:48:46.000000', 1000, 'Entregue', 1000, NULL),
(6, 2, 23, 16, 18, '2021-05-03 10:51:26.000000', '2021-05-03 21:43:26.561000', 20, 'Entregue', 20, NULL),
(7, 1, 23, 15, 14, '2021-05-19 11:36:58.000000', '0000-00-00 00:00:00.000000', 500, 'Saiu para entrega', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pix`
--

CREATE TABLE `pix` (
  `idPix` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL,
  `chave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pix`
--

INSERT INTO `pix` (`idPix`, `idMetodoPagamento`, `chave`) VALUES
(1, 17, '?LXieOCc#:9'),
(2, 18, ':VGk}N12]qL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` bigint(20) NOT NULL,
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `descricao` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `idCorredor`, `nome`, `unidade`, `descricao`, `foto`) VALUES
(1, 29, 'Chã de Dentro', '1', 'Chã de Dentro (Coxão Mole) bovina fresca embalada para preparo imediato ou congelamento.\r\n\r\nPeso por embalagem: 1 kg', 'carne.png'),
(2, 26, 'Pães', '10000', 'Pão Rico em Proteína Mestemacher O dobro de porteina e 80% menos carboidratos que o pão integral padrão.\n\nIdeal para dietas ricas em proteína.\n\nIngredientes:\n\nÁgua, mix de proteínas 12% (proteína de trigo, proteína de ervilha), linhaça marrom, farinha de centeio integral, farelo de soja 6%, farinha de soja 3%, farelo de trigo, linhaça dourada, semente de girassol, gergelim, fibra de aveia, sal, soro em pó enriquecido com proteína, levedura, regulador de acidez acetato de sódio.\n\nContéM Glúten\n\nContéM Lactose\n\nAlégicos:\n\nContém trigo, centeio, soja, aveia e derivado de leite.\n', 'paes.png'),
(3, 27, 'Arroz Branco Agulhinha Zaeli 5kg Pacote', '10000', 'Arroz\n\n \n\nCaracterística: Branco Agulhinha\n\nMarca: Zaeli\n\nTamanho: 5kg\n\nEmbalagem: Pacote', 'arroz.png'),
(4, 28, 'Alho Twist Secalux 591101', '10000', 'O Triturador de Alho Twist é fácil de usar e corta os dentes de alho em poucos segundos. Basta encaixar as duas partes e girar uma no sentido horário e a outra no anti-horário. Um produto feito em material resistente e com a praticidade Secalux', 'triturador.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `supermercado`
--

CREATE TABLE `supermercado` (
  `idSuperMercado` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `cnpj` bigint(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `supermercado`
--

INSERT INTO `supermercado` (`idSuperMercado`, `idEndereco`, `cnpj`, `nome`, `foto`) VALUES
(1, 13, 38317220000116, 'Supermercado Amantino', 'amantino.png'),
(2, 18, 16876865000156, 'Supermercado Bahamas', 'bahamas.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `supermercado_produto`
--

CREATE TABLE `supermercado_produto` (
  `idSupermercado_Produto` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `desconto` bigint(20) DEFAULT NULL,
  `preco` bigint(20) NOT NULL,
  `promocao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `supermercado_produto`
--

INSERT INTO `supermercado_produto` (`idSupermercado_Produto`, `idSuperMercado`, `idProduto`, `desconto`, `preco`, `promocao`) VALUES
(1, 1, 1, 10, 10, 0),
(2, 1, 2, 10, 10, 0),
(3, 1, 3, 10, 10, 0),
(4, 1, 4, 10, 10, 0),
(5, 2, 3, 2, 5, 0),
(6, 2, 4, 3, 8, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` bigint(20) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `sobrenome` varchar(256) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `senha` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `nome`, `sobrenome`, `celular`, `email`, `senha`) VALUES
(25, 'Gabriel', 'Bezerra Soares', '32999749830', 'gabriel.b.soares@ufv.com.br', 'Senha123!'),
(26, 'Joana', 'Gonçalves Dias', '34929749830', 'joana.g.dias@ufv.com.br', 'Senha123!'),
(27, 'Antonio', 'Gonçalves Costas', '32999749830', 'antoniogc@gmail.com', '1234'),
(28, 'Lucca', 'Vicente Dias', '38997495294', 'luccavicentedias@terra.com.br', '12345'),
(29, 'Jéssica', 'Sandra Silveira', '38995939576', 'jessica@gmail.com', 'aPDohKTw2P'),
(30, 'Yago', 'Thales Freitas', '32999144474', 'yagothalesfreitas@hotmail.com', 'JQDT2hs5IT'),
(31, 'Letícia', 'Pietra da Rosa', '31989241245', 'lleticiapietradarosa@alwan.com.br', 'K1fE0elszJ');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `administracaosupermercado`
--
ALTER TABLE `administracaosupermercado`
  ADD PRIMARY KEY (`idAdministracaoSupermercado`);

--
-- Índices para tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Índices para tabela `cartao`
--
ALTER TABLE `cartao`
  ADD PRIMARY KEY (`idCartao`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `corredor`
--
ALTER TABLE `corredor`
  ADD PRIMARY KEY (`idCorredor`);

--
-- Índices para tabela `dinheiro`
--
ALTER TABLE `dinheiro`
  ADD PRIMARY KEY (`idDinheiro`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`idEntrega`);

--
-- Índices para tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`idEntregador`);

--
-- Índices para tabela `gerente`
--
ALTER TABLE `gerente`
  ADD PRIMARY KEY (`idGerente`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`idItem`);

--
-- Índices para tabela `metodopagamento`
--
ALTER TABLE `metodopagamento`
  ADD PRIMARY KEY (`idMetodoPagamento`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`);

--
-- Índices para tabela `pix`
--
ALTER TABLE `pix`
  ADD PRIMARY KEY (`idPix`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `supermercado`
--
ALTER TABLE `supermercado`
  ADD PRIMARY KEY (`idSuperMercado`);

--
-- Índices para tabela `supermercado_produto`
--
ALTER TABLE `supermercado_produto`
  ADD PRIMARY KEY (`idSupermercado_Produto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdministrador` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cartao`
--
ALTER TABLE `cartao`
  MODIFY `idCartao` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `corredor`
--
ALTER TABLE `corredor`
  MODIFY `idCorredor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `dinheiro`
--
ALTER TABLE `dinheiro`
  MODIFY `idDinheiro` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `idEndereco` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `idEntrega` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `entregador`
--
ALTER TABLE `entregador`
  MODIFY `idEntregador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `gerente`
--
ALTER TABLE `gerente`
  MODIFY `idGerente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `idItem` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `metodopagamento`
--
ALTER TABLE `metodopagamento`
  MODIFY `idMetodoPagamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `pix`
--
ALTER TABLE `pix`
  MODIFY `idPix` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `supermercado`
--
ALTER TABLE `supermercado`
  MODIFY `idSuperMercado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `supermercado_produto`
--
ALTER TABLE `supermercado_produto`
  MODIFY `idSupermercado_Produto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
