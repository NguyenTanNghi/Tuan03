package iuh.fit.se.tuan03.bai02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/signup")
public class SignUpController extends HttpServlet {
    private AccountDAO accountDAO = new AccountDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String reEmail = req.getParameter("reEmail");
        String password = req.getParameter("password");
        String dateStr = req.getParameter("birthday");
        String gender = req.getParameter("gender");

        if (!email.equals(reEmail)) {
            resp.getWriter().println("❌ Email không khớp, vui lòng thử lại!");
            return;
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dob;
        try {
            dob = sdf.parse(dateStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        Account account = new Account(firstName, lastName, email, password, dob, gender);

        try {
            accountDAO.insert(account);
        } catch (Exception e) {
            System.out.println("hello1");
            e.printStackTrace();
            resp.getWriter().println("Đăng ký thất bại!");
            System.out.println("hello");
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/list-account");
    }
}
