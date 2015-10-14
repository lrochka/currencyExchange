<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<c:url var="clientUrl" value="/clients/${client.phone}.html" />

<spring:message var="saveLabel" code="editUser.label.save" />

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><spring:message code="editUser.pageTitle" /></title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
	</head>
	<body>
		
		<ul id="breadcrumbs">
			<li><a href="${homeUrl}">Главная</a></li>
			<li><a href="${clientsUrl}">Клиенты</a></li>
			<li><a href="${clientUrl}">${client.phone}</a></li>
		</ul>
		
		<h1 class="commentEdit">Изменение клиента: ${client.phone} </h1>
		
		<c:if test="${param.saved == true}">
			<div class="info alert">Клиент сохранен! <a href="${clientUrl}">Просмотр</a></div>
		</c:if>
		
		<form:form cssClass="main" modelAttribute="client" acceptCharset="UTF-8">
			<input type="hidden" name="_method" value="POST" />
			
			<div class="panel grid">
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Имя:</div>
					<div class="yui-u">
						<div><form:input path="name" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="name" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Компания:</div>
					<div class="yui-u">
						<div>
							<div>
							<form:select path="company" cssClass="medium" cssErrorClass="medium error">
								<c:forEach items="${companyList}" var="company">
								<form:option value="${company.id}">${company.code} ${company.name}</form:option>
								</c:forEach>
							</form:select> 
							</div>
							<div class="errorMessage"><form:errors path="company" htmlEscape="false" /></div>
						</div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Дополнительная информация:</div>
					<div class="yui-u">
						<form:textarea id="textArea" path="addContact" cssClass="resizable" cssErrorClass="resizable error" />
						<form:errors path="addContact">
							<div class="errorMessage"><form:errors path="addContact" htmlEscape="false" /></div>
						</form:errors>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						Дата создания:
					</div>
					<div class="yui-u">
						<span class="date icon"><fmt:formatDate type="both" value="${originalClient.dateCreated}" /></span>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first"></div>
					<div class="yui-u">
						<input type="submit" value="Подтвердить" var="prop"/>
					</div>
				</div>
			</div>
		</form:form>
	</body>
</html>
