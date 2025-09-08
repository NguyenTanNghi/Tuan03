<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Multi-language Demo</title>
        <style>
            /* Body với gradient animation */
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
                background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #a1c4fd, #c2e9fb);
                background-size: 400% 400%;
                animation: gradientBG 15s ease infinite;
            }

            @keyframes gradientBG {
                0% {background-position: 0% 50%;}
                50% {background-position: 100% 50%;}
                100% {background-position: 0% 50%;}
            }

            /* Form container */
            .form-container {
                background: rgba(255, 255, 255, 0.95);
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.2);
                width: 380px;
                animation: fadeInUp 1s ease forwards;
                opacity: 0;
                transform: translateY(30px);
            }

            @keyframes fadeInUp {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            h2 {
                text-align: center;
                color: #4A90E2;
                margin-bottom: 30px;
                animation: fadeIn 1s ease forwards;
            }

            @keyframes fadeIn {
                from {opacity: 0;}
                to {opacity: 1;}
            }

            /* Radio language */
            .language-choice {
                display: flex;
                justify-content: space-around;
                margin-bottom: 25px;
                animation: slideInLeft 0.8s ease forwards;
                opacity: 0;
            }

            @keyframes slideInLeft {
                to {opacity: 1; transform: translateX(0);}
            }

            label {
                cursor: pointer;
                font-weight: bold;
                color: #555;
                transition: color 0.3s, transform 0.3s;
            }

            input[type="radio"]:checked + label {
                color: #4A90E2;
                transform: scale(1.1);
            }

            /* Table form */
            table {
                width: 100%;
                border-collapse: collapse;
            }

            td {
                padding: 10px 5px;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 10px 15px;
                border-radius: 10px;
                border: 1px solid #ccc;
                transition: all 0.4s ease;
                animation: slideInRight 0.8s ease forwards;
                opacity: 0;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                border-color: #4A90E2;
                box-shadow: 0 0 10px rgba(74,144,226,0.5);
                outline: none;
                transform: scale(1.02);
            }

            @keyframes slideInRight {
                to {opacity:1; transform: translateX(0);}
            }

            /* Buttons */
            input[type="submit"] {
                background: linear-gradient(135deg, #4A90E2, #357ABD);
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 12px;
                cursor: pointer;
                font-weight: bold;
                transition: all 0.4s ease;
                animation: fadeIn 1.2s ease forwards;
                opacity: 0;
            }

            input[type="submit"]:hover {
                transform: scale(1.1);
                box-shadow: 0 0 15px rgba(74,144,226,0.6);
                background: linear-gradient(135deg, #357ABD, #4A90E2);
            }

            input[type="submit"]:active {
                transform: scale(0.95);
            }

            /* Animations delay for inputs */
            table tr:nth-child(1) input {animation-delay: 0.5s;}
            table tr:nth-child(2) input {animation-delay: 0.7s;}
            table tr:nth-child(3) input {animation-delay: 0.9s;}
        </style>
    </head>
    <body>
        <c:set var="languageCode" value="${param.radLanguageCode}"/>
        <c:if test="${not empty languageCode}">
            <fmt:setLocale value="${languageCode}" scope="session"/>
        </c:if>
        <fmt:setBundle basename="resource" scope="session"/>

        <div class="form-container">
            <h2><fmt:message key="languageMessage"/></h2>

            <form method="POST">
                <div class="language-choice">
                    <input type="radio" id="vi" name="radLanguageCode" value="vi"
                           <c:if test="${languageCode == 'vi'}">checked</c:if> />
                    <label for="vi"><fmt:message key="vn"/></label>

                    <input type="radio" id="en" name="radLanguageCode" value="en"
                           <c:if test="${languageCode == 'en'}">checked</c:if> />
                    <label for="en"><fmt:message key="en"/></label>
                </div>

                <input type="submit" name="submit" value="<fmt:message key='chooseButton'/>"/>

                <table>
                    <tr>
                        <td><fmt:message key="userName"/></td>
                        <td><input type="text" name="txtUserName" value=""/></td>
                    </tr>
                    <tr>
                        <td><fmt:message key="pass"/></td>
                        <td><input type="password" name="txtPassword" value=""/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center; padding-top: 15px;">
                            <input type="submit" name="submit" value="<fmt:message key='login'/>"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
