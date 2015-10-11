<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="baseGoogleUrl" value="http://ajax.googleapis.com/ajax/libs" />

<c:url var="jqueryTablesorterJsUrl" value="/skin/scripts/jquery.tablesorter.min.js" />

<c:url var="faceCssUrl" value="/skin/facebook.css" />
<c:url var="sipCssUrl" value="/skin/sip.css" />
<c:url var="listCssUrl" value="/skin/list.my.css" />
<c:url var="newCssUrl" value="/skin/20151004.css" />
<c:url var="sipJsUrl" value="/skin/scripts/sip.js" />
<c:url var="listJsUrl" value="/skin/scripts/list.min.js" />
<!--<c:url var="sipCoverImgUrl" value ="/skin/images/sip-cover.png" />-->

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><decorator:title /> - Обмен валют</title>
		<link rel="stylesheet" type="text/css" href="${baseGoogleUrl}/yui/2.9.0/build/reset-fonts-grids/reset-fonts-grids.css" />
		<link rel="stylesheet" type="text/css" href="${baseGoogleUrl}/yui/2.9.0/build/base/base.css" />
		<link rel="stylesheet" type="text/css" href="${baseGoogleUrl}/jqueryui/1.8.14/themes/vader/jquery-ui.css" />
		<link rel="stylesheet" type="text/css" href="${faceCssUrl}" />
		<link rel="stylesheet" type="text/css" href="${sipCssUrl}" />
		<link rel="stylesheet" type="text/css" href="${listCssUrl}" />
		<!--link rel="stylesheet" type="text/css" href="${newCssUrl}" /-->
		<script type="text/javascript" src="${baseGoogleUrl}/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="${baseGoogleUrl}/jqueryui/1.8.14/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${jqueryTablesorterJsUrl}"></script>
		<script type="text/javascript" src="${sipJsUrl}"></script>
		<script type="text/javascript" src="${listJsUrl}"></script>
		<decorator:head />
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("name");
            if (name == null || name.length() == 0) {
                name = "World";
            }
        %>
        
		<div id="doc3">
			<div id="outerHdSubhd">
				<div id="innerHdSubhd">
					<div id="hd">
						<div id="hdAppName">Обмен валют</div>
					</div>
					<%@ include file="/WEB-INF/jsp/skin/subhead.jspf" %>
				</div>
			</div>
			<div id="mainContainer" class="hasLeftCol">
				<div id = "leftCol">
				<div class="homeSideNav">
					<ul>
						<security:authorize url="${servletPath}/clients.html" method="GET">
							<li ><a href="/clients.html"><span class="cln icon">Клиенты</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${usersUrl}"><span class="user icon">Пользователи</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${homeUrl}"><span class="currency icon">Валюты</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${homeUrl}"><span class="handShake icon" style="white-space:nowrap">Сделки</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${homeUrl}"><span class="moneyCoin icon" style="white-space:nowrap">Касса</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${homeUrl}"><span class="moneyBag icon" style="white-space:nowrap">Остатки</a></li>
						</security:authorize>
						<security:authorize url="${servletPath}/${usersUrl}" method="GET">
							<li ><a href="${homeUrl}"><span class="moneyPlus icon" style="white-space:nowrap">Перекрытие сделок</a></li>
						</security:authorize>
					</ul>
				</div>
				</div>
				<div id ="contentCol">
					Hello, <%= name %>! <br>
					<div id = "system-main" class="regionInner">
						<decorator:body />
					</div>
				</div>
			</div>
			<div id="ft">
				<div class="regionInner">
					<div id="legal">
						Copyright &copy; 2015
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
