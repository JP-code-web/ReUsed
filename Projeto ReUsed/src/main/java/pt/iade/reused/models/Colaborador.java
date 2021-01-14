package pt.iade.reused.models;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name ="colaborador")
public class Colaborador {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int C_ID;
    private String C_nomeP;
    private String C_nomeU;
    private String C_genero;
    private LocalDate C_nascimento;
    public Colaborador() {}

    
    public Colaborador(int c_ID, String c_nomeP, String c_nomeU, String c_genero,LocalDate c_nascimento) {
        C_ID = c_ID;
        C_nomeP = c_nomeP;
        C_nomeU = c_nomeU;
        C_genero = c_genero;
        C_nascimento = c_nascimento;
    }

    public int getC_ID() {
        return C_ID;
    }

    public String getC_nomeP() {
        return C_nomeP;
    }

    public String getC_nomeU() {
        return C_nomeU;
    }

    public String getC_genero() {
        return C_genero;
    }

    public LocalDate getC_nascimento() {
        return C_nascimento;
    }
 
}   //poi