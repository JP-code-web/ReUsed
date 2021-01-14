package pt.iade.reused.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "doacao")
public class Doacao {           //@ManyToOne
    @Id                                             
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "doa_id")
    private int doa_id;

    @Column(name = "doa_desc")
    private String doa_desc;

    @Column(name = "doa_marca")
    private String doa_marca;

    @Column(name ="doa_cor" )
    private String doa_cor;
    
    @ManyToOne  
    @JoinColumn(name="doa_tipo_id") // FK
    @JsonIgnoreProperties({"doacaos"})  // nao mexer no @JsonIgnoreProperties!
    private Tipo tipo;

    public Doacao() {}

    public Doacao(int doa_id, String doa_desc, String doa_marca, String doa_cor) {
        this.doa_id = doa_id;
        this.doa_desc = doa_desc;
        this.doa_marca = doa_marca;
        this.doa_cor = doa_cor;
    }

    public int getDoa_id() {
        return doa_id;
    }

    public String getDoa_desc() {
        return doa_desc;
    }

    public String getDoa_marca() {
        return doa_marca;
    }

    public String getDoa_cor() {
        return doa_cor;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

}   // poi
