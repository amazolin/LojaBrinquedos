package com.example.controller;

import com.example.model.Usuario;
import com.example.service.UsuarioService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ControladorLoja {

    private final UsuarioService usuarioService;

    public ControladorLoja(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    // Página inicial da loja
    @GetMapping("/loja")
    public String mostrarMensagem(Model model, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            model.addAttribute("nomeUsuario", usuario.getNome());
        }
        model.addAttribute("mensagem", "Bem-vindo a Pocotoys!");
        return "loja";
    }

    // Outras páginas fixas
    @GetMapping("/sobre")
    public String sobre() {
        return "sobre";
    }

    @GetMapping("/produtos")
    public String produtos() {
        return "produtos";
    }

    @GetMapping("/administracao")
    public String administracao() {
        return "administracao";
    }

    @GetMapping("/contato")
    public String contato() {
        return "contato";
    }

    // Formulário de cadastro
    @GetMapping("/cadastro")
    public String cadastroForm(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "cadastro";
    }

    // Processar cadastro
    @PostMapping("/cadastro")
    public String cadastrar(@Valid @ModelAttribute Usuario usuario, Model model) {
        try {
            usuarioService.cadastrar(usuario);
            model.addAttribute("mensagem", "Cadastro realizado com sucesso!");
            return "login"; // redireciona para login após cadastrar
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "cadastro";
        }
    }

    // Formulário de login
    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    // Processar login
    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String senha,
                        HttpSession session,
                        Model model) {
        return usuarioService.autenticar(email, senha)
                .map(usuario -> {
                    session.setAttribute("usuarioLogado", usuario);
                    return "redirect:/loja";
                })
                .orElseGet(() -> {
                    model.addAttribute("erro", "Credenciais inválidas");
                    return "login";
                });
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/loja";
    }
}
