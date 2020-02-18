package servlets;

import modelo.Aluno;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/registro")
public class Controlador_Registro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/Registro.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Aluno aluno = new Aluno();
        DAO_Aluno dao = new DAO_Aluno();

        aluno.setNome(req.getParameter("nome"));
        aluno.setLogin(req.getParameter("login"));
        aluno.setSenha(req.getParameter("senha"));
        aluno.setCpf(req.getParameter("cpf"));
        aluno.setEmail(req.getParameter("email"));
        aluno.setCelular(req.getParameter("celular"));
        aluno.setEndereco(req.getParameter("endereco"));
        aluno.setCidade(req.getParameter("cidade"));
        aluno.setBairro(req.getParameter("bairro"));
        aluno.setCep(req.getParameter("cep"));
        aluno.setComentario(req.getParameter("comentario"));

        if (dao.saveOrUpdate(aluno)) {
            req.setAttribute("mensagem", "Registro realizado com sucesso");
        } else {
            req.setAttribute("mensagem", "Ocorreu um erro no registro");
        }

        req.getRequestDispatcher("/WEB-INF/Registro.jsp").forward(req, resp);
    }
}
