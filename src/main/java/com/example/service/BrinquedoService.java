package com.example.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.model.Brinquedo;
import com.example.repository.BrinquedoRepository;

@Service
public class BrinquedoService {

    private final BrinquedoRepository brinquedoRepository;

    public BrinquedoService(BrinquedoRepository brinquedoRepository) {
        this.brinquedoRepository = brinquedoRepository;
    }

    public List<Brinquedo> listarTodos() {
        return brinquedoRepository.findAll();
    }

    // Método para listar por categoria
    public List<Brinquedo> listarPorCategoria(Long categoriaId) {
        return brinquedoRepository.findByCategoriaId(categoriaId);
    }

    // ✅ Novo método para busca por nome (com filtro parcial e ignorando maiúsculas/minúsculas)
    public List<Brinquedo> buscarPorNome(String nome) {
        return brinquedoRepository.findByNomeContainingIgnoreCase(nome);
    }

    public Optional<Brinquedo> buscarPorId(Long id) {
        return brinquedoRepository.findById(id);
    }

    public Brinquedo salvar(Brinquedo brinquedo) {
        return brinquedoRepository.save(brinquedo);
    }

    public void deletar(Long id) {
        brinquedoRepository.deleteById(id);
    }

    // Lista todos os brinquedos ordenados por interesse (maior primeiro)
    public List<Brinquedo> listarTodosPorInteresse() {
        return listarTodos().stream()
            .sorted((b1, b2) -> Integer.compare(b2.getInteresse(), b1.getInteresse()))
            .toList();
    }
}
