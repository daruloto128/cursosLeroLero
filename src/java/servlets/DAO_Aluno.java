package servlets;

import enums.Aprovacao;
import enums.TipoUsuario;
import modelo.Aluno;
import modelo.Usuario;
import modelo.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DAO_Aluno extends DAO_Login<Aluno> {

    public DAO_Aluno() {
        super("alunos");
    }

    @Override
    public Optional<Usuario> login(String login, String password) {
        return this.login(login, password, TipoUsuario.ALUNO);
    }

    @Override
    public boolean saveOrUpdate(Aluno entidade) {
        String query;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;

        if (entidade.getId() == null) {
            query = "INSERT INTO " + tableName + "(nome, login, senha, cpf, email, celular, endereco, cidade, bairro, cep, comentario) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        } else {
            query = "UPDATE " + tableName + " SET nome = ?, login = ?, senha = ?, cpf = ?, email = ?, celular = ?, endereco = ?, cidade = ?, bairro = ?, cep = ?, comentario = ? WHERE id = ?";
        }

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, entidade.getNome());
            ps.setString(2, entidade.getLogin());
            ps.setString(3, entidade.hashPassword());
            ps.setString(4, entidade.getCpf());
            ps.setString(5, entidade.getEmail());
            ps.setString(6, entidade.getCelular());
            ps.setString(7, entidade.getEndereco());
            ps.setString(8, entidade.getCidade());
            ps.setString(9, entidade.getBairro());
            ps.setString(10, entidade.getCep());
            ps.setString(11, entidade.getComentario());

            if (entidade.getId() != null) {
                ps.setLong(12, entidade.getId());
                ps.executeUpdate();
            } else {
                ps.execute();
            }

            return true;
        } catch (SQLException e) {
            e.printStackTrace();

            return false;
        } finally {
            DbUtils.closeQuietly(conn);
            DbUtils.closeQuietly(ps);
        }
    }

    @Override
    public Optional<Aluno> findById(Long id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = ?";
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Aluno aluno = new Aluno();

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                aluno.setId(id);
                aluno.setLogin(rs.getString("login"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEmail(rs.getString("email"));
                aluno.setCelular(rs.getString("celular"));
                aluno.setEndereco(rs.getString("endereco"));
                aluno.setCidade(rs.getString("cidade"));
                aluno.setBairro(rs.getString("bairro"));
                aluno.setCep(rs.getString("cep"));
                aluno.setComentario(rs.getString("comentario"));
                aluno.setAprovado(Aprovacao.valueOf(rs.getString("aprovacao").toUpperCase()));

                return Optional.of(aluno);
            } else {
                return Optional.empty();
            }

        } catch (SQLException e) {
            e.printStackTrace();

            return Optional.empty();
        } finally {
            DbUtils.closeQuietly(conn);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(rs);
        }
    }

    @Override
    public List<Aluno> findAll() {
        String query = "SELECT * FROM " + tableName;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Aluno> list = new ArrayList<>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            Aluno aluno;

            while (rs.next()) {
                aluno = new Aluno();
                aluno.setId(rs.getLong("id"));
                aluno.setLogin(rs.getString("login"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEmail(rs.getString("email"));
                aluno.setCelular(rs.getString("celular"));
                aluno.setEndereco(rs.getString("endereco"));
                aluno.setCidade(rs.getString("cidade"));
                aluno.setBairro(rs.getString("bairro"));
                aluno.setCep(rs.getString("cep"));
                aluno.setComentario(rs.getString("comentario"));
                aluno.setAprovado(Aprovacao.valueOf(rs.getString("aprovacao").toUpperCase()));

                list.add(aluno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DbUtils.closeQuietly(conn);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(rs);
        }

        return list;
    }

}
