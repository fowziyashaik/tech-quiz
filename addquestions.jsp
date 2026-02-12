<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Upload Questions</title>

<!-- Bootstrap CSS -->
<link href="lib/bootstrap.min.css" rel="stylesheet">
<script src="lib/jquery.min.js"></script>
<script src="lib/bootstrap.min.js"></script>

<style>
    :root {
        --primary: #007BFF;
        --secondary: #00C9A7;
        --accent: #1E90FF;
    }

    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, var(--primary), var(--secondary));
    }

    .form-card {
        background: #ffffff;
        border-radius: 20px;
        padding: 35px 35px;
        width: 90%;
        max-width: 360px;
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
        animation: fadeIn 0.8s ease-in-out;
    }

    h3 {
        text-align: center;
        font-weight: 700;
        margin-bottom: 25px;
        color: var(--primary);
    }

    .form-group {
        position: relative;
        margin-bottom: 25px;
    }

    label {
        font-weight: 600;
        color: #444;
        display: block;
        margin-bottom: 8px;
    }

    /* Stylish Select Box */
    .form-select {
        border: 2px solid #e0e0e0;
        border-radius: 12px;
        height: 45px;
        padding-left: 15px;
        background: #fff;
        font-weight: 500;
        transition: all 0.4s ease;
    }

    .form-select:hover {
        border-color: var(--secondary);
        box-shadow: 0 0 8px rgba(0, 201, 167, 0.3);
    }

    .form-select:focus {
        border-color: var(--accent);
        box-shadow: 0 0 12px rgba(30, 144, 255, 0.5);
    }

    /* Custom File Upload */
    .file-upload {
        position: relative;
        border: 2px dashed var(--primary);
        border-radius: 12px;
        text-align: center;
        padding: 25px;
        cursor: pointer;
        transition: all 0.3s ease;
        background: linear-gradient(180deg, #f9f9f9, #ffffff);
    }

    .file-upload:hover {
        border-color: var(--secondary);
        background: linear-gradient(180deg, #f0faff, #ffffff);
        box-shadow: 0 0 12px rgba(0, 123, 255, 0.3);
    }

    .file-upload i {
        font-size: 35px;
        color: var(--primary);
        margin-bottom: 8px;
    }

    .file-upload span {
        display: block;
        color: #666;
        font-size: 14px;
        font-weight: 500;
    }

    .file-upload input[type="file"] {
        position: absolute;
        width: 100%;
        height: 100%;
        opacity: 0;
        top: 0;
        left: 0;
        cursor: pointer;
    }

    /* Buttons */
    .btn {
        font-weight: 600;
        border-radius: 10px;
        padding: 10px 20px;
        transition: all 0.3s ease;
    }

    .btn-success {
        background: linear-gradient(90deg, var(--primary), var(--accent));
        border: none;
        color: #fff;
    }

    .btn-success:hover {
        background: linear-gradient(90deg, var(--accent), var(--secondary));
        box-shadow: 0 0 12px rgba(0, 123, 255, 0.6);
        transform: scale(1.05);
    }

    .btn-danger {
        background: linear-gradient(90deg, #dc3545, #ff5c75);
        border: none;
        color: #fff;
    }

    .btn-danger:hover {
        box-shadow: 0 0 12px rgba(220, 53, 69, 0.6);
        transform: scale(1.05);
    }

    .btn-row {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-top: 25px;
    }

    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 576px) {
        .form-card {
            padding: 25px 20px;
        }

        .btn-row {
            flex-direction: column;
        }

        .btn-row .btn {
            width: 100%;
        }
    }
</style>
</head>

<body>
    <div class="form-card">
        <h3>Upload Question File</h3>
        <form action="questionsaction.jsp" method="post" enctype="multipart/form-data">

            <!-- Select Field -->
            <div class="form-group">
                <label for="topic">Topic Name</label>
                <select id="topic" class="form-select" name="f1" required>
                    <option selected disabled>--Select Topic--</option>
                    <option value="Aptitude">Aptitude</option>
                    <option value="Reasoning">Reasoning</option>
                    <option value="Technical">Technical</option>
                </select>
            </div>

            <!-- File Upload -->
            <div class="form-group">
                <label for="file">Upload File</label>
                <div class="file-upload">
                    <i class="bi bi-cloud-arrow-up"></i>
                    <span>Click or Drag File to Upload</span>
                    <input type="file" id="file" name="f2" required>
                </div>
            </div>

            <div class="btn-row">
                <input type="submit" value="Submit" class="btn btn-success">
                <input type="reset" value="Reset" class="btn btn-danger">
            </div>

        </form>
    </div>

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>
