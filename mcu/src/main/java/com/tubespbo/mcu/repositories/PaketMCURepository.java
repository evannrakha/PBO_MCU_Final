package com.tubespbo.mcu.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.*;
import com.tubespbo.mcu.beans.PaketMCU;




public interface PaketMCURepository extends JpaRepository<PaketMCU, Integer> {
    @Query(value = "SELECT * FROM paketmcu WHERE jenis_pemeriksaan = :jenisPemeriksaan", nativeQuery = true)
    public List<PaketMCU> findByJenisPemeriksaan(@Param("jenisPemeriksaan") String jenisPemeriksaan);
}
