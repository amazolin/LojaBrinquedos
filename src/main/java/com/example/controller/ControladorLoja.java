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

    // Método auxiliar para adicionar nomeUsuario em todas as páginas
    private void adicionarUsuarioLogado(Model model, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            model.addAttribute("nomeUsuario", usuario.getNome());
        }
    }

    // Página inicial da loja
    @GetMapping("/loja")
    public String mostrarMensagem(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("mensagem", "Bem-vindo a Pocotoys!");

        String erroLogin = (String) session.getAttribute("erroLogin");
        if (erroLogin != null) {
            model.addAttribute("erroLogin", erroLogin);
            session.removeAttribute("erroLogin");
        }

        return "loja";
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/loja";
    }

    // Página sobre
    @GetMapping("/sobre")
    public String sobre(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "sobre";
    }

    // Página de produtos
    @GetMapping("/produtos")
    public String produtos(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("produtos", brinquedoService.listarTodos());
        return "produtos";
    }

    // Detalhe do brinquedo
    @GetMapping("/brinquedo")
    public String detalheBrinquedo(@RequestParam("id") Long id, Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return brinquedoService.buscarPorId(id)
                .map(brinquedo -> {
                    model.addAttribute("brinquedo", brinquedo);
                    return "brinquedo-detalhe";
                })
                .orElse("redirect:/produtos");
    }

    // Administração
    @GetMapping("/administracao")
    public String administracao(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "administracao";
    }

    // Contato
    @GetMapping("/contato")
    public String contato(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "contato";
    }

    // Formulário de cadastro
    @GetMapping("/cadastro")
    public String cadastroForm(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("usuario", new Usuario());
        return "cadastro";
    }

    // Processar cadastro
    @PostMapping("/cadastro")
    public String cadastrar(@Valid @ModelAttribute Usuario usuario, Model model, HttpSession session) {
        try {
            usuarioService.cadastrar(usuario);
            session.setAttribute("usuarioLogado", usuario);
            return "redirect:/loja";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "cadastro";
        }
    }

    // GET login redireciona para /loja
    @GetMapping("/login")
    public String loginForm() {
        return "redirect:/loja";
    }

    // Processar login
    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String senha,
                        HttpSession session) {
        return usuarioService.autenticar(email, senha)
                .map(usuario -> {
                    session.setAttribute("usuarioLogado", usuario);
                    return "redirect:/loja";
                })
                .orElseGet(() -> {
                    session.setAttribute("erroLogin", "Credenciais inválidas");
                    return "redirect:/loja";
                });
    }
}
