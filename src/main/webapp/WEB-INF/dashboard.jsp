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
<title>ChoreTracker</title>
<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:ital,wght@0,400;0,700;1,400&family=Open+Sans&family=Pathway+Gothic+One&family=Playfair+Display:wght@500&family=Righteous&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="container">
	<nav id="navbar" class="navbar navbar-light px-3 border-bottom">
	 	<div class="title">
		    <h1>ChoreTracker</h1>  
		    <div class="d-flex align-items-center">
		     <span class="fw-bold">Hey ${loginUser.userName}! </span> 
		     	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-sunglasses" viewBox="0 0 16 16">
					<path d="M4.968 9.75a.5.5 0 1 0-.866.5A4.498 4.498 0 0 0 8 12.5a4.5 4.5 0 0 0 3.898-2.25.5.5 0 1 0-.866-.5A3.498 3.498 0 0 1 8 11.5a3.498 3.498 0 0 1-3.032-1.75zM7 5.116V5a1 1 0 0 0-1-1H3.28a1 1 0 0 0-.97 1.243l.311 1.242A2 2 0 0 0 4.561 8H5a2 2 0 0 0 1.994-1.839A2.99 2.99 0 0 1 8 6c.393 0 .74.064 1.006.161A2 2 0 0 0 11 8h.438a2 2 0 0 0 1.94-1.515l.311-1.242A1 1 0 0 0 12.72 4H10a1 1 0 0 0-1 1v.116A4.22 4.22 0 0 0 8 5c-.35 0-.69.04-1 .116z"/>
					<path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-1 0A7 7 0 1 0 1 8a7 7 0 0 0 14 0z"/>
				</svg>
			</div>     
	    </div>
	     <a href="/add" class="btn btn-warning">Add Chore</a>
	     <a href="/logout" class="btn btn-warning">logout</a>  
	</nav>
	<h4 class="text-center mt-2">Your Chores</h4> 
	<c:forEach var="chore" items="${allChores}">
	<div class="card">
		<div class="card-body">
			<div class="d-flex justify-content-between border-bottom">
				<div>
					<h5 class="fw-bold">${chore.choreTitle}</h5>
					<p class="mb-0"><fmt:formatDate pattern="MM/dd" value = "${chore.dueDate}"/></p>
				</div>
				<form:form action="/delete/${chore.id}" method="delete">
					<button class="btn btn-danger mb-2">I did it</button>
				</form:form>
			</div>
			<p class="mb-0 mt-2 text-muted">${chore.description}</p>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>