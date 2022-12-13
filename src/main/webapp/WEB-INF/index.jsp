<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<head>
<meta charset="UTF-8">
<title>FestiConnect</title>
<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:ital,wght@0,400;0,700;1,400&family=Open+Sans&family=Pathway+Gothic+One&family=Playfair+Display:wght@500&family=Righteous&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body class="container-fluid">
	<header>
		<h2 class="text-center mt-4 border-bottom">ChoreTracker</h2>
	</header>
	<div class="d-flex justify-content-evenly">
		<form:form class="p-4 p-lg-5 border rounded-3 bg-dark" action="/login" method="post" modelAttribute="loginUser">
	       	<div class="form-floating mb-3">
	          <form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="name@example.com"/>
	          <form:label for="floatingInput" path="email">Email address</form:label>
	        </div>
	        <div>
	        	<form:errors class="text-danger" path="email"/>
	        </div>
	        <div class="form-floating mb-3">
	          <form:password path="password" class="form-control" id="floatingPassword" placeholder="Password"/>
	          <form:label for="floatingPassword" path="password">Password</form:label>
	        </div>
	        <div>
	        	<form:errors class="text-danger" path="password"/>
	        </div>
	        <button class="w-100 btn btn-lg btn-warning" type="submit">Login</button>
        </form:form>   
		<form:form class="p-4 p-md-5 border rounded-3 bg-dark" action="/register" method="post" modelAttribute="user">
	          <div class="form-floating mb-3">
	            <form:input path="userName" class="form-control" id="floatingInput" placeholder="Username"/>
	            <form:label for="floatingInput" path="userName">Username</form:label>
	          </div>
	          <div>
	          	<form:errors class="text-danger" path="userName"/>
	          </div>
	          <div class="form-floating mb-3">
	            <form:input type="email" path="email" class="form-control" id="floatingInput" placeholder="Email Address"/>
	            <form:label for="floatingInput" path="email">Email address</form:label>
	          </div>
	          <div>
	          	<form:errors class="text-danger" path="email"/>
	          </div>
	          <div class="form-floating mb-3">
	            <form:password path="password" class="form-control" id="floatingPassword" placeholder="Password"/>
	            <form:label for="floatingPassword" path="password">Password</form:label>
	          </div>
	          <div>
	          	<form:errors class="text-danger" path="password"/>
	          </div>
	          <div class="form-floating mb-3">
	            <form:password path="confirm" class="form-control" id="floatingPassword" placeholder="Password"/>
	            <form:label for="floatingPassword" path="confirm"> Confirm Password</form:label>
	          </div>
	          <div>
	          	<form:errors class="text-danger" path="confirm"/>
	          </div>
	          <button class="w-100 btn btn-lg btn-warning" type="submit">Register & Login</button>
	 
	        </form:form>
		
	</div>
 				
		        
		        
		        
		        
		        
</body>