-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 1227.0.0.1
-- Tempo de geração: 30/09/2025 às 13:01
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `loja_brinquedos3`
--

DROP TABLE IF EXISTS `brinquedos3`;
DROP TABLE IF EXISTS `categorias`;
DROP TABLE IF EXISTS `clientes3`;
DROP TABLE IF EXISTS `equipe3`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nome_categoria_unico` (`nome_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--
INSERT INTO `categorias` (`id_categoria`, `nome_categoria`) VALUES
(1, 'Labubu'),
(2, 'Carrinho'),
(3, 'Lego'),
(4, 'Jogos de Tabuleiro'),
(5, 'Bonecos de Ação'),
(6, 'Bonecas e Acessórios'),
(7, 'Veículos'),
(8, 'Jogos de Tabuleiro e Quebra Cabeça'),
(9, 'Mundo Pocotoys');

-- --------------------------------------------------------

--
-- Estrutura para tabela `brinquedos3`
--
CREATE TABLE `brinquedos3` (
  `id_brinquedo` int(11) NOT NULL AUTO_INCREMENT,
  `nome_brinquedo` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `detalhes` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `id_categoria_fk` int(11) DEFAULT NULL,
  `imagem_brinquedo` varchar(255) DEFAULT NULL,
  `imagem1` varchar(255) DEFAULT NULL,
  `imagem2` varchar(255) DEFAULT NULL,
  `imagem3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_brinquedo`),
  KEY `fk_brinquedo_categoria_idx` (`id_categoria_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 
--
INSERT INTO `brinquedos3` (`id_brinquedo`, `nome_brinquedo`, `descricao`, `detalhes`, `preco`, `marca`, `id_categoria_fk`, `imagem_brinquedo`, `imagem1`, `imagem2`, `imagem3`) VALUES
(1, 'Labubu The Monsters', 'Action figure colecionável da série The Monsters.', 'Feito de vinil de alta qualidade, 15cm de altura.', 49.90, 'Pop Mart', 1, 'https://clan.akamai.steamstatic.com/images/3953147/9f2582825999fe009cc76a2414e9a3cac8dc5d0b_400x225.png', NULL, NULL),
(2, 'Carrinho de Controle Remoto', 'Carrinho de corrida com controle remoto, alta velocidade.', 'Bateria recarregável, alcance de 50 metros.', 79.90, 'Hot Wheels', 2, 'https://clan.akamai.steamstatic.com/images/3953147/9f2582825999fe009cc76a2414e9a3cac8dc5d0b_400x225.png', NULL, NULL, NULL),
(3, 'Blocos para Montar', 'Kit com 500 blocos de montar para estimular a criatividade.', 'Material plástico atóxico, recomendado para maiores de 5 anos.', 29.90, 'Mega Blocks', 3, 'https://clan.akamai.steamstatic.com/images/3953147/9f2582825999fe009cc76a2414e9a3cac8dc5d0b_400x225.png', NULL, NULL, NULL),
(4, 'Batman Action Figure', 'Boneco do Batman com 11 pontos de articulação.', 'Acompanha capa de tecido e bat-rang.', 129.90, 'DC Comics', 5, 'https://clan.akamai.steamstatic.com/images/3953147/9f2582825999fe009cc76a2414e9a3cac8dc5d0b_400x225.png', NULL, NULL, NULL);


-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes3`
--
CREATE TABLE `clientes3` (
  `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `UK_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE equipe3 (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome_membro VARCHAR(100) NOT NULL,
    funcao_membro VARCHAR(50),
    rgm VARCHAR(20) UNIQUE,
    foto_membro VARCHAR(255)
);

INSERT INTO equipe3 (nome_membro, rgm, foto_membro, funcao_membro) VALUES
('Priscila Diniz', '1234567890', 'priscila_diniz.jpg', 'Desenvolvedora de Banco de dados'),
('Danilo Zamai', '0987654321', 'danilo_zamai.jpg', 'Desenvolvedor'),
('Murilo Fernandes', '1122334455', 'murilo_fernandes.jpg', 'Desenvolvedor'),
('Mateus Picoli', '5544332211', 'mateus_picoli.jpg', 'Designer'),
('Paulo Cesar', '1010101010', 'paulo_cesar.jpg', 'Designer'),
('Raphael Godek', '2020202020', 'raphael_godek.jpg', 'Desenvolvedor');

--
-- AUTO_INCREMENT para tabelas despejadas
--
ALTER TABLE `categorias` MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE `brinquedos3` MODIFY `id_brinquedo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
ALTER TABLE `clientes3` MODIFY `id_cliente` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restrições (Constraints) para tabelas despejadas
--
ALTER TABLE `brinquedos3` ADD CONSTRAINT `fk_brinquedo_categoria` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;