<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Expense</title>
		<link rel="stylesheet" href="/css/style.css" />
	</head>
	<body>
		<div class="flex">
			<h1 id="edit">Edit Expense</h1>
			<a href="/expenses">Go Back</a>
		</div>
		<form:form action="/expenses/${expense.id}" method="put" modelAttribute="expense">
			<div class="entries">
				<span class="error"><form:errors path="expenseName" /></span>
				<div class="row">
					<form:label path="expenseName">Expense Name</form:label>
					<form:input path="expenseName" />
				</div>
			</div>
			<div class="entries">
				<span class="error"><form:errors path="vendorName" /></span>
				<div class="row">
					<form:label path="vendorName">Vendor Name</form:label>
					<form:input path="vendorName" />
				</div>
			</div>
			<div class="entries">
				<span class="error"><form:errors path="amount" /></span>
				<div class="row">
					<form:label path="amount">Amount</form:label>
					<form:input path="amount" />
				</div>
			</div>
			<div class="entries">
				<span class="error"><form:errors path="description" /></span>
				<div class="row">
					<form:label path="description">Description</form:label>
					<form:input path="description" />
				</div>
			</div>
			<button type="submit">Submit</button>
		</form:form>
	</body>
</html>