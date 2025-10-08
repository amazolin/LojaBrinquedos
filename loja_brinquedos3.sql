-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/10/2025 às 16:18
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_brinquedos3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `brinquedos3`
--

CREATE TABLE `brinquedos3` (
  `id_brinquedo` bigint(20) NOT NULL,
  `nome_brinquedo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `detalhes` text DEFAULT NULL,
  `preco` decimal(38,2) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `id_categoria_fk` int(11) DEFAULT NULL,
  `imagem_brinquedo` varchar(255) DEFAULT NULL,
  `imagem1` varchar(255) DEFAULT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  `interesse` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `brinquedos3`
--

INSERT INTO `brinquedos3` (`id_brinquedo`, `nome_brinquedo`, `descricao`, `detalhes`, `preco`, `marca`, `id_categoria_fk`, `imagem_brinquedo`, `imagem1`, `imagem2`, `imagem3`, `interesse`) VALUES
(1, 'Labubu The Monsters', 'Action figure colecionável da série The Monsters.', 'Feito de vinil de alta qualidade, 15cm de altura.', 49.90, 'Pop Mart', 1, 'https://http2.mlstatic.com/D_NQ_NP_933400-MLA92051269969_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_739573-MLA91651448822_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_687575-MLA92051240875_092025-O.webp', '', 1),
(2, 'Carrinho de Controle Remoto', 'Carrinho de corrida com controle remoto, alta velocidade.', 'Bateria recarregável, alcance de 50 metros.', 79.90, 'Hot Wheels', 2, 'https://http2.mlstatic.com/D_NQ_NP_864867-MLU78014566945_072024-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_989063-MLB74089584182_012024-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_640659-MLU78014566955_072024-O.webp', '', 0),
(3, 'Blocos para Montar', 'Kit com 500 blocos de montar para estimular a criatividade.', 'Material plástico atóxico, recomendado para maiores de 5 anos.', 29.90, 'Mega Blocks', 3, 'https://http2.mlstatic.com/D_NQ_NP_661754-MLB93820350265_092025-O-blocos-magneticos-132-pecas-stem-brinquedo-montar-3d.webp', 'https://http2.mlstatic.com/D_NQ_NP_971037-MLB93819850929_092025-O-blocos-magneticos-132-pecas-stem-brinquedo-montar-3d.webp', 'https://http2.mlstatic.com/D_NQ_NP_669422-MLB93820227771_092025-O-blocos-magneticos-132-pecas-stem-brinquedo-montar-3d.webp', '', 0),
(4, 'Batman Action Figure', 'Boneco do Batman com 11 pontos de articulação.', 'Acompanha capa de tecido e bat-rang.', 129.90, 'DC Comics', 5, 'https://images.virgula.me/2013/12/12809721_1709850359271468_778102089026941415_n.jpg', 'https://images.virgula.me/2013/12/05/1272277355-veja-galeria-dos-brinquedos-falsos-mais-engracados-do-mundo-3839401018.jpg', 'https://images.virgula.me/2013/12/05/2279213563-veja-galeria-dos-brinquedos-falsos-mais-engracados-do-mundo-2467293605.jpg', 'https://images.virgula.me/2013/12/05/2753913778-veja-galeria-dos-brinquedos-falsos-mais-engracados-do-mundo-3806731097.jpg', 0),
(5, 'Boneca Clássica Princesa', 'Boneca de princesa com vestido de gala e acessórios.', '30cm de altura, inclui sapatos e coroa removíveis.', 89.90, 'Estrela', 6, 'https://http2.mlstatic.com/D_NQ_NP_654358-MLB76535709492_052024-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_633207-MLB73037977439_112023-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_824413-CBT50548082099_072022-O.webp', '', 0),
(6, 'Jogo de Tabuleiro - Aventura Espacial', 'Jogo de estratégia para toda a família com tema espacial.', 'Para 2 a 4 jogadores, idade recomendada: 8+.', 99.90, 'Galápagos Jogos', 8, 'https://http2.mlstatic.com/D_NQ_NP_745362-MLA91562210236_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_916105-MLA91961243021_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_757803-MLA91961054671_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_931889-MLA91961064479_092025-O.webp', 0),
(7, 'LEGO City - Delegacia de Polícia', 'Conjunto completo da delegacia de polícia de LEGO City.', 'Inclui 3 minifiguras, carro de polícia e helicóptero. 668 peças.', 299.90, 'LEGO', 3, 'https://http2.mlstatic.com/D_NQ_NP_893116-MLA93874223680_102025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_864923-MLU54970640124_042023-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_745620-MLU54970640126_042023-O.webp', '', 0),
(8, 'Urso de Pelúcia Gigante', 'Urso de pelúcia super macio e fofinho.', 'Material antialérgico, 80cm de altura sentado.', 149.90, 'Fofy Toys', 10, 'https://i.redd.it/97ee3hp6pldb1.jpg', 'https://i.pinimg.com/736x/60/85/f3/6085f3b67568e275478a1601780badb4.jpg', '', '', 0),
(9, 'Kit de Química para Crianças', 'Realize mais de 50 experimentos químicos seguros e divertidos.', 'Inclui tubos de ensaio, óculos de proteção e reagentes não-tóxicos.', 75.50, 'Science4you', 11, 'https://http2.mlstatic.com/D_NQ_NP_692594-MLB44846439953_022021-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_698890-MLA79658458201_092024-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_715392-MLB44846439951_022021-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_696269-MLB47566784007_092021-O.webp', 0),
(10, 'Teclado Musical Infantil', 'Mini teclado com 32 teclas, ritmos e sons de animais.', 'Funciona com pilhas (não inclusas), microfone embutido.', 119.90, 'FunKey', 12, 'https://http2.mlstatic.com/D_NQ_NP_766468-MLA91591770808_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_761126-MLA91990763423_092025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_711150-MLA91990753521_092025-O.webp', '', 0),
(11, 'Quebra-Cabeça 1000 Peças - Paisagem Alpina', 'Desafie sua mente com esta bela paisagem dos Alpes.', 'Tamanho montado: 68 x 49 cm. Peças com encaixe perfeito.', 59.90, 'Grow', 8, 'https://http2.mlstatic.com/D_NQ_NP_969423-MLU72700362855_112023-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_699131-MLB47358123675_092021-O.webp', '', '', 0),
(12, 'Homem-Aranha Action Figure', 'Boneco do Homem-Aranha da série Marvel Legends.', 'Altamente articulado, inclui troca de mãos e efeitos de teia.', 159.90, 'Hasbro', 5, 'https://down-br.img.susercontent.com/file/eb09eb87cacfdc3a9d1bd34d091a355a.webp', 'https://down-br.img.susercontent.com/file/br-11134207-7r98o-m0y1jrmzhjcw58.webp', '', '', 0),
(13, 'Robocop', 'Boneco fodido do Robocop.\r\nSupostamente o Robocop.', 'Possivelmente radioativo.\r\nProibido para pessoas.', 10.00, 'Pentagrama Toys', 5, 'https://i.etsystatic.com/57739190/r/il/17703b/6924967078/il_1140xN.6924967078_8x1m.jpg', 'https://i.imgur.com/FRsPBoa.jpeg', '', '', 0),
(14, 'Bonecos Big Alliance', 'Todo mundo junto e misturado.\r\nÉ o Big Alliance!', 'Não compre para o seu filho!', 2.00, 'Pentagrama Toys', 5, 'https://2.bp.blogspot.com/-NcsVuJjwu8M/VLjW3d8WmjI/AAAAAAAAjOE/fE-z3_D1Lqw/s1600/31%2B-%2BPDi7yrf.jpg', 'http://ig-wp-colunistas.s3.amazonaws.com/obutecodanet/wp-content/uploads/2012/10/brinquedos_03.jpg', 'http://ig-wp-colunistas.s3.amazonaws.com/obutecodanet/wp-content/uploads/2012/10/brinquedos_09.jpg', 'http://ig-wp-colunistas.s3.amazonaws.com/obutecodanet/wp-content/uploads/2012/10/brinquedos_14.jpg', 0),
(15, 'Bola de basquete', 'Bala de basquete tamanho profissional.\r\nDuas opções de cores.', 'É um círculo.', 89.00, 'Penalty', 13, 'https://http2.mlstatic.com/D_NQ_NP_897857-MLA87303248616_072025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_912763-MLA87303042918_072025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_974256-MLA88514332918_072025-O.webp', 'https://http2.mlstatic.com/D_NQ_NP_978286-MLA88514342612_072025-O.webp', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`) VALUES
(13, 'Artigos Esportivos'),
(6, 'Bonecas e Acessórios'),
(5, 'Bonecos de Ação'),
(2, 'Carrinho'),
(11, 'Educativos e Científicos'),
(14, 'Fantasias'),
(12, 'Instrumentos Musicais'),
(4, 'Jogos de Tabuleiro'),
(8, 'Jogos de Tabuleiro e Quebra Cabeça'),
(1, 'Labubu'),
(3, 'Lego'),
(9, 'Mundo Pocotoys'),
(10, 'Pelúcias'),
(7, 'Veículos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes3`
--

CREATE TABLE `clientes3` (
  `id_cliente` bigint(20) NOT NULL,
  `nome_completo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes3`
--

INSERT INTO `clientes3` (`id_cliente`, `nome_completo`, `email`, `senha`) VALUES
(1, 'Chefe', 'chefe@pocotoys.com.br', '123456'),
(2, 'Danilo', 'danilo@teste.com.br', '123456');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe3`
--

CREATE TABLE `equipe3` (
  `id_membro` int(11) NOT NULL,
  `nome_membro` varchar(100) NOT NULL,
  `funcao_membro` varchar(50) DEFAULT NULL,
  `rgm` varchar(20) DEFAULT NULL,
  `foto_membro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `equipe3`
--

INSERT INTO `equipe3` (`id_membro`, `nome_membro`, `funcao_membro`, `rgm`, `foto_membro`) VALUES
(1, 'Priscila Diniz', 'Desenvolvedora de Banco de dados', '1234567890', 'priscila_diniz.jpg'),
(2, 'Danilo Zamai', 'Desenvolvedor', '0987654321', 'danilo_zamai.jpg'),
(3, 'Murilo Fernandes', 'Desenvolvedor', '1122334455', 'murilo_fernandes.jpg'),
(4, 'Mateus Picoli', 'Designer', '5544332211', 'mateus_picoli.jpg'),
(5, 'Paulo Cesar', 'Designer', '1010101010', 'paulo_cesar.jpg'),
(6, 'Raphael Godek', 'Desenvolvedor', '2020202020', 'raphael_godek.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `brinquedos3`
--
ALTER TABLE `brinquedos3`
  ADD PRIMARY KEY (`id_brinquedo`),
  ADD KEY `fk_brinquedo_categoria_idx` (`id_categoria_fk`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria_unico` (`nome_categoria`);

--
-- Índices de tabela `clientes3`
--
ALTER TABLE `clientes3`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `UK_email` (`email`);

--
-- Índices de tabela `equipe3`
--
ALTER TABLE `equipe3`
  ADD PRIMARY KEY (`id_membro`),
  ADD UNIQUE KEY `rgm` (`rgm`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brinquedos3`
--
ALTER TABLE `brinquedos3`
  MODIFY `id_brinquedo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `clientes3`
--
ALTER TABLE `clientes3`
  MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `equipe3`
--
ALTER TABLE `equipe3`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `brinquedos3`
--
ALTER TABLE `brinquedos3`
  ADD CONSTRAINT `fk_brinquedo_categoria` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
