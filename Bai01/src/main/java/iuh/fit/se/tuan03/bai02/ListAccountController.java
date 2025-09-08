package iuh.fit.se.tuan03.bai02;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/list-account")
public class ListAccountController extends HttpServlet {
    private AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Account> accounts = accountDAO.findAll();
            req.setAttribute("accounts", accounts);
            RequestDispatcher rd = req.getRequestDispatcher("/listAccount.jsp");
            rd.forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
