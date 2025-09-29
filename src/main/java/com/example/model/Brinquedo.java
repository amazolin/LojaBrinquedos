package com.example.model;

import java.math.BigDecimal;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "brinquedos3")
public class Brinquedo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_brinquedo")
    private Long id;

    @Column(name = "nome_brinquedo", nullable = false)
    private String nome;

    @Column(name = "descricao", columnDefinition = "TEXT")
    private String descricao;

    @Column(name = "detalhes", columnDefinition = "TEXT")
    private String detalhes;

    @Column(name = "preco", nullable = false)
    private BigDecimal preco;

    @Column(name = "marca")
    private String marca;

    // Campo antigo (compatibilidade)
    @Column(name = "imagem_brinquedo")
    private String imagemBrinquedo;

    // Novos campos de imagens opcionais para carrossel
    @Column(name = "imagem1")
    private String imagem1;

    @Column(name = "imagem2")
    private String imagem2;

    @Column(name = "imagem3")
    private String imagem3;

    // Construtor
    public Brinquedo() {}

    // Getters e Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getDescricao() { return descricao; }
    public void setDescricao(String descricao) { this.descricao = descricao; }

    public String getDetalhes() { return detalhes; }
    public void setDetalhes(String detalhes) { this.detalhes = detalhes; }

    public BigDecimal getPreco() { return preco; }
    public void setPreco(BigDecimal preco) { this.preco = preco; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }

    public String getImagemBrinquedo() { return imagemBrinquedo; }
    public void setImagemBrinquedo(String imagemBrinquedo) { this.imagemBrinquedo = imagemBrinquedo; }

    public String getImagem1() { return imagem1; }
    public void setImagem1(String imagem1) { this.imagem1 = imagem1; }

    public String getImagem2() { return imagem2; }
    public void setImagem2(String imagem2) { this.imagem2 = imagem2; }

    public String getImagem3() { return imagem3; }
    public void setImagem3(String imagem3) { this.imagem3 = imagem3; }
}
