package pt.iade.reused.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pt.iade.reused.models.Colaborador;
import pt.iade.reused.repositories.ColaboradorRepository;


@RestController                              // http://localhost:8080/api/colab  mvnw spring-boot:run
@RequestMapping(path = "/api/colab")
public class ColaboradorController {
    private Logger logger = LoggerFactory.getLogger(ColaboradorController.class);
    @Autowired
    private ColaboradorRepository colaboradorRepository;
    @GetMapping(path = "", produces = MediaType.APPLICATION_JSON_VALUE)

    public Iterable<Colaborador> getColaboradores() {
    logger.info("enviar todos os colaboradores");
        return colaboradorRepository.findAll();
    }
} //  poi