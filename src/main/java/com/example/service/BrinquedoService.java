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

    // Listar todos
    public List<Brinquedo> listarTodos() {
        return brinquedoRepository.findAll();
    }

    // Buscar por ID
    public Optional<Brinquedo> buscarPorId(Long id) {
        return brinquedoRepository.findById(id);
    }

    // Salvar (inserir ou atualizar)
    public Brinquedo salvar(Brinquedo brinquedo) {
        return brinquedoRepository.save(brinquedo);
    }

    // Deletar por ID
    public void deletar(Long id) {
        brinquedoRepository.deleteById(id);
    }
}
