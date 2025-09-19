package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;





@Controller
public class ControladorLoja {

    @GetMapping("/loja")
    public String mostrarMensagem(Model model) {
        model.addAttribute("mensagem", "Bem-vindo à Loja de Brinquedos!");
        return "loja"; // nome do arquivo HTML sem o .html
    }

    @GetMapping("/sobre")
    public String sobre() {
        return "sobre"; // nome do arquivo HTML sem o .html
    }

    @GetMapping("/produtos")
    public String produtos() {
        return "produtos"; // nome do arquivo HTML sem o .html
    }

    @GetMapping("/administracao")
    public String administracao() {
        return "administracao"; // nome do arquivo HTML sem o .html
    }

    @GetMapping("/contato")
    public String contato() {
        return "contato"; // nome do arquivo HTML sem o .html
    }
    

}
