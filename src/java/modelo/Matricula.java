package modelo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class Matricula extends Entidade {

    private Aluno aluno;
    private Turma turma;
    private Date dataMatricula;
    private Double nota;

}
