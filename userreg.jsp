<%@page import="Action.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>User Registration | Quiz Application</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@500;700&family=Inter:wght@400;500&display=swap" rel="stylesheet">

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">

<style>
:root {
  --primary: #007BFF;
  --secondary: #00C9A7;
}

body {
  font-family: 'Inter', sans-serif;
  background: #ffffff;
  color: #03396C;
  margin: 0;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem 1rem;
}

/* Registration Card */
.card {
  border-radius: 15px;
  border: 1px solid rgba(0,123,255,0.2);
  box-shadow: 0 4px 20px rgba(0,123,255,0.1);
  padding: 2rem;
  width: 100%;
  max-width: 600px;
  transition: all 0.3s ease;
}
.card:hover {
  box-shadow: 0 6px 25px rgba(0,123,255,0.25);
}

.card h5 {
  text-align: center;
  font-family: 'Poppins', sans-serif;
  font-weight: 700;
  color: var(--primary);
  margin-bottom: 1.5rem;
}

/* Form Controls */
.form-label {
  font-weight: 600;
  color: #03396C;
}
.form-control, select {
  border-radius: 8px;
  border: 1px solid rgba(0,123,255,0.25);
  background: rgba(0,123,255,0.03);
  color: #03396C;
}
.form-control:focus, select:focus {
  box-shadow: 0 0 10px rgba(0,123,255,0.25);
  border-color: var(--secondary);
}

input[type="radio"], input[type="checkbox"] {
  accent-color: var(--primary);
  margin-right: 5px;
}

.btn-primary {
  background: linear-gradient(135deg, var(--primary), var(--secondary));
  border: none;
  border-radius: 30px;
  width: 100%;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 0 10px rgba(0,123,255,0.3);
}
.btn-primary:hover {
  box-shadow: 0 0 20px rgba(0,123,255,0.6);
  transform: translateY(-2px);
}

.btn-danger {
  border-radius: 30px;
  font-weight: 600;
  width: 100%;
}

/* Responsive Adjustments */
@media (max-width: 768px) {
  .card {
    padding: 1.5rem;
  }
  .btn-primary, .btn-danger {
    font-size: 0.95rem;
  }
}

@media (max-width: 480px) {
  .card h5 {
    font-size: 1.3rem;
  }
  .btn-primary, .btn-danger {
    font-size: 0.9rem;
  }
}
</style>

<script type="text/javascript">
function studentvalidate() {
  const form = document.form1;
  if(form.f1.value=="" || form.f4.value=="" || form.f5.value=="" || form.f7.value=="") {
      alert("All fields must be entered");
      return false;
  } else if(form.f7.value.length < 6) {
      alert("Password must contain at least 6 characters");
      return false;
  }
  return true;
}
</script>
</head>

<body>

<div class="card">
  <h5><i class="fa-solid fa-user-plus me-2"></i>USER REGISTRATION</h5>
  
  <form name="form1" action="registration_action.jsp" method="post" onsubmit="return studentvalidate()">
    
    <div class="mb-3">
      <label class="form-label">Name</label>
      <input type="text" name="f1" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Qualification</label>
      <select name="f2" class="form-control" required>
        <option value="b.tech">B.Tech</option>
        <option value="mca">MCA</option>
        <option value="mba">MBA</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Gender</label><br>
      <div class="form-check form-check-inline">
        <input type="radio" name="f3" value="male" checked class="form-check-input">
        <label class="form-check-label">Male</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="radio" name="f3" value="female" class="form-check-input">
        <label class="form-check-label">Female</label>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="f4" class="form-control" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Mobile</label>
      <input type="text" name="f5" class="form-control" required pattern="[0-9]{10}" placeholder="Enter 10-digit mobile number">
    </div>

    <div class="mb-3">
      <label class="form-label">Skills</label><br>
      <div class="form-check form-check-inline">
        <input type="checkbox" name="f6" value="Aptitude" class="form-check-input">
        <label class="form-check-label">Aptitude</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="checkbox" name="f6" value="Verbal" class="form-check-input">
        <label class="form-check-label">Verbal</label>
      </div>
      <div class="form-check form-check-inline">
        <input type="checkbox" name="f6" value="Programming" class="form-check-input">
        <label class="form-check-label">Programming</label>
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="f7" class="form-control" required>
    </div>

    <div class="row g-3">
      <div class="col-md-6 col-12">
        <input type="submit" value="Register" class="btn btn-primary">
      </div>
      <div class="col-md-6 col-12">
        <input type="reset" value="Cancel" class="btn btn-danger">
      </div>
    </div>

  </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
