package modelo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Curso extends Entidade {

    private String nome;
    private String requisito;
    private String ementa;
    private Short cargaHoraria;
    private Double valor;

}
