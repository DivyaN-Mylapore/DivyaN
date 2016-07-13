<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a category</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap-3.3.6-dist/css/bootstrap.min.css'/>"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="<c:url value='/resources/bootstrap-3.3.6-dist/css/bootstrap-theme.min.css'/>"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">

<script
	src="<c:url value='resources\bootstrap-3.3.6-dist\js\bootstrap.min.js'/>"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<link href="<c:url value='resources/css/style.css'/>" rel="stylesheet"
	type="text/css" media="all" />
<link href="<c:url value='resources/css/ie6.css' />" rel="stylesheet"
	type="text/css" media="all" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.23/angular.min.js"></script>

	<script type="text/javascript">
var myapp=angular.module("myapp",[])
var v=${li};
myapp.controller('categoryController',function($scope)
		{
	$scope.listCategory=v;
		});
</script>
<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-4eph:ACTIVE {
	background-color: #f9f9f9;
}
</style>

</head>

<body>
	<h1>Add a Category</h1>
	<c:url var="addAction" value="/category/add"></c:url>
	<form:form action="${addAction}" commandName="category">
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty category.id}">
						<td><form:input path="id" disabled="true" readonly="true" /></td>
					</c:when>
					<c:otherwise>
						<td><form:input path="id" pattern=".{6,7}" required="true"
								title="Id should contains 6 to 7 chararcters" /></td>
					</c:otherwise>
				</c:choose>
			<tr>
				<form:input path="id" hidden="true" />
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
			<tr>
				<td><form:label path="description">
						<spring:message text="Description" />
					</form:label></td>
				<td><form:input path="description" required="true" /></td>
			</tr>
			<tr>
				<td colspan="2"><c:if test="${!empty category.name}">
						<input type="submit"
							value="<spring:message text="Edit Category"/>" />
						</c:if> <c:if test="${empty category.name}">
					
						<input type="submit" value="<spring:message text="Add Category"/>" />
						</c:if>
					</td>
			</tr>
		</table>
	</form:form>
	<br>
	<div ng-app="myapp" ng-controller="categoryController">
	<h3>Category List</h3>
	<%-- <c:if test="${!empty categoryList}">--%>
		<table class="tg">
			<tr>
				<th>Category ID</th>
				<th>Category Name</th>
				<th>Category Description</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			<%--<c:forEach items="${categoryList}" var="category">--%>
				<tr ng-repeat="c in listCategory">
					<td>{{c.id}}</td>
					<td>{{c.name}}</td>
					<td>{{c.description}}</td>
					<td><a href="category/edit/{{c.id}}" ng-click="" >Edit</a></td>
					<td><a href="category/remove/{{c.id}}" ng-click="">Delete</a></td>
				</tr>
			<%--</c:forEach>--%>
		</table>/
		<%-- </c:if>--%>
		</div>
</body>

</html>