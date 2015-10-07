<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Клиенты</title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
		<script type="text/javascript">
			$(function() { $("#clientList").tablesorter({ sortList: [ [0, 0] ], textExtraction: "complex" }); });
		</script>
		<script type="text/javascript">
		$(function() {
			var options = {
				valueNames: [ 'phone','name','company']
				};
			var userList = new List("list", options);
		});
		</script>
	</head>
	<body>
		<ul id="breadcrumbs">
			<li><a href="${homeUrl}">Главная</a></li>
		</ul>
		
		<h1>Клиенты</h1>
		
		
		
		<c:choose>
			<c:when test="${empty clientList}">
				<p>Нет клиентов.</p>
			</c:when>
			<c:otherwise>
			<div id="list">
			<input class="search" placeholder="Поиск" />
				<table id="clientList" class="sortable">
					<thead>
						<tr>
							<th class="string">Клиент</th>
							<th class="string">Имя</th>
							<th class="string">Компания</th>
						</tr>
					</thead>
					<tbody class="list">
						<c:forEach var="client" items="${clientList}">
							<c:url var="userUrl" value="/clients/${client.phone}.html" />
							<%-- Use timeStyle="short" so jquery.tablesorter can parse column as date --%>
							<fmt:formatDate var="date" type="both" timeStyle="short" value="${u.dateCreated}" />
							<tr>
								<td class="phone"><span class="clnArrow icon" style="white-space:nowrap"><a href="${userUrl}">${client.phone}</a></td>
								<td class="name" contenteditable> <c:out value="${client.name}" /></td>
								<td class="company"><c:out value="${client.company.code} ${client.company.name}" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</c:otherwise>
		</c:choose>
		<li class="clnPlus icon" path="" ><a href="${newClientUrl}" title="New client">Новый клиент</a></li>
	</body>
</html>
