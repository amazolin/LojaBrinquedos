package com.example.model;

import jakarta.persistence.*; 
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "clientes3")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cliente")
    private Long id;

    @NotBlank(message = "O nome não pode ficar em branco")
    @Column(name = "nome_completo")
    private String nome;

    @NotBlank(message = "O email não pode ficar em branco")
    @Email(message = "O email deve ser válido")
    @Column(unique = true)
    private String email;

    @NotBlank(message = "A senha não pode ficar em branco")
    private String senha;

    public Usuario() {}

    public Usuario(String nome, String email, String senha) {
        this.nome = nome;
        this.email = email;
        this.senha = senha;
    }

    // getters e setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getSenha() { return senha; }
    public void setSenha(String senha) { this.senha = senha; }
}
