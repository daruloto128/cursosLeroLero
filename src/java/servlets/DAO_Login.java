package servlets;

import enums.TipoUsuario;
import modelo.Usuario;
import modelo.DbUtils;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public abstract class DAO_Login<T extends Usuario> extends DAO<T> {

    protected DAO_Login(String tableName) {
        super(tableName);
    }

    public abstract Optional<Usuario> login(String login, String password);

    protected Optional<Usuario> login(String login, String password, TipoUsuario tipo) {
        String query = "SELECT * FROM " + tableName + " WHERE login = ?";
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, login);
            rs = ps.executeQuery();

            if (rs.next() && BCrypt.checkpw(password, rs.getString("senha"))) {
                Usuario user = new Usuario();
                user.setId(rs.getLong("id"));
                user.setNome(rs.getString("nome"));
                user.setLogin(rs.getString("login"));
                user.setTipo(tipo);

                return Optional.of(user);
            }

            return Optional.empty();
        } catch (SQLException e) {
            e.printStackTrace();

            return Optional.empty();
        } finally {
            DbUtils.closeQuietly(conn);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(rs);
        }
    }

}
