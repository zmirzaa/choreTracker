<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Chore</title>
<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:ital,wght@0,400;0,700;1,400&family=Open+Sans&family=Pathway+Gothic+One&family=Playfair+Display:wght@500&family=Righteous&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<nav id="navbar" class="navbar navbar-light px-3 border-bottom">
	 	<div class="title">
		    <h1>ChoreTracker</h1>    
	    </div>
	    <div>
		    <a href="/dashboard" class="btn btn-warning">Back</a>
		    <a href="/logout" class="btn btn-warning">logout</a>  
	    </div>
	</nav>
		<div class="col-md-10 mx-auto col-lg-5">
	       			<form:form class="p-4 p-md-5 border rounded-3 bg-dark mt-4" action="/createChore" method="post" modelAttribute="chore">
	        		  	<form:input value="${loginUser.id}" path="choreCreator" type="hidden"/>
	        		  	  <div>
			          	<form:errors class="text-danger" path="choreTitle"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:input path="choreTitle" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="choreTitle">Chore</form:label>
			          </div>
			          <div>
			          	<form:errors class="text-danger" path="dueDate"/>
			          </div>
			          <div class="form-floating mb-3">
			            <form:input type="date" path="dueDate" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="dueDate">Due Date</form:label>
			          </div>
			          <div>
			          	<form:errors path="description" class="text-danger"/>
			          </div>
			         <div class="form-floating mb-3">
			            <form:input path="description" class="form-control" id="floatingInput"/>
			            <form:label for="floatingInput" path="description">Description</form:label>
			          </div>
			          <button class="w-100 btn btn-lg btn-warning" type="submit">Add</button>
			          </form:form>
			         </div>


</body>
</html>