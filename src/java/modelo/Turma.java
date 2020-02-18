package modelo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Turma extends Entidade {

    private Instrutor instrutor;
    private Curso curso;
    private Date dataInicio;
    private Date dataFinal;
    private Short cargaHoraria;

}
