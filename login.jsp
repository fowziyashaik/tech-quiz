<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style>
/* ====== Base Styling ====== */
body {
  font-family: 'Segoe UI', Arial, Helvetica, sans-serif;
  background: linear-gradient(135deg, #007BFF, #00C9A7);
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  color: #03396C;
  margin: 0;
}

/* ====== Form Container ====== */
form {
  background: #ffffff;
  border-radius: 20px;
  box-shadow: 0 0 25px rgba(0,123,255,0.3);
  padding: 2rem 2.5rem;
  width: 90%;
  max-width: 480px;
  text-align: center;
  transition: all 0.3s ease;
}
form:hover {
  box-shadow: 0 0 35px rgba(0,123,255,0.5);
  transform: translateY(-5px);
}

/* ====== Title ====== */
h2 {
  font-weight: 700;
  color: #007BFF;
  margin-bottom: 1.5rem;
  font-size: 1.8rem;
  letter-spacing: 0.5px;
}

/* ====== Input Containers ====== */
.input-container {
  display: flex;
  align-items: center;
  width: 100%;
  margin-bottom: 15px;
  border-radius: 30px;
  background: rgba(0,123,255,0.06);
  border: 1px solid rgba(0,123,255,0.25);
  transition: all 0.3s ease;
}
.input-container:hover {
  box-shadow: 0 0 10px rgba(0,123,255,0.3);
  border-color: #00C9A7;
}

.icon {
  padding: 10px 15px;
  color: #007BFF;
  font-size: 1.2rem;
}

.input-field {
  width: 100%;
  padding: 12px;
  border: none;
  outline: none;
  border-radius: 30px;
  background: transparent;
  font-size: 1rem;
  color: #03396C;
}
select.input-field {
  appearance: none;
  cursor: pointer;
}

/* ====== Button ====== */
.btn {
  background: linear-gradient(135deg, #007BFF, #00C9A7);
  color: #fff;
  padding: 12px 20px;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  width: 100%;
  font-size: 1rem;
  font-weight: 600;
  box-shadow: 0 0 15px rgba(0,123,255,0.4);
  transition: all 0.3s ease;
}
.btn:hover {
  box-shadow: 0 0 25px rgba(0,123,255,0.8);
  transform: translateY(-2px);
}
</style>
</head>

<body>
  <form action="login_action.jsp" method="post" target="_parent">
    <h2><i class="fa-solid fa-right-to-bracket me-2"></i>Login Form</h2>
    
    <div class="input-container">
      <i class="fa fa-user icon"></i>
      <select class="input-field" name="usertype" required>
        <option value="select">--- Select ---</option>
        <option value="admin">Admin</option>
        <option value="user">User</option>
      </select>
    </div>

    <div class="input-container">
      <i class="fa fa-envelope icon"></i>
      <input class="input-field" type="text" placeholder="Username" name="name" required>
    </div>

    <div class="input-container">
      <i class="fa fa-key icon"></i>
      <input class="input-field" type="password" placeholder="Password" name="pswrd" required>
    </div>

    <button type="submit" class="btn">
      <i class="fa-solid fa-circle-arrow-right me-1"></i> Login
    </button>
  </form>
</body>
</html>
