package com.example.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.model.Brinquedo;

@Repository
public interface BrinquedoRepository extends JpaRepository<Brinquedo, Long> {
    // Método para encontrar todos os brinquedos de uma determinada categoria pelo ID
    List<Brinquedo> findByCategoriaId(Long categoriaId);
}