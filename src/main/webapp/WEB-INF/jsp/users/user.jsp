<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="email" value="${account.email}" />
<c:set var="userPath" value="/users/${account.username}" />
<c:url var="userJsUrl" value="/scripts/user.js" />
<c:url var="userUrl" value="/${userPath}" />

<c:url var="editUserUrl" value="${userPath}/edit.html" />

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><c:out value="${account.fullName}" /></title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
	</head>
	<body>
	
		<ul id="breadcrumbs">
			<li><a href="${usersUrl}">Пользователи</a></li>
		</ul>
		
		<c:if test="${param.saved == true}">
			<div class="info alert">Пользователь сохранен!</div>
		</c:if>
		
		<h1><c:out value="${account.fullName}" /></h1>
		
		<div>
			<div class="pane grid">
				<div class="gridRow yui-gf">
					<div class="yui-u first">Логин:</div>
					<div class="yui-u">${account.username}</div>
				</div>
			</div>
			<div class="pane grid">
				<div class="gridRow yui-gf">
					<div class="yui-u first">Компания:</div>
					<div class="yui-u">${account.company.code} ${account.company.name}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Имя:</div>
					<div class="yui-u">${account.firstName}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Фамилия:</div>
					<div class="yui-u">${account.lastName}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">E-mail:</div>
					<div class="yui-u">
						<span class="email icon"><a href="mailto:${email}">${email}</a></span>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Телефон:</div>
					<div class="yui-u">
						<span class="mobilePhone icon">${account.phone}</span>
					</div>
				</div>
			</div>
			<div class="pane grid">
				<div class="gridRow yui-gf">
					<div class="yui-u first">Пользователь включен:</div>
					<div class="yui-u"><c:out value="${account.enabled}" /></div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Роли:</div>
					<div class="yui-u">
						<c:forEach var="role" items="${account.roles}">
							<c:out value="${role.name}" /><br />
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<li class="userEdit icon"><a href="${editUserUrl}" title="Edit user's info">Изменить</a></li>
	</body>
</html>
