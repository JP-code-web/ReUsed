package pt.iade.reused.repositories;

import org.springframework.data.repository.CrudRepository;
//import org.springframework.stereotype.Repository;
import pt.iade.reused.models.Colaborador;


public interface ColaboradorRepository
extends CrudRepository<Colaborador, Integer> {}