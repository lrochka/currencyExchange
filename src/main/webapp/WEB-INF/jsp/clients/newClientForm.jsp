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
			Новый клиент
		</title>
	</head>
	<body>
		<h1>Добавление нового клиента</h1>
		
		<form:form cssClass="main" modelAttribute="client" metod = "${method}">
			<p>Все поля обязательны для заполнения</p>
			
			<div class="panel grid">
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Телефон:</div>
					<div class="yui-u">
						<div><form:input path="phone" cssClass="medium" cssErrorClass="medium error" /></div>
						<div class="errorMessage"><form:errors path="phone" htmlEscape="false" /></div>
					</div>
				</div>
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
					<div class="yui-u first"></div>
					<div class="yui-u"><input type="submit" value="Подтвердить"></input></div>
				</div>
			</div>
		</form:form>
	</body>
</html>
