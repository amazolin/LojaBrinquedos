package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Brinquedo;

@Repository
public interface BrinquedoRepository extends JpaRepository<Brinquedo, Long> {

    // Encontrar brinquedos por categoria
    List<Brinquedo> findByCategoriaId(Long categoriaId);

    // 🔍 Novo método para busca por nome (parcial e sem diferenciar maiúsculas/minúsculas)
    List<Brinquedo> findByNomeContainingIgnoreCase(String nome);
}
