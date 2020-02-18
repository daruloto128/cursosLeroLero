package servlets;

import modelo.Aluno;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/comentarios")
public class Controlador_Comentarios extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO_Aluno dao = new DAO_Aluno();

        req.setAttribute("comentarios", dao.findAll().stream().filter(aluno -> aluno.getComentario() != null)
                .map(Aluno::getComentario));
        req.getRequestDispatcher("/WEB-INF/Comentarios.jsp").forward(req, resp);
    }

}
