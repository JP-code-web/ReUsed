package pt.iade.reused.repositories;

import org.springframework.data.repository.CrudRepository;
import pt.iade.reused.models.Inventario;

public interface InventarioRepository
extends CrudRepository<Inventario, Integer> {}