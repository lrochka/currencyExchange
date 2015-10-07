<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="clientPath" value="/clients/${client.phone}" />
<c:url var="clientJsUrl" value="/scripts/client.js" />
<c:url var="clientUrl" value="/${clientPath}" />

<c:url var="editClientUrl" value="${clientPath}/edit.html" />

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><c:out value="${client.phone}" /></title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
	</head>
	<body>
	
		<ul id="breadcrumbs">
			<li><a href="${clientsUrl}">Клиенты</a></li>
		</ul>
		
		<c:if test="${param.saved == true}">
			<div class="info alert">Клиент сохранен!</div>
		</c:if>
		
		<h1>${client.phone}</h1>
		
		<div>
			<div class="pane grid">
				<div class="gridRow yui-gf">
					<div class="yui-u first">Имя:</div>
					<div class="yui-u">${client.name}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Компания:</div>
					<div class="yui-u">${client.company.code} ${client.company.name}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Телефон:</div>
					<div class="yui-u">
						<span class="mobilePhone icon">${client.phone}</span>
					</div>
				</div>
			</div>
			<div class="pane grid">
				<div class="gridRow yui-gf">
					<div class="yui-u first">Характеристика клиента:</div>
					<div class="yui-u">${client.clnStats.name}</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first">Источник данных о фирме:</div>
					<div class="yui-u">${client.clnSrc.name}</div>
				</div>
			</div>
			<div class="pane">
			<c:out value="${client.addContact}" escapeXml="false" />
			</div>
		</div>
		<li class="clnPencil icon"><a href="${editClientUrl}" title="Edit client's info">Изменить</a></li>
	</body>
</html>
