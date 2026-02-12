<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>User Change Password</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&display=swap" rel="stylesheet">

  <style>
    body {
      background: linear-gradient(135deg, #007BFF, #00C9A7);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Poppins', sans-serif;
      color: #03396C;
    }

    .card {
      width: 450px;
      border: none;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 123, 255, 0.3);
      animation: fadeIn 0.6s ease-in-out;
    }

    .card-header {
      background: linear-gradient(135deg, #00C9A7, #007BFF);
      color: white;
      font-size: 1.3rem;
      font-weight: 600;
      text-align: center;
      border-top-left-radius: 20px;
      border-top-right-radius: 20px;
      padding: 15px;
      letter-spacing: 0.5px;
    }

    .form-control {
      border-radius: 12px;
      height: 45px;
      border: 1px solid #cfd9df;
      box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
    }

    .form-control:focus {
      border-color: #007BFF;
      box-shadow: 0 0 8px rgba(0,123,255,0.3);
    }

    label {
      font-weight: 500;
      color: #333;
      margin-bottom: 5px;
    }

    .btn-primary {
      background: linear-gradient(135deg, #007BFF, #00C9A7);
      border: none;
      border-radius: 25px;
      padding: 10px 30px;
      font-weight: 600;
      letter-spacing: 0.5px;
      transition: all 0.3s ease;
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      background: linear-gradient(135deg, #0062cc, #00b092);
      box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
    }

    .btn-secondary {
      border-radius: 25px;
      padding: 10px 25px;
      font-weight: 600;
      background-color: #6c757d;
      border: none;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>

<body>
<%
  String name = session.getAttribute("Ne").toString();
%>

  <div class="card">
    <div class="card-header">
      <i class="fa fa-lock me-2"></i>USER CHANGE PASSWORD
    </div>

    <div class="card-body p-4">
      <form action="changepswrd_action.jsp" method="post" target="_parent">

        <div class="mb-3">
          <label>User Name</label>
          <input type="text" name="sname" value="<%= name %>" class="form-control" readonly required>
        </div>

        <div class="mb-3">
          <label>New Password</label>
          <input type="password" placeholder="Enter new password" name="npwd" class="form-control" required>
        </div>

        <div class="d-flex justify-content-center gap-3 mt-4">
          <input type="submit" class="btn btn-primary" value="Submit">
          <input type="reset" class="btn btn-secondary" value="Cancel">
        </div>

      </form>
    </div>
  </div>

</body>
</html>
