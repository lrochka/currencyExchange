<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Пользователи</title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
		<script type="text/javascript">
			$(function() { $("#userList").tablesorter({ sortList: [ [0, 0] ], textExtraction: "complex" }); });
		</script>
		<script type="text/javascript">
		$(function() {
			var options = {
				valueNames: [ 'username','company','firstName','lastName', 'phone']
				};
			var userList = new List("list", options);
		});
		</script>
	</head>
	<body>
		<ul id="breadcrumbs">
			<li><a href="${homeUrl}">Главная</a></li>
		</ul>
		
		<h1>Пользователи</h1>
		
		<c:choose>
			<c:when test="${empty userList}">
				<p>Нет пользователей.</p>
			</c:when>
			<c:otherwise>
			<div id="list">
			<input class="search" placeholder="Поиск" />
				<table id="userList" class="sortable">
					<thead>
						<tr>
							<th class="string">Пользователь</th>
							<th class="string">Компания</th>
							<th class="string">Имя</th>
							<th class="string">Фамилия</th>
							<th class="string">Контактный телефон</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach var="user" items="${userList}">
							<c:url var="userUrl" value="/users/${user.username}.html" />
							<%-- Use timeStyle="short" so jquery.tablesorter can parse column as date --%>
							<fmt:formatDate var="date" type="both" timeStyle="short" value="${u.dateCreated}" />
							<tr>
								<td class="username"><span class="user icon" style="white-space:nowrap"><a href="${userUrl}"><c:out value="${user.username}" /></a></td>
								<td class="company"><c:out value="${user.company.code} ${user.company.name}" /></td>
								<td class="firstName"><c:out value="${user.firstName}" /></td>
								<td class="lastName"><c:out value="${user.lastName}" /></td>
								<td class="phone"><c:out value="${user.phone}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</c:otherwise>
		</c:choose>
		
		<li class="userAdd icon" path="" ><a href="${newUserUrl}" title="New user">New user</a></li>
	</body>
</html>
