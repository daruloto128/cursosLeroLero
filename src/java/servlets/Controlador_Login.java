package servlets;

import enums.TipoUsuario;
import modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Optional;

@WebServlet("/login")
public class Controlador_Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String senha = req.getParameter("senha");
        String tipo = req.getParameter("tipo");

        if (login != null && senha != null && tipo != null) {
            DAO_Login<?> dao;

            if (tipo.equals(TipoUsuario.ADMIN.tipo)) {
                dao = new DAO_Admin();
            } else if (tipo.equals(TipoUsuario.INSTRUTOR.tipo)) {
                dao = new DAO_Instrutor();
            } else if (tipo.equals(TipoUsuario.ALUNO.tipo)) {
                dao = new DAO_Aluno();
            } else {
                req.getRequestDispatcher("/WEB-INF/Login.jsp").forward(req, resp);

                return;
            }

            Optional<Usuario> user = dao.login(login, senha);

            if (user.isPresent()) {
                req.getSession().setAttribute("user", user.get());
                resp.sendRedirect("/");

                return;
            } else {
                req.setAttribute("mensagem", "Login ou senha incorretos");
            }
        } else {
            req.setAttribute("mensagem", "Os parâmetros requeridos não foram passados");
        }

        req.getRequestDispatcher("/WEB-INF/Login.jsp").forward(req, resp);
    }

}
