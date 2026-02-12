<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Details</title>

<!-- Bootstrap 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
:root {
    --primary: #007BFF;
    --secondary: #00C9A7;
    --accent: #1E90FF;
}

body {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    font-family: 'Poppins', sans-serif;
    padding: 50px 0;
}

.container {
    background: #ffffff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
    animation: fadeIn 0.8s ease-in-out;
    max-width: 950px;
}

h2 {
    text-align: center;
    color: var(--primary);
    font-weight: 700;
    margin-bottom: 25px;
    letter-spacing: 1px;
}

.table {
    border-radius: 10px;
    overflow: hidden;
    background: #fff;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
}

.table thead tr {
    background: linear-gradient(90deg, var(--primary), var(--accent));
    color: #fff;
    text-align: center;
    font-size: 16px;
}

.table tbody tr {
    text-align: center;
    transition: all 0.3s ease;
}

.table tbody tr:hover {
    background-color: #f0f8ff;
    transform: scale(1.01);
}

.table th, .table td {
    padding: 12px 10px;
    vertical-align: middle !important;
}

.table-bordered > tbody > tr > td, 
.table-bordered > thead > tr > th {
    border: 1px solid #dee2e6;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(40px); }
    to { opacity: 1; transform: translateY(0); }
}

.table-responsive {
    border-radius: 15px;
    overflow-x: auto;
}

/* Mobile Optimization */
@media (max-width: 767px) {
    h2 {
        font-size: 20px;
    }
    .container {
        padding: 20px;
    }
    .table th, .table td {
        font-size: 13px;
        padding: 10px 6px;
    }
}
</style>
</head>

<body>
<div class="container">
    <h2>User Details</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>NAME</th>
                    <th>QUALIFICATION</th>
                    <th>EMAIL</th>
                    <th>MOBILE</th>
                    <th>SKILLS</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    String id = session.getAttribute("id").toString();
                    Connection con = DBCon.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM user WHERE id='" + id + "'");
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String qualification = rs.getString("qualification");
                        String email = rs.getString("email");
                        String mobile = rs.getString("mobile");
                        String skills = rs.getString("skills");
                %>
                <tr>
                    <td><%= name %></td>
                    <td><%= qualification %></td>
                    <td><%= email %></td>
                    <td><%= mobile %></td>
                    <td><%= skills %></td>
                </tr>
                <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='5' class='text-danger'>Error: " + e + "</td></tr>");
                }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
