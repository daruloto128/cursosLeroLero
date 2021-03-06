package modelo;

import enums.TipoUsuario;
import lombok.Getter;
import lombok.Setter;
import org.mindrot.jbcrypt.BCrypt;

@Getter
@Setter
public class Usuario extends Entidade {

    private String nome;
    private String login;
    private String senha;
    private TipoUsuario tipo;

    public String hashPassword() {
        return BCrypt.hashpw(this.senha, BCrypt.gensalt());
    }

}
