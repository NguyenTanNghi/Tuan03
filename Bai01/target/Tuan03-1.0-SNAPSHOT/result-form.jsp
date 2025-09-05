<%--
  Created by IntelliJ IDEA.
  User: NguyenTanNghi
  Date: 9/5/2025
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="iuh.fit.se.tuan03.model.Student" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registration Result</title>
    </head>
    <body>
        <%
            Student student = (Student) request.getAttribute("student");
            if (student != null) {
        %>
        <h2>Registration Details</h2>
        <p><strong>First Name:</strong> <%= student.getFirstName() %></p>
        <p><strong>Last Name:</strong> <%= student.getLastName() %></p>
        <p><strong>Email:</strong> <%= student.getEmail() %></p>
        <p><strong>Mobile:</strong> <%= student.getMobileNumber() %></p>
        <p><strong>Gender:</strong> <%= student.getGender() %></p>
        <p><strong>Birthday:</strong> <%= student.getBirthday() %></p>
        <p><strong>Address:</strong> <%= student.getAddress() %></p>
        <p><strong>City:</strong> <%= student.getCity() %></p>
        <p><strong>Pin Code:</strong> <%= student.getPinCode() %></p>
        <p><strong>State:</strong> <%= student.getState() %></p>
        <p><strong>Country:</strong> <%= student.getCountry() %></p>
        <p><strong>Hobbies:</strong> <%= student.getHobbies() %></p>
        <p><strong>Course Applied For:</strong> <%= student.getCourse() %></p>
        <% } else { %>
        <p>No student information found.</p>
        <% } %>
    </body>
</html>
