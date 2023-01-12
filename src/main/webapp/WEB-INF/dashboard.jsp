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
		     <span class="fw-bold">Hey ${loginUser.userName}!</span> 
			</div>     
	    </div>
	    <div>
		    <a href="/add" class="btn btn-warning">Add Chore</a>
		    <a href="/logout" class="btn btn-warning">logout</a>  
	    </div>
	</nav>
	<form:form class="search-bar mx-auto" action="/searchMovie" method="post">
					<input type="search" class="search-field" id="movieName" name="movieName" placeholder="Movie Title"/>
					<button type="submit" class="mag-button"><img src="/img/search-dark.png" alt="mag-glass" class="mag-glass"></button>
					</form:form>
	<c:forEach items='${results}' var='movie'> 
	<div class="card">
	<h3>
		Title: ${movie.getString("Title")} 
	</h3>
	
	<h6>
		Year: ${movie.getString("Year")} 
	</h6>
	<img src="${movie.getString('Poster')}"/>
	
	</div>
	
	</c:forEach>
	
	
	<h4 class="text-center mt-2">Your Chores</h4> 
	<c:forEach var="chore" items="${allChores}">
	<div class="card mb-2">
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