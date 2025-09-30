-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/09/2025 às 16:45
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
  `id_brinquedo` int(11) NOT NULL,
  `codigo_brinquedo` varchar(20) DEFAULT NULL,
  `nome_brinquedo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `detalhes` text DEFAULT NULL,
  `preco` decimal(38,2) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `imagem_brinquedo` varchar(255) DEFAULT NULL,
  `imagem1` varchar(255) DEFAULT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `brinquedos3`
--

INSERT INTO `brinquedos3` (`id_brinquedo`, `codigo_brinquedo`, `nome_brinquedo`, `descricao`, `detalhes`, `preco`, `marca`, `imagem_brinquedo`, `imagem1`, `imagem2`, `imagem3`) VALUES
(3, NULL, 'Banco Imobiliário', 'Jogo de tabuleiro para 3 a 6 pessoas.\r\nRecomendado para crianças a partir de 10 anos.', 'Contém tabuleiro, dados, pinos para jogadores, cartas de terrenos.', 112.00, 'Estrela', 'https://www.havan.com.br/media/catalog/product/cache/73a52df140c4d19dbec2b6c485ea6a50/b/a/banco-imobiliario-realidade-aumentada_1062248.webp', 'https://www.havan.com.br/media/catalog/product/cache/73a52df140c4d19dbec2b6c485ea6a50/b/a/banco-imobiliario-realidade-aumentada_1062250.webp', 'https://www.havan.com.br/media/catalog/product/cache/73a52df140c4d19dbec2b6c485ea6a50/b/a/banco-imobiliario-realidade-aumentada_1062251.webp', ''),
(4, NULL, 'Casa de boneca', 'Casa de boneca de madeira.', 'Disponível em 3 cores diferentes.', 90.60, 'Madeirite', 'https://http2.mlstatic.com/D_NQ_NP_757502-MLB71280996741_082023-O-casinha-de-boneca-kit-30-moveis-em-mdf-pintado.webp', 'https://http2.mlstatic.com/D_NQ_NP_809828-MLB71280996755_082023-O-casinha-de-boneca-kit-30-moveis-em-mdf-pintado.webp', 'https://http2.mlstatic.com/D_NQ_NP_853318-MLB71280927425_082023-O-casinha-de-boneca-kit-30-moveis-em-mdf-pintado.webp', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `brinquedos3`
--
ALTER TABLE `brinquedos3`
  ADD PRIMARY KEY (`id_brinquedo`),
  ADD UNIQUE KEY `codigo_brinquedo` (`codigo_brinquedo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `brinquedos3`
--
ALTER TABLE `brinquedos3`
  MODIFY `id_brinquedo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
