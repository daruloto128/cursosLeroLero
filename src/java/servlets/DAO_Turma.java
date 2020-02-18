package servlets;

import modelo.Turma;
import modelo.DbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
 
public class DAO_Turma extends DAO<Turma> {

    public DAO_Turma() {
        super("turmas");
    }

    @Override
    public boolean saveOrUpdate(Turma entity) {
        String query;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;

        if (entity.getId() == null) {
            query = "INSERT INTO " + tableName + "(instrutores_id, cursos_id, data_inicio, data_final, carga_horaria) VALUES (?, ?, ?, ?, ?)";
        } else {
            query = "UPDATE " + tableName + " SET instrutores_id = ?, cursos_id = ?, data_inicio = ?, data_final = ?, carga_horaria = ? WHERE id = ?";
        }

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, entity.getInstrutor().getId());
            ps.setLong(2, entity.getCurso().getId());
            ps.setDate(3, new Date(entity.getDataInicio().getTime()));
            ps.setDate(4, new Date(entity.getDataFinal().getTime()));
            ps.setShort(5, entity.getCargaHoraria());

            if (entity.getId() != null) {
                ps.setLong(5, entity.getId());
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
    public Optional<Turma> findById(Long id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = ?";
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Turma entidade = new Turma();

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                DAO_Instrutor instrutorDAO = new DAO_Instrutor();
                DAO_Curso cursoDAO = new DAO_Curso();

                entidade.setId(id);
                entidade.setInstrutor(instrutorDAO.findById(rs.getLong("instrutores_id")).get());
                entidade.setCurso(cursoDAO.findById(rs.getLong("cursos_id")).get());
                entidade.setDataInicio(rs.getDate("data_inicio"));
                entidade.setDataFinal(rs.getDate("data_final"));
                entidade.setCargaHoraria(rs.getShort("carga_horaria"));

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
    public List<Turma> findAll() {
        String query = "SELECT * FROM " + tableName;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Turma> list = new ArrayList<>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            Turma entidade;
            DAO_Instrutor instrutorDAO = new DAO_Instrutor();
            DAO_Curso cursoDAO = new DAO_Curso();

            while (rs.next()) {
                entidade = new Turma();

                entidade.setId(rs.getLong("id"));
                entidade.setInstrutor(instrutorDAO.findById(rs.getLong("instrutores_id")).get());
                entidade.setCurso(cursoDAO.findById(rs.getLong("cursos_id")).get());
                entidade.setDataInicio(rs.getDate("data_inicio"));
                entidade.setDataFinal(rs.getDate("data_final"));
                entidade.setCargaHoraria(rs.getShort("carga_horaria"));

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
