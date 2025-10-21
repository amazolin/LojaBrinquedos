package com.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.Brinquedo;
import com.example.model.Categoria;
import com.example.model.Usuario;
import com.example.service.BrinquedoService;
import com.example.service.CategoriaService;
import com.example.service.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorLoja {

    private final UsuarioService usuarioService;
    private final BrinquedoService brinquedoService;
    private final CategoriaService categoriaService;

    public ControladorLoja(UsuarioService usuarioService, BrinquedoService brinquedoService, CategoriaService categoriaService) {
        this.usuarioService = usuarioService;
        this.brinquedoService = brinquedoService;
        this.categoriaService = categoriaService;
    }

    private void adicionarUsuarioLogado(Model model, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario != null) {
            model.addAttribute("nomeUsuario", usuario.getNome());
            Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
            model.addAttribute("isAdmin", isAdmin != null && isAdmin);
        }
    }

    private boolean isAdmin(HttpSession session) {
        Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
        return isAdmin != null && isAdmin;
    }

    @GetMapping("/loja")
    public String mostrarMensagem(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        model.addAttribute("mensagem", "Bem-vindo a Pocotoys!");
        List<Brinquedo> produtosEmDestaque = brinquedoService.listarTodos()
            .stream()
            .sorted((b1, b2) -> Integer.compare(b2.getInteresse(), b1.getInteresse()))
            .limit(3)
            .collect(Collectors.toList());
        model.addAttribute("produtos", produtosEmDestaque);
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

    @GetMapping("/historia")
    public String exibirHistoria(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "historia";
    }

    // Método /produtos para categoria e busca
    @GetMapping("/produtos")
    public String produtos(
            @RequestParam(value = "categoria", required = false) Long categoriaId,
            @RequestParam(value = "busca", required = false) String busca,
            Model model,
            HttpSession session) {

        adicionarUsuarioLogado(model, session);

        List<Categoria> categorias = categoriaService.listarTodas();
        model.addAttribute("categorias", categorias);

        List<Brinquedo> produtos;

        if (busca != null && !busca.isBlank()) {
            produtos = brinquedoService.buscarPorNome(busca);
            model.addAttribute("paramBusca", busca);
        } else if (categoriaId != null && categoriaId > 0) {
            produtos = brinquedoService.listarPorCategoria(categoriaId);
            model.addAttribute("categoriaSelecionadaId", categoriaId);
        } else {
            produtos = brinquedoService.listarTodos();
        }

        model.addAttribute("produtos", produtos);
        return "produtos";
    }

    @GetMapping("/brinquedo")
    public String detalheBrinquedo(@RequestParam("id") Long id, Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        boolean podeInteragir = usuario != null;
        boolean temInteresse = false;
        if (podeInteragir) {
            @SuppressWarnings("unchecked")
            List<Long> interesses = (List<Long>) session.getAttribute("interesses");
            if (interesses == null) interesses = new java.util.ArrayList<>();
            temInteresse = interesses.contains(id);
        }
        final boolean finalTemInteresse = temInteresse;
        final boolean finalPodeInteragir = podeInteragir;
        return brinquedoService.buscarPorId(id).map(brinquedo -> {
            model.addAttribute("brinquedo", brinquedo);
            model.addAttribute("temInteresse", finalTemInteresse);
            model.addAttribute("podeInteragir", finalPodeInteragir);
            return "brinquedo-detalhe";
        }).orElse("redirect:/produtos");
    }

    @PostMapping("/brinquedo/interesse")
    public String alternarInteresse(@RequestParam("id") Long id, HttpSession session) {
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        if (usuario == null) {
            return "redirect:/brinquedo?id=" + id;
        }
        @SuppressWarnings("unchecked")
        List<Long> interesses = (List<Long>) session.getAttribute("interesses");
        if (interesses == null) {
            interesses = new java.util.ArrayList<>();
        }
        boolean temInteresse = interesses.contains(id);
        Brinquedo brinquedo = brinquedoService.buscarPorId(id).orElse(null);
        if (brinquedo != null) {
            if (temInteresse) {
                interesses.remove(id);
                brinquedo.setInteresse(Math.max(0, brinquedo.getInteresse() - 1));
            } else {
                interesses.add(id);
                brinquedo.setInteresse(brinquedo.getInteresse() + 1);
            }
            brinquedoService.salvar(brinquedo);
        }
        session.setAttribute("interesses", interesses);
        return "redirect:/brinquedo?id=" + id;
    }

    @GetMapping("/administracao")
    public String administracao(Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/acesso-negado";
        }
        adicionarUsuarioLogado(model, session);
        model.addAttribute("brinquedos", brinquedoService.listarTodos());
        model.addAttribute("brinquedo", new Brinquedo());
        model.addAttribute("categorias", categoriaService.listarTodas());
        return "administracao";
    }

    @PostMapping("/administracao/adicionar")
    public String adicionarBrinquedo(@Valid @ModelAttribute Brinquedo brinquedo, BindingResult result, HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/acesso-negado";
        }
        if (result.hasErrors()) {
            adicionarUsuarioLogado(model, session);
            model.addAttribute("brinquedos", brinquedoService.listarTodos());
            model.addAttribute("categorias", categoriaService.listarTodas());
            return "administracao";
        }
        brinquedoService.salvar(brinquedo);
        return "redirect:/administracao";
    }

    @GetMapping("/administracao/editar/{id}")
    public String editarBrinquedoForm(@PathVariable("id") Long id, Model model, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/acesso-negado";
        }
        adicionarUsuarioLogado(model, session);
        Brinquedo brinquedo = brinquedoService.buscarPorId(id)
                .orElseThrow(() -> new IllegalArgumentException("Brinquedo inválido: " + id));
        model.addAttribute("brinquedo", brinquedo);
        model.addAttribute("categorias", categoriaService.listarTodas());
        return "editar-brinquedo";
    }

    @PostMapping("/administracao/editar")
    public String atualizarBrinquedo(@Valid @ModelAttribute Brinquedo brinquedo, BindingResult result, HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/acesso-negado";
        }
        if (result.hasErrors()) {
            adicionarUsuarioLogado(model, session);
            model.addAttribute("categorias", categoriaService.listarTodas());
            return "editar-brinquedo";
        }
        brinquedoService.salvar(brinquedo);
        return "redirect:/administracao";
    }

    @GetMapping("/administracao/excluir/{id}")
    public String excluirBrinquedo(@PathVariable("id") Long id, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/acesso-negado";
        }
        brinquedoService.deletar(id);
        return "redirect:/administracao";
    }

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
            boolean admin = usuario.getEmail().toLowerCase().endsWith("@pocotoys.com.br") ||
                            usuario.getEmail().toLowerCase().endsWith("@apocotoys.com.br");
            session.setAttribute("isAdmin", admin);
            return "redirect:/loja";
        } catch (IllegalArgumentException e) {
            model.addAttribute("erro", e.getMessage());
            return "cadastro";
        }
    }

    @GetMapping("/login")
    public String loginForm() {
        return "redirect:/loja";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String senha, HttpSession session) {
        return usuarioService.autenticar(email, senha).map(usuario -> {
            session.setAttribute("usuarioLogado", usuario);
            boolean admin = email.toLowerCase().endsWith("@pocotoys.com.br") ||
                            email.toLowerCase().endsWith("@apocotoys.com.br");
            session.setAttribute("isAdmin", admin);
            return "redirect:/loja";
        }).orElseGet(() -> {
            session.setAttribute("erroLogin", "Credenciais inválidas");
            return "redirect:/loja";
        });
    }

    @GetMapping("/contato")
    public String contato(Model model, HttpSession session) {
        adicionarUsuarioLogado(model, session);
        return "contato";
    }
}
