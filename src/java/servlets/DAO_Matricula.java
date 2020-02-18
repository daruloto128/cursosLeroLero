package servlets;

import modelo.Matricula;
import modelo.DbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class DAO_Matricula extends DAO<Matricula> {

    public DAO_Matricula() {
        super("matriculas");
    }

    @Override
    public boolean saveOrUpdate(Matricula entity) {
        String query;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;

        if (entity.getId() == null) {
            query = "INSERT INTO " + tableName + "(alunos_id, turmas_id, data_matricula, nota) VALUES (?, ?, ?, ?)";
        } else {
            query = "UPDATE " + tableName + " SET alunos_id = ?, turmas_id = ?, data_matricula = ?, nota = ? WHERE id = ?";
        }

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, entity.getAluno().getId());
            ps.setLong(2, entity.getTurma().getId());
            ps.setDate(3, new Date(entity.getDataMatricula().getTime()));
            ps.setDouble(4, entity.getNota());

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
    public Optional<Matricula> findById(Long id) {
        String query = "SELECT * FROM " + tableName + " WHERE id = ?";
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Matricula entidade = new Matricula();

        try {
            ps = conn.prepareStatement(query);
            ps.setLong(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                DAO_Aluno alunoDAO = new DAO_Aluno();
                DAO_Turma turmaDAO = new DAO_Turma();

                entidade.setId(id);
                entidade.setAluno(alunoDAO.findById(rs.getLong("alunos_id")).get());
                entidade.setTurma(turmaDAO.findById(rs.getLong("turmas_id")).get());
                entidade.setDataMatricula(rs.getDate("data_matricula"));
                entidade.setNota(rs.getDouble("nota"));

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
    public List<Matricula> findAll() {
        String query = "SELECT * FROM " + tableName;
        Connection conn = DatabaseConnection.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Matricula> list = new ArrayList<>();

        try {
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            Matricula entidade;
            DAO_Aluno alunoDAO = new DAO_Aluno();
            DAO_Turma turmaDAO = new DAO_Turma();

            while (rs.next()) {
                entidade = new Matricula();

                entidade.setId(rs.getLong("id"));
                entidade.setAluno(alunoDAO.findById(rs.getLong("alunos_id")).get());
                entidade.setTurma(turmaDAO.findById(rs.getLong("turmas_id")).get());
                entidade.setDataMatricula(rs.getDate("data_matricula"));
                entidade.setNota(rs.getDouble("nota"));

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
