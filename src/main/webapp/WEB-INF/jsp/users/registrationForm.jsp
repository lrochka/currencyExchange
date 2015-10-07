<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>								
			<c:forEach items="${properties}" var="prop">
				<c:if test="${prop.propCode.equals('pageTitle')}"> ${prop.propNameRU}</c:if>
			</c:forEach>
		</title>
	</head>
	<body>
		<h1><c:forEach items="${properties}" var="prop">
				<c:if test="${prop.propCode.equals('pageTitle')}"> ${prop.propNameRU}</c:if>
			</c:forEach>
		</h1>
		
		<form:form cssClass="main" modelAttribute="account" metod = "${method}">
			<p><c:forEach items="${properties}" var="prop">
				<c:if test="${prop.propCode.equals('message.allFieldsRequired')}"> ${prop.propNameRU}</c:if>
			</c:forEach></p>
			
			<div class="panel grid">
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">
						<c:forEach items="${properties}" var="prop">
							<c:if test="${prop.propCode.equals('label.username')}"> ${prop.propNameRU}</c:if>
						</c:forEach></div>
					<div class="yui-u">
						<div><form:input path="username" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="username" htmlEscape="false" /></div>
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
