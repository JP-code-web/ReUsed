package pt.iade.reused.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pt.iade.reused.models.Escala;
import pt.iade.reused.repositories.EscalaRepository;


@RestController                              // http://localhost:8080/api/escala  mvnw spring-boot:run
@RequestMapping(path = "/api/escala")
public class EscalaController {
    private Logger logger = LoggerFactory.getLogger(EscalaController.class);
    @Autowired
    private EscalaRepository escalaRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<Escala> getEscalas() {
    logger.info("Enviar todos as escalas de avaliaçao");
        return escalaRepository.findAll();
    }
}   //poi
