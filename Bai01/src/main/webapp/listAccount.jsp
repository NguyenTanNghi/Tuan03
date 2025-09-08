<%--
  Created by IntelliJ IDEA.
  User: Tan Nghi
  Date: 9/8/2025
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Danh sách Account</title><%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8">
        <title>Danh sách Account</title>
        <style>
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 20px;
          }

          h2 {
            text-align: center;
            color: #4A90E2;
            margin-bottom: 20px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
          }

          table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
          }

          th, td {
            padding: 12px 15px;
            text-align: center;
          }

          th {
            background-color: #4A90E2;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }

          tr:nth-child(even) {
            background-color: #f6f8fa;
          }

          tr:hover {
            background-color: #d9eaff;
            transform: scale(1.02);
            transition: all 0.3s ease;
          }

          td {
            transition: all 0.3s ease;
          }
        </style>
      </head>
      <body>
        <h2>Danh sách Account</h2>
        <table>
          <tr>
            <th>Email</th>
            <th>Full Name</th>
            <th>Date of Birth</th>
            <th>Gender</th>
          </tr>
          <c:forEach var="acc" items="${accounts}">
            <tr>
              <td>${acc.email}</td>
              <td>${acc.firstName} ${acc.lastName}</td>
              <td><fmt:formatDate value="${acc.dob}" pattern="dd/MM/yyyy"/></td>
              <td>${acc.gender}</td>
            </tr>
          </c:forEach>
        </table>
      </body>
    </html>
