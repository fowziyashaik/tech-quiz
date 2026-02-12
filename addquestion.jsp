<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href="lib/bootstrap.min.css">
<script src="lib/jquery.min.js"></script>
<script src="lib/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-sm-4">
</div>
<div class="col-sm-4">
<form action="questions_action.jsp" method="post">
			<div class="row col-sm-4"> <label>Topic Name</label> </div>
			<div class="row col-sm-6">
				<select class="form-control" name="f1">
				<option>--Select--</option>
					<option value="Aptitude">Aptitude</option>
					<option value="Reasoning">Reasoning</option>
					<option value="Technical">Technical</option>
				</select>
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Question</label> </div>
			<div class="row col-sm-6">
				<input type="text" class="form-control" name="f2">
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Option A</label> </div>
			<div class="row col-sm-6">
				<input type="text" class="form-control"  name="f3">
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Option B</label> </div>
			<div class="row col-sm-6">
				<input type="text" class="form-control"  name="f4">
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Option C</label> </div>
			<div class="row col-sm-6">
				<input type="text" class="form-control"  name="f5">
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Option D</label> </div>
			<div class="row col-sm-6">
				<input type="text" class="form-control"  name="f6">
			</div>
			<br><br>
			<div class="row col-sm-4"> <label>Correct Option</label> </div>
			<div class="row col-sm-6">
				<input type="radio" value="A"  name="f7">A<input type="radio" value="B"  name="f7">B
				<input type="radio" value="C"  name="f7">C<input type="radio" value="D"  name="f7">D
			</div>
			<br><br>
			<div class="row col-sm-4"> <input type="submit" value="Submit" class="btn btn-success"> </div>
			<div class="row col-sm-4"> <input type="reset" value="Reset" class="btn btn-danger"> </div>
		</form>
</div>
<div class="col-sm-4">
</div>
</div>
</div>



</body>
</html>