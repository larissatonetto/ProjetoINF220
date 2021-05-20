-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 20, 2021 at 01:51 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elComprador`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMINISTRACAOSUPERMERCADO`
--

CREATE TABLE `ADMINISTRACAOSUPERMERCADO` (
  `idAdministracaoSupermercado` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idGerente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ADMINISTRADOR`
--

CREATE TABLE `ADMINISTRADOR` (
  `idAdministrador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `CARTAO`
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

--
-- Dumping data for table `CARTAO`
--

INSERT INTO `CARTAO` (`idCartao`, `idMetodoPagamento`, `tipo`, `numero`, `nomeTitular`, `validade`, `CVV`) VALUES
(14, 14, 'Débito', 5534564985035517, 'Gabriel B Soares', '12/2018', 111),
(15, 15, 'Débito', 100000, 'Antonio Gonçalves', '02/2018', 103);

-- --------------------------------------------------------

--
-- Table structure for table `CLIENTE`
--

CREATE TABLE `CLIENTE` (
  `idCliente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CLIENTE`
--

INSERT INTO `CLIENTE` (`idCliente`, `idUser`) VALUES
(20, 26),
(21, 27);

-- --------------------------------------------------------

--
-- Table structure for table `CORREDOR`
--

CREATE TABLE `CORREDOR` (
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CORREDOR`
--

INSERT INTO `CORREDOR` (`idCorredor`, `nome`) VALUES
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
-- Table structure for table `DINHEIRO`
--

CREATE TABLE `DINHEIRO` (
  `idDinheiro` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ENDERECO`
--

CREATE TABLE `ENDERECO` (
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
-- Dumping data for table `ENDERECO`
--

INSERT INTO `ENDERECO` (`idEndereco`, `idCliente`, `cidade`, `numero`, `bairro`, `rua`, `complemento`, `geolocalizacao`, `UF`, `apelido`) VALUES
(12, 25, 'Viçosa', 0, 'Lourdes', 'Tabelião Machado', '', '', 'MG', 'Minha Casa'),
(13, NULL, 'Viçosa', 123, 'Lourdes', 'Tabelião Machado', '', '', 'MG', NULL),
(14, 21, 'Viçosa', 11, 'Lourdes', 'Tabelião Machado', '', 'A', 'MG', 'Casa');

-- --------------------------------------------------------

--
-- Table structure for table `ENTREGA`
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
-- Table structure for table `ENTREGADOR`
--

CREATE TABLE `ENTREGADOR` (
  `idEntregador` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL,
  `carteira` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ENTREGADOR`
--

INSERT INTO `ENTREGADOR` (`idEntregador`, `idUser`, `carteira`) VALUES
(1, 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GERENTE`
--

CREATE TABLE `GERENTE` (
  `idGerente` bigint(20) NOT NULL,
  `idUser` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ITEM`
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
-- Table structure for table `METODOPAGAMENTO`
--

CREATE TABLE `METODOPAGAMENTO` (
  `idMetodoPagamento` bigint(20) NOT NULL,
  `idCliente` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `METODOPAGAMENTO`
--

INSERT INTO `METODOPAGAMENTO` (`idMetodoPagamento`, `idCliente`) VALUES
(14, 20),
(15, 21);

-- --------------------------------------------------------

--
-- Table structure for table `PEDIDO`
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
-- Table structure for table `PIX`
--

CREATE TABLE `PIX` (
  `idPix` bigint(20) NOT NULL,
  `idMetodoPagamento` bigint(20) NOT NULL,
  `chave` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `PRODUTO`
--

CREATE TABLE `PRODUTO` (
  `idProduto` bigint(20) NOT NULL,
  `idCorredor` bigint(20) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `unidade` varchar(20) NOT NULL,
  `descricao` text NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PRODUTO`
--

INSERT INTO `PRODUTO` (`idProduto`, `idCorredor`, `nome`, `unidade`, `descricao`, `foto`) VALUES
(1, 29, 'Carnes e churrasco : Entrevista a Chico Barbosa', '1000', 'Referência em gastronomia no Brasil, Marcos Bassi traz ao leitor suas técnicas de preparo artístico do churrasco, por meio de exposições práticas, didáticas e dinâmicas, em entrevista cedida a Chico Barbosa. Neste guia, revelam-se a trajetória e o ofício deste grande artesão da carne a um público que vai do consumidor de carnes ou churrasqueiro de fim de semana ao açougueiro ansioso por aprofundar seus domínios. Não se trata de idealizar um churrasco complexo e inatingível, com instrumentos e produtos raros e altamente especializados, mas sim de tornar possível a realização do evento por qualquer pessoa, especialista ou não. Marcos Bassi destaca aqui os principais cortes utilizados em seu renomado restaurante, O Templo da Carne, e transmite aos leitores o conhecimento adquirido em décadas de prática no trato com a carne.', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1629069754'),
(2, 26, 'Pães', '10000', 'Pão Rico em Proteína Mestemacher O dobro de porteina e 80% menos carboidratos que o pão integral padrão.\n\nIdeal para dietas ricas em proteína.\n\nIngredientes:\n\nÁgua, mix de proteínas 12% (proteína de trigo, proteína de ervilha), linhaça marrom, farinha de centeio integral, farelo de soja 6%, farinha de soja 3%, farelo de trigo, linhaça dourada, semente de girassol, gergelim, fibra de aveia, sal, soro em pó enriquecido com proteína, levedura, regulador de acidez acetato de sódio.\n\nContéM Glúten\n\nContéM Lactose\n\nAlégicos:\n\nContém trigo, centeio, soja, aveia e derivado de leite.\n', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1432947603'),
(3, 27, 'Arroz Branco Agulhinha Zaeli 5kg Pacote', '10000', 'Arroz\n\n \n\nCaracterística: Branco Agulhinha\n\nMarca: Zaeli\n\nTamanho: 5kg\n\nEmbalagem: Pacote', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1427392559'),
(4, 28, 'Alho Twist Secalux 591101', '10000', 'O Triturador de Alho Twist é fácil de usar e corta os dentes de alho em poucos segundos. Basta encaixar as duas partes e girar uma no sentido horário e a outra no anti-horário. Um produto feito em material resistente e com a praticidade Secalux', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=11266143');

-- --------------------------------------------------------

--
-- Table structure for table `SUPERMERCADO`
--

CREATE TABLE `SUPERMERCADO` (
  `idSuperMercado` bigint(20) NOT NULL,
  `idEndereco` bigint(20) NOT NULL,
  `cnpj` bigint(20) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SUPERMERCADO`
--

INSERT INTO `SUPERMERCADO` (`idSuperMercado`, `idEndereco`, `cnpj`, `nome`, `foto`) VALUES
(1, 13, 38317220000116, 'Supermercado Amantino', 'amantino.png');

-- --------------------------------------------------------

--
-- Table structure for table `SUPERMERCADO_PRODUTO`
--

CREATE TABLE `SUPERMERCADO_PRODUTO` (
  `idSupermercado_Produto` bigint(20) NOT NULL,
  `idSuperMercado` bigint(20) NOT NULL,
  `idProduto` bigint(20) NOT NULL,
  `desconto` bigint(20) DEFAULT NULL,
  `preco` bigint(20) NOT NULL,
  `promocao` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SUPERMERCADO_PRODUTO`
--

INSERT INTO `SUPERMERCADO_PRODUTO` (`idSupermercado_Produto`, `idSuperMercado`, `idProduto`, `desconto`, `preco`, `promocao`) VALUES
(1, 1, 1, 10, 10, 0),
(2, 1, 2, 10, 10, 0),
(3, 1, 3, 10, 10, 0),
(4, 1, 4, 10, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `USUARIO`
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
-- Dumping data for table `USUARIO`
--

INSERT INTO `USUARIO` (`idUser`, `nome`, `sobrenome`, `celular`, `email`, `senha`) VALUES
(25, 'Gabriel', 'Bezerra Soares', '32999749830', 'gabriel.b.soares@ufv.com.br', 'Senha123!'),
(26, 'Joana', 'Gonçalves Dias', '34929749830', 'joana.g.dias@ufv.com.br', 'Senha123!'),
(27, 'Antonio', 'Gonçalves Costas', '32999749830', 'antoniogc@gmail.com', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMINISTRACAOSUPERMERCADO`
--
ALTER TABLE `ADMINISTRACAOSUPERMERCADO`
  ADD PRIMARY KEY (`idAdministracaoSupermercado`);

--
-- Indexes for table `ADMINISTRADOR`
--
ALTER TABLE `ADMINISTRADOR`
  ADD PRIMARY KEY (`idAdministrador`);

--
-- Indexes for table `CARTAO`
--
ALTER TABLE `CARTAO`
  ADD PRIMARY KEY (`idCartao`);

--
-- Indexes for table `CLIENTE`
--
ALTER TABLE `CLIENTE`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indexes for table `CORREDOR`
--
ALTER TABLE `CORREDOR`
  ADD PRIMARY KEY (`idCorredor`);

--
-- Indexes for table `DINHEIRO`
--
ALTER TABLE `DINHEIRO`
  ADD PRIMARY KEY (`idDinheiro`);

--
-- Indexes for table `ENDERECO`
--
ALTER TABLE `ENDERECO`
  ADD PRIMARY KEY (`idEndereco`);

--
-- Indexes for table `ENTREGA`
--
ALTER TABLE `ENTREGA`
  ADD PRIMARY KEY (`idEntrega`);

--
-- Indexes for table `ENTREGADOR`
--
ALTER TABLE `ENTREGADOR`
  ADD PRIMARY KEY (`idEntregador`);

--
-- Indexes for table `GERENTE`
--
ALTER TABLE `GERENTE`
  ADD PRIMARY KEY (`idGerente`);

--
-- Indexes for table `ITEM`
--
ALTER TABLE `ITEM`
  ADD PRIMARY KEY (`idItem`);

--
-- Indexes for table `METODOPAGAMENTO`
--
ALTER TABLE `METODOPAGAMENTO`
  ADD PRIMARY KEY (`idMetodoPagamento`);

--
-- Indexes for table `PEDIDO`
--
ALTER TABLE `PEDIDO`
  ADD PRIMARY KEY (`idPedido`);

--
-- Indexes for table `PIX`
--
ALTER TABLE `PIX`
  ADD PRIMARY KEY (`idPix`);

--
-- Indexes for table `PRODUTO`
--
ALTER TABLE `PRODUTO`
  ADD PRIMARY KEY (`idProduto`);

--
-- Indexes for table `SUPERMERCADO`
--
ALTER TABLE `SUPERMERCADO`
  ADD PRIMARY KEY (`idSuperMercado`);

--
-- Indexes for table `SUPERMERCADO_PRODUTO`
--
ALTER TABLE `SUPERMERCADO_PRODUTO`
  ADD PRIMARY KEY (`idSupermercado_Produto`);

--
-- Indexes for table `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ADMINISTRADOR`
--
ALTER TABLE `ADMINISTRADOR`
  MODIFY `idAdministrador` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CARTAO`
--
ALTER TABLE `CARTAO`
  MODIFY `idCartao` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `CLIENTE`
--
ALTER TABLE `CLIENTE`
  MODIFY `idCliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `CORREDOR`
--
ALTER TABLE `CORREDOR`
  MODIFY `idCorredor` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `DINHEIRO`
--
ALTER TABLE `DINHEIRO`
  MODIFY `idDinheiro` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ENDERECO`
--
ALTER TABLE `ENDERECO`
  MODIFY `idEndereco` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ENTREGA`
--
ALTER TABLE `ENTREGA`
  MODIFY `idEntrega` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ENTREGADOR`
--
ALTER TABLE `ENTREGADOR`
  MODIFY `idEntregador` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `GERENTE`
--
ALTER TABLE `GERENTE`
  MODIFY `idGerente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ITEM`
--
ALTER TABLE `ITEM`
  MODIFY `idItem` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `METODOPAGAMENTO`
--
ALTER TABLE `METODOPAGAMENTO`
  MODIFY `idMetodoPagamento` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `PEDIDO`
--
ALTER TABLE `PEDIDO`
  MODIFY `idPedido` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PIX`
--
ALTER TABLE `PIX`
  MODIFY `idPix` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `PRODUTO`
--
ALTER TABLE `PRODUTO`
  MODIFY `idProduto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `SUPERMERCADO`
--
ALTER TABLE `SUPERMERCADO`
  MODIFY `idSuperMercado` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `SUPERMERCADO_PRODUTO`
--
ALTER TABLE `SUPERMERCADO_PRODUTO`
  MODIFY `idSupermercado_Produto` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `idUser` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
