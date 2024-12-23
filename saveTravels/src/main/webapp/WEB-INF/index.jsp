<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Save Travels</title>
		<link rel="stylesheet" href="/css/style.css" />
	</head>
	<body>
		<h1>Save Travels</h1>
		<table id="expenseDisplay">
			<thead>
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td><a href="/expenses/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
						<td><c:out value="${expense.vendorName}"></c:out></td>
						<td><c:out value="$ ${expense.amount}"></c:out></td>
						<td class="actions"><a href="/expenses/${expense.id}/edit">Edit</a>
							<form:form class="buttonForm" action="/expenses/${expense.id}" method="delete">
								<button class="deleteButton">Delete</button>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<h2>Add an Expense:</h2>
		<form:form action="/expenses" method="post" modelAttribute="expense">
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