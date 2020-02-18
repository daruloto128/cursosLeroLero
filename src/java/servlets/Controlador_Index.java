package servlets;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/index")
public class Controlador_Index extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO_Curso cursoDAO = new DAO_Curso();
        DAO_Turma turmaDAO = new DAO_Turma();

        req.setAttribute("cursos",cursoDAO.findAll());
        req.setAttribute("turmas", turmaDAO.findAll());
        req.getRequestDispatcher("/WEB-INF/Index.jsp").forward(req, resp);
    }

}
