package servlets;

import modelo.Curso;
import modelo.DbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DAO_Curso extends DAO<Curso> {

    public DAO_Curso() {
        super("cursos");
    }

    @Override
    public boolean saveOrUpdate(Curso entity) {
        String query;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;

        if (entity.getId() == null) {
            query = "INSERT INTO " + tableName + "(nome, requisito, ementa, carga_horaria, valor) VALUES (?, ?, ?, ?, ?)";
        } else {
            query = "UPDATE " + tableName + " SET nome = ?, requisito = ?, ementa = ?, carga_horaria = ?, valor = ? WHERE id = ?";
        }

        try {
            ps = conn.prepareStatement(query);
            ps.setString(1, entity.getNome());
            ps.setString(2, entity.getRequisito());
            ps.setString(3, entity.getEmenta());
            ps.setShort(4, entity.getCargaHoraria());
            ps.setDouble(5, entity.getValor());

            if (entity.getId() != null) {
                ps.setLong(6, entity.getId());
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
    public Optional<Curso> findById(Long id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = ?";
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Curso entidade = new Curso();

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                entidade.setId(id);
                entidade.setNome(rs.getString("nome"));
                entidade.setRequisito(rs.getString("requisito"));
                entidade.setEmenta(rs.getString("ementa"));
                entidade.setCargaHoraria(rs.getShort("carga_horaria"));
                entidade.setValor(rs.getDouble("valor"));

                return Optional.of(entidade);
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
    public List<Curso> findAll() {
        String query = "SELECT * FROM " + tableName;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Curso> list = new ArrayList<>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            Curso entidade;

            while (rs.next()) {
                entidade = new Curso();
                entidade.setId(rs.getLong("id"));
                entidade.setNome(rs.getString("nome"));
                entidade.setRequisito(rs.getString("requisito"));
                entidade.setEmenta(rs.getString("ementa"));
                entidade.setCargaHoraria(rs.getShort("carga_horaria"));
                entidade.setValor(rs.getDouble("valor"));

                list.add(entidade);
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
