<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8">
    <title>JSP - Hello World</title>
    <style>
      body {
        margin: 0;
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #89f7fe, #66a6ff);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        text-align: center;
      }

      h1 {
        color: #fff;
        margin-bottom: 40px;
        animation: fadeIn 1.2s ease-in-out;
      }

      .btn-container {
        display: flex;
        gap: 20px;
      }

      .btn {
        background: linear-gradient(135deg, #667eea, #764ba2);
        border: none;
        border-radius: 12px;
        padding: 15px 30px;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      }

      .btn a {
        color: white;
        font-size: 16px;
        text-decoration: none;
        font-weight: bold;
        display: block;
      }

      .btn:hover {
        transform: scale(1.08);
        background: linear-gradient(135deg, #764ba2, #667eea);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      }

      @keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(-20px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }
    </style>
  </head>
  <body>
    <h1><%= "Bài tập: Nguyễn Tấn Nghị - 22685461" %>
    </h1>
    <div class="btn-container">
      <button class="btn"><a href="form.jsp">Bài 01</a></button>
      <button class="btn"><a href="register_account.jsp">Bài 02</a></button>
      <button class="btn"><a href="multilingual.jsp">Bài 03</a></button>
    </div>
  </body>
</html>
