package pt.iade.reused.models;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity     
@Table(name ="tipo_doacao")  //nome real da tabela no SQL
public class Inventario{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="tipodoa_id")
    private int tipodoa_id;

    @Column(name="tipodoa_nome")
    private String tipodoa_nome;
    
    @OneToMany
    @JoinColumn(name="doa_tipo_id") // ☺ fk key
    @JsonIgnoreProperties({"tipo"}) // NAO alterar
    private List<Doacao> doacaos;  // jasonignore "tipo_doacao" "tipodoa_id"
    
    public Inventario() {}

    public Inventario(int tipodoa_id, String tipodoa_nome, List<Doacao> doacaos) {
        this.tipodoa_id = tipodoa_id;
        this.tipodoa_nome = tipodoa_nome;
        this.doacaos = doacaos;
    }

    public int getTipodoa_id() {
        return tipodoa_id;
    }

    public String getTipodoa_nome() {
        return tipodoa_nome;
    }

    public List<Doacao> getDoacaos() {
        return doacaos;
    }

}   // poi