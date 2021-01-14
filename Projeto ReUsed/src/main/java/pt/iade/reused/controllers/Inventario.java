package pt.iade.reused.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//import pt.iade.reused.models.Inventario; ♠
import pt.iade.reused.repositories.InventarioRepository;

@RestController                              // http://localhost:8080/api/invt  mvnw spring-boot:run
@RequestMapping(path = "/api/invt")
public class Inventario {
    private Logger logger = LoggerFactory.getLogger(Inventario.class);
    @Autowired
    private InventarioRepository inventarioRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<pt.iade.reused.models.Inventario> getTipos() {  //!!Perguntar porque é que nao aceita <Inventrio>
    logger.info("Enviar todo o inventario");
        return inventarioRepository.findAll();
    }
}   //poi