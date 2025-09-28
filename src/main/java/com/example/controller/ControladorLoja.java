package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Usuario;
import com.example.service.BrinquedoService;
import com.example.service.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorLoja {

    private final UsuarioService usuarioService;
    private final BrinquedoService brinquedoService;

    public ControladorLoja(UsuarioService usuarioService, BrinquedoService brinquedoService) {
        this.usuarioService = usuarioService;
        this.brinquedoService = brinquedoService;
    }

    // Página inicial da loja
    @GetMapping("/loja")
    public String mostrarMensagem(Model model, HttpSession session) {
        // Usuário logado
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            model.addAttribute("nomeUsuario", usuario.getNome());
        }

        // Mensagem de boas-vindas
        model.addAttribute("mensagem", "Bem-vindo a Pocotoys!");

        // Mensagem de erro de login, se houver
        String erroLogin = (String) session.getAttribute("erroLogin");
        if (erroLogin != null) {
            model.addAttribute("erroLogin", erroLogin);
            session.removeAttribute("erroLogin"); // limpa após exibir
        }

        return "loja";
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/loja";
    }

    // Outras páginas fixas
    @GetMapping("/sobre")
    public String sobre() {
        return "sobre";
    }

    @GetMapping("/produtos")
    public String produtos(Model model) {
        model.addAttribute("produtos", brinquedoService.listarTodos());
        return "produtos";
    }

    @GetMapping("/brinquedo")
    public String detalheBrinquedo(@RequestParam("id") Long id, Model model) {
        return brinquedoService.buscarPorId(id)
                .map(brinquedo -> {
                    model.addAttribute("brinquedo", brinquedo);
                    return "brinquedo-detalhe";
                })
                .orElse("redirect:/produtos");
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
            return "loja";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "cadastro";
        }
    }

    // GET login agora redireciona para /loja
    @GetMapping("/login")
    public String loginForm() {
        return "redirect:/loja";
    }

    // Processar login
    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String senha,
                        HttpSession session,
                        Model model) {
        return usuarioService.autenticar(email, senha)
                .map(usuario -> {
                    // login bem-sucedido
                    session.setAttribute("usuarioLogado", usuario);
                    return "redirect:/loja";
                })
                .orElseGet(() -> {
                    // login inválido
                    session.setAttribute("erroLogin", "Credenciais inválidas");
                    return "redirect:/loja";
                });
    }
}
