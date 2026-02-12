<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Questions List</title>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
:root {
    --primary: #007BFF;      /* Deep blue */
    --secondary: #00C9A7;    /* Teal cyan */
    --accent: #1E90FF;       /* Electric blue */
}

body {
    background: linear-gradient(135deg, var(--primary), var(--secondary));
    font-family: 'Poppins', sans-serif;
    padding: 40px 0;
}

.container {
    background: #ffffff;
    border-radius: 20px;
    padding: 30px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
    animation: fadeIn 0.8s ease-in-out;
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
    font-size: 16px;
    text-align: center;
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

/* Responsive Scroll */
.table-responsive {
    border-radius: 15px;
    overflow-x: auto;
}
</style>
</head>

<body>
<div class="container">
    <h2> Questions List</h2>
    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th>TOPIC</th>
                    <th>QUESTION</th>
                    <th>OPTION A</th>
                    <th>OPTION B</th>
                    <th>OPTION C</th>
                    <th>OPTION D</th>
                    <th>CORRECT ANSWER</th>
                </tr>
            </thead>
            <tbody>
                <%
                try {
                    String ans = null;
                    Connection con = DBCon.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from questionslist");
                    while(rs.next()) {
                        if(rs.getString("correct_answer").equals("A")) {
                            ans = rs.getString("option_a");
                        } else if(rs.getString("correct_answer").equals("B")) {
                            ans = rs.getString("option_b");
                        } else if(rs.getString("correct_answer").equals("C")) {
                            ans = rs.getString("option_c");
                        } else if(rs.getString("correct_answer").equals("D")) {
                            ans = rs.getString("option_d");
                        }
                %>
                <tr>
                    <td><%=rs.getString("topic") %></td>
                    <td><%=rs.getString("question") %></td>
                    <td><%=rs.getString("option_a") %></td>
                    <td><%=rs.getString("option_b") %></td>
                    <td><%=rs.getString("option_c") %></td>
                    <td><%=rs.getString("option_d") %></td>
                    <td style="font-weight:600; color:var(--primary);"><%=ans %></td>
                </tr>
                <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.println(e);
                }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
