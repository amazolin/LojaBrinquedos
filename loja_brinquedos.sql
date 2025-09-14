 CREATE DATABASE IF NOT EXISTS loja_brinquedos;

USE loja_brinquedos;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    imagem_categoria VARCHAR(255)
);

CREATE TABLE brinquedos (
    id_brinquedo INT AUTO_INCREMENT PRIMARY KEY,
    codigo_brinquedo VARCHAR(20) UNIQUE,
    nome_brinquedo VARCHAR(100) NOT NULL,
    descricao TEXT,
    detalhes TEXT,
    preco DECIMAL(10,2) NOT NULL,
    marca VARCHAR(50),
    imagem_brinquedo VARCHAR(255)
);

CREATE TABLE brinquedos_categorias (
    id_brinquedo INT,
    id_categoria INT,
    PRIMARY KEY (id_brinquedo, id_categoria),
    FOREIGN KEY (id_brinquedo) REFERENCES brinquedos(id_brinquedo) ON DELETE CASCADE,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON DELETE CASCADE
);

CREATE TABLE equipe (
    id_membro INT AUTO_INCREMENT PRIMARY KEY,
    nome_membro VARCHAR(100) NOT NULL,
    rgm VARCHAR(20) UNIQUE,
    foto_membro VARCHAR(255)
);

CREATE TABLE destaques (
    id_destaque INT AUTO_INCREMENT PRIMARY KEY,
    id_brinquedo INT,
    FOREIGN KEY (id_brinquedo) REFERENCES brinquedos(id_brinquedo) ON DELETE CASCADE
);