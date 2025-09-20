-- Cria o banco de dados se ele não existir
CREATE DATABASE IF NOT EXISTS loja_brinquedos3;

-- Usa o banco de dados loja_brinquedos3
USE loja_brinquedos3;

-- Tabela de Categorias
CREATE TABLE categorias3 (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    imagem_categoria VARCHAR(255)
);

-- Tabela de Brinquedos
CREATE TABLE brinquedos3 (
    id_brinquedo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_brinquedo VARCHAR(20) UNIQUE,
    nome_brinquedo VARCHAR(100) NOT NULL,
    descricao TEXT,
    detalhes TEXT,
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(50),
    imagem_brinquedo VARCHAR(255)
);

-- Tabela de Relacionamento entre Brinquedos e Categorias
CREATE TABLE brinquedos_categorias3 (
    id_brinquedo INT,
    id_categoria INT,
    PRIMARY KEY (id_brinquedo, id_categoria),
    FOREIGN KEY (id_brinquedo) REFERENCES brinquedos3(id_brinquedo) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categorias3(id_categoria) ON DELETE CASCADE
);

-- Tabela da Equipe
CREATE TABLE equipe3 (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome_membro VARCHAR(100) NOT NULL,
    funcao_membro VARCHAR(50),
    rgm VARCHAR(20) UNIQUE,
    foto_membro VARCHAR(255)
);

-- Tabela de Destaques
CREATE TABLE destaques3 (
    id_destaque INT AUTO_INCREMENT PRIMARY KEY,
    id_brinquedo INT,
    FOREIGN KEY (id_brinquedo) REFERENCES brinquedos3(id_brinquedo) ON DELETE CASCADE
);

-- Tabela de Clientes para Login/Cadastro
CREATE TABLE clientes3 (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

---
-- Inserção de dados
---

-- Inserindo categorias
INSERT INTO categorias3 (nome_categoria) VALUES
('bonecas e Acessórios'),
('Veículos'),
('Jogos de Tabuleiro e Quebra Cabeça'),
('Mundo Pocotoys');

-- Inserindo brinquedos
INSERT INTO brinquedos3 (codigo_brinquedo, nome_brinquedo, descricao, detalhes, preco, marca) VALUES
('100', 'Bebê Reborn', 'Bebê reborn realista 100% artesanal, feito de silicone. Acompanha 1 mamadeira, 1 chupeta magnética, 1 fralda, 1 certidão de nascimento e 1 conjunto de roupas', 'muito macio, muito confortável, seguro, real ao toque.48 cm de comprimento, peso: 1 kg', 276.00, 'BrasToy'),
('200', 'Bárbie', 'Bárbie Ginasta Cabelo Castanho para crianças a partir de 3 anos. Acompanha barra de ginástia, mochila e medalha', 'Cabelo castanho', 202.50, 'Mattel'),
('300', 'Draculaura', 'Boneca Draculaura (Monster High) para crianças a partir de 4 anos,com Scooter', 'Boneca articulada. Acompanha seu mascote (morcego de estimação) e uma scooter Rosa e preta com cesta.Além de um macacão de corrida estampado em xadrez, luvas pretas e botas . Dois capacetes combinando também estão incluídos', 283.50, 'Mattel'),
('400', 'Casa da Bárbie', 'Casa de Bonecas Dos Sonhos para crianças a partir de 3 anos', 'Casa luxuosa com 3 andares e 75 acessórios', 1750.00, 'Mattel'),
('500', 'Carro da Bárbie', 'Carro Conversível para crianças a partir de 3 anos', 'Formato esportivo. Comporta até 2 bonecas. Cor: Rosa', 300.00, 'Mattel'),
('600', 'Carrinho Hot Wheels', 'Hot Wheels Bugatti Bolide, HW Exotics 6/10 [Black/Blue] 213/250', 'Preto e Azul', 123.50, 'Mattel'),
('700', 'Caminhão Basculante', 'Caminhão Strong Basculante', 'Material -Plastico, Cor: Preto e Amarelo', 55.00, 'Nig Brinquedos'),
('800', 'Avião de Brinquedo', 'Aviao de Friccao Planebus 710A Mega City com Luz e Som', 'Detalhes : +3 anos, Com luz e som, Com 3 baterias AG13 já inclusas', 80.00, 'BBR TOYS'),
('900', 'Navio', 'Navio Transatlantico multicolorido', 'Material plastico, multicor', 45.59, 'Gulliver'),
('1000', 'Jogo da Vida', 'é um jogo de tabuleiro que simula uma jornada pela vida, onde os jogadores escolhem suas carreiras, casam, têm filhos, enfrentam desafios e buscam acumular o máximo de dinheiro até o final do jogo', 'Tipo de jogo: tabuleiro', 100.00, 'Estrela'),
('2000', 'Banco Imobiliário', 'é um jogo de tabuleiro moderno e competitivo, que traz a dinâmica do mundo dos negócios para os dias atuais. Com este jogo, você pode diversificar seus investimentos e ver crescer construções incríveis em suas propriedades. É um jogo de estratégia', 'Objetivo do jogo: ser o jogador com mais dinheiro ao final do jogo, Tempo de Jogo: 90 minutos, Não recomendado para crianças menores de 7 anos', 110.00, 'Estrela'),
('3000', 'Cubo Mágico', 'Cubo Mágico Profissional', 'Feito de plástico resistente, Dimensões:27.5 cm de altura, 40.4 cm de comprimento e 5 cm de largura, Quebra cabeça de designe colorido, portátil e prático, durável e resistente', 20.00, 'Cuber'),
('4000', 'Quebra Cabeça de 1000 Peças', 'Quebra-cabeça 1000 Peças Snoopy - Peanuts', 'Puzzle 1000 Peças, Multicolorido, Dimensões da Embalagem: 19,5 x 27,5 x 7 cm, Recomendado a partir de 10 anos.', 79.90, 'Grow'),
('5000', 'Forte', 'Forte Apache, Batalha Júnior', 'Cenário com cercados, torres, mastros, figuras de índios, confederados e cavalos', 97.58, 'Gulliver'),
('6000', 'Cavalinho Inflável', 'Cavalinho Pula Pula infantil rosa', 'Material: PVC e Plástico, brinquedo emite luzes', 92.90, 'Estrela'),
('7000', 'Cavalinho Realista', 'Cavalinho com som sortido', 'É resistente, Cavalinhos com som, Cor do produto: MARROM', 110.00, 'Buba Toys'),
('8000', 'Chapéu de Cowboy Infantil', 'Chapeu de cowboy infantil unissex', 'Camurça, tamanho unico, cor sortida', 42.90, 'PocoToys');

-- Inserindo os relacionamentos entre brinquedos e categorias
INSERT INTO brinquedos_categorias3 (id_brinquedo, id_categoria) VALUES
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '100'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'bonecas e Acessórios')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '200'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'bonecas e Acessórios')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '300'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'bonecas e Acessórios')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '400'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'bonecas e Acessórios')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '500'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'bonecas e Acessórios')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '600'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Veículos')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '700'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Veículos')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '800'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Veículos')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '900'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Veículos')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '1000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Jogos de Tabuleiro e Quebra Cabeça')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '2000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Jogos de Tabuleiro e Quebra Cabeça')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '3000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Jogos de Tabuleiro e Quebra Cabeça')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '4000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Jogos de Tabuleiro e Quebra Cabeça')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '5000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Mundo Pocotoys')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '6000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Mundo Pocotoys')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '7000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Mundo Pocotoys')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '8000'), (SELECT id_categoria FROM categorias3 WHERE nome_categoria = 'Mundo Pocotoys'));

-- Inserindo os brinquedos em destaque
INSERT INTO destaques3 (id_brinquedo) VALUES
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '100')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '7000')),
((SELECT id_brinquedo FROM brinquedos3 WHERE codigo_brinquedo = '400'));

-- Inserindo os membros da equipe com suas funções
INSERT INTO equipe3 (nome_membro, rgm, foto_membro, funcao_membro) VALUES
('Priscila Diniz', '1234567890', 'priscila_diniz.jpg', 'Desenvolvedora de Banco de dados'),
('Danilo Zamai', '0987654321', 'danilo_zamai.jpg', 'Desenvolvedor'),
('Murilo Fernandes', '1122334455', 'murilo_fernandes.jpg', 'Desenvolvedor'),
('Mateus Picoli', '5544332211', 'mateus_picoli.jpg', 'Designer'),
('Paulo Cesar', '1010101010', 'paulo_cesar.jpg', 'Designer'),
('Raphael Godek', '2020202020', 'raphael_godek.jpg', 'Desenvolvedor');