package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Brinquedo;
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

    // Método auxiliar para adicionar nomeUsuario e isAdmin
    private void adicionarUsuarioLogado(Model model, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            model.addAttribute("nomeUsuario", usuario.getNome());
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            model.addAttribute("isAdmin", isAdmin != null && isAdmin);
        }
    }

    // Páginas básicas
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

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/loja";
    }

    @GetMapping("/sobre")
    public String sobre(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "sobre";
    }

    @GetMapping("/produtos")
    public String produtos(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("produtos", brinquedoService.listarTodos());
        return "produtos";
    }

    @GetMapping("/brinquedo")
    public String detalheBrinquedo(@RequestParam("id") Long id, Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return brinquedoService.buscarPorId(id).map(brinquedo -> {
            model.addAttribute("brinquedo", brinquedo);
            return "brinquedo-detalhe";
        }).orElse("redirect:/produtos");
    }

    // Administração
    @GetMapping("/administracao")
    public String administracao(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("brinquedos", brinquedoService.listarTodos());
        model.addAttribute("brinquedo", new Brinquedo());
        return "administracao";
    }

    // Adicionar brinquedo
    @PostMapping("/administracao/adicionar")
    public String adicionarBrinquedo(@Valid @ModelAttribute Brinquedo brinquedo, BindingResult result,
                                     HttpSession session, Model model) {
        adicionarUsuarioLogado(model, session);
        if (result.hasErrors()) {
            model.addAttribute("brinquedos", brinquedoService.listarTodos());
            return "administracao";
        }
        brinquedoService.salvar(brinquedo);
        return "redirect:/administracao";
    }

    // Editar brinquedo (GET)
    @GetMapping("/administracao/editar/{id}")
    public String editarBrinquedoForm(@PathVariable("id") Long id, Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        Brinquedo brinquedo = brinquedoService.buscarPorId(id)
                .orElseThrow(() -> new IllegalArgumentException("Brinquedo inválido: " + id));
        model.addAttribute("brinquedo", brinquedo);
        return "editar-brinquedo";
    }

    // Editar brinquedo (POST)
    @PostMapping("/administracao/editar")
    public String atualizarBrinquedo(@Valid @ModelAttribute Brinquedo brinquedo, BindingResult result,
                                     HttpSession session, Model model) {
        adicionarUsuarioLogado(model, session);
        if (result.hasErrors()) {
            return "editar-brinquedo";
        }
        brinquedoService.salvar(brinquedo);
        return "redirect:/administracao";
    }

    // Excluir brinquedo
    @GetMapping("/administracao/excluir/{id}")
    public String excluirBrinquedo(@PathVariable("id") Long id, HttpSession session) {
        brinquedoService.deletar(id);
        return "redirect:/administracao";
    }

    // Cadastro de usuário
    @GetMapping("/cadastro")
    public String cadastroForm(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("usuario", new Usuario());
        return "cadastro";
    }

    @PostMapping("/cadastro")
    public String cadastrar(@Valid @ModelAttribute Usuario usuario, BindingResult result, Model model, HttpSession session) {
        if(result.hasErrors()) {
            return "cadastro";
        }
        try {
            usuarioService.cadastrar(usuario);
            session.setAttribute("usuarioLogado", usuario);
            if (usuario.getEmail().toLowerCase().endsWith("@pocotoys.com.br") ||
                usuario.getEmail().toLowerCase().endsWith("@apocotoys.com.br")) {
                session.setAttribute("isAdmin", true);
            } else {
                session.setAttribute("isAdmin", false);
            }
            return "redirect:/loja";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "cadastro";
        }
    }

    // Login
    @GetMapping("/login")
    public String loginForm() {
        return "redirect:/loja";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String senha, HttpSession session) {
        return usuarioService.autenticar(email, senha).map(usuario -> {
            session.setAttribute("usuarioLogado", usuario);
            if (email.toLowerCase().endsWith("@pocotoys.com.br") || email.toLowerCase().endsWith("@apocotoys.com.br")) {
                session.setAttribute("isAdmin", true);
            } else {
                session.setAttribute("isAdmin", false);
            }
            return "redirect:/loja";
        }).orElseGet(() -> {
            session.setAttribute("erroLogin", "Credenciais inválidas");
            return "redirect:/loja";
        });
    }
}
