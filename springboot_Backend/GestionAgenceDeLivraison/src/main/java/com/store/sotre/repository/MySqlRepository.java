package com.store.sotre.repository;

import com.store.sotre.model.Adresse;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MySqlRepository extends JpaRepository<Adresse,Integer> {
}