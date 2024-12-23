<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Expense Details</title>
		<link rel="stylesheet" href="/css/style.css" />
	</head>
	<body>
		<div class="flex">
			<h1 id="edit">Expense Details</h1>
			<a href="/expenses">Go Back</a>
		</div>
		<div>
			<div class="description">
				<p class="category">Expense Name: </p>
				<p><c:out value="${expense.expenseName}"></c:out></p>
			</div>
			<div class="description">
				<p class="category">Expense Description: </p>
				<p><c:out value="${expense.description}"></c:out></p>
			</div>
			<div class="description">
				<p class="category">Vendor: </p>
				<p><c:out value="${expense.vendorName}"></c:out></p>
			</div>
			<div class="description">
				<p class="category">Amount Spent: </p>
				<p>$<c:out value="${expense.amount}"></c:out></p>
			</div>
		</div>
	</body>
</html>