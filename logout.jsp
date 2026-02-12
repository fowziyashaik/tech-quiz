<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    // Invalidate the session
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>

<!-- Google Fonts for nicer text -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Roboto', sans-serif;
        background-color: #ffffff; /* White background */
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #333333;
        overflow: hidden;
        text-align: center;
    }

    .thankyou-box {
        background: #f1f1f1; /* Light grey box for contrast */
        padding: 50px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        animation: fadeIn 1.5s ease-in-out;
    }

    h1 {
        font-size: 48px;
        margin-bottom: 20px;
        color: #007bff; /* Blue heading */
        animation: slideDown 1s ease-out;
    }

    p {
        font-size: 20px;
        margin-bottom: 10px;
        animation: slideUp 1s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.8);}
        to { opacity: 1; transform: scale(1);}
    }

    @keyframes slideDown {
        from { transform: translateY(-50px); opacity: 0;}
        to { transform: translateY(0); opacity: 1;}
    }

    @keyframes slideUp {
        from { transform: translateY(50px); opacity: 0;}
        to { transform: translateY(0); opacity: 1;}
    }

</style>

<!-- Redirect after 3 seconds -->
<meta http-equiv="refresh" content="3;url=index.html">

</head>
<body>
    <div class="thankyou-box">
        <h1>Thank You!</h1>
        <p>You have successfully logged out.</p>
        <p>Redirecting to home page...</p>
    </div>
</body>
</html>
