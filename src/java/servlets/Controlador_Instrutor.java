package servlets;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/instrutores")
public class Controlador_Instrutor extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO_Instrutor dao = new DAO_Instrutor();

        req.setAttribute("instrutores", dao.findAll());
        req.getRequestDispatcher("/WEB-INF/Instrutores.jsp").forward(req, resp);
    }

}
