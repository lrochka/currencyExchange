<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/jsp/urls.jspf" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url var="userUrl" value="/users/${account.username}.html" />

<spring:message var="saveLabel" code="editUser.label.save" />

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><spring:message code="editUser.pageTitle" /></title>
		<link rel="stylesheet" type="text/css" href="${forumsCssUrl}" />
	</head>
	<body>
		<ul id="breadcrumbs">
			<li><a href="${homeUrl}">Главная</a></li>
			<li><a href="${usersUrl}">Пользователи</a></li>
			<li><a href="${userUrl}">${account.username}</a></li>
		</ul>
		
		<h1 class="commentEdit">Изменение пользователя: ${account.username} </h1>
		
		<c:if test="${param.saved == true}">
			<div class="info alert">Пользователь сохранен! <a href="${userUrl}">Просмотр</a></div>
		</c:if>
		
		<form:form cssClass="main" modelAttribute="account" >
			<input type="hidden" name="_method" value="POST" />
			
			<div class="panel grid">
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.firstName')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:input path="firstName" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="firstName" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.lastName')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:input path="lastName" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="lastName" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.password')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:password path="password" showPassword="false" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="password" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.confirmPassword')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:password path="confirmPassword" showPassword="false" cssClass="medium" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.email')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:input path="email" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="email" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.phone')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div><form:input path="phone" cssClass="medium" cssErrorClass="medium error" /></div>
							<div class="errorMessage"><form:errors path="phone" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.company')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
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
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.role')}"> ${prop.propNameRU}</c:if>
						</c:forEach>
					</div>
					<div class="yui-u">
						<div>
						<form:select multiple="true" path="role" cssClass="medium" cssErrorClass="medium error" >
							<c:forEach items="${roleList}" var="roles">
			 				<form:option value="${roles.code}">${roles.code}</form:option>
							</c:forEach>
			 			</form:select>
						</div>
						<div class="errorMessage"><form:errors path="role" htmlEscape="false" /></div>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						Дата создания:
					</div>
					<div class="yui-u">
						<span class="date icon"><fmt:formatDate type="both" value="${originalAccount.dateCreated}" /></span>
					</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first"></div>
					<div class="yui-u">
						<input type="submit" value=<c:forEach items="${properties}" var="prop">
														<c:if test="${prop.propCode.equals('label.register')}"> ${prop.propNameRU}</c:if>
													</c:forEach> ></input>
					</div>
				</div>
			</div>
		</form:form>
	</body>
</html>
