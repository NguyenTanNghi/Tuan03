package iuh.fit.se.tuan03.bai01.servlet;

import iuh.fit.se.tuan03.bai01.model.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/registration-form")
public class RegistrationForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationForm() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String day = request.getParameter("dobDay");
        String month = request.getParameter("dobMonth");
        String year = request.getParameter("dobYear");
        String birthday = day + " " + month + " " + year;

        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");

        String[] hobbiesArr = request.getParameterValues("hobby");
        String otherHobby = request.getParameter("otherHobby");

        String hobbies = "";
        if (hobbiesArr != null) {
            hobbies = String.join(", ", hobbiesArr);
        }
        if (otherHobby != null && !otherHobby.trim().isEmpty()) {
            hobbies += ", " + otherHobby;
        }

        String course = request.getParameter("course");

        // Tạo đối tượng Student
        Student sv = new Student(fname, lname, email, mobile, gender, birthday, address, city, pincode, state, country, hobbies, course);

        // Gửi dữ liệu sang JSP
        request.setAttribute("student", sv);
        RequestDispatcher rd = request.getRequestDispatcher("result-form.jsp");
        rd.forward(request, response);
    }
}
