<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:url var="postLoginUrl" value="/j_spring_security_check" />

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Пожалуйста войдите</title>
	</head>
	<body>
		<h1>Пожалуйста войдите</h1>
		
		<form class="main" action="${postLoginUrl}" method="post" accept-charset="UTF-8">
			
			<c:if test="${param.failed == true}">
			<form:errors path="*">
				<div class="warning alert">
					Попытка войти не удалась. Пожалуйста, попробуйте еще раз или обратитесь к технической поддержке за помощью. 
					<spring:message code="error.global" />
				</div>
			</form:errors>
			</c:if>
			<div class="panel grid" style="width:420px">
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Логин:</div>
					<div class="yui-u"><input type="text" name="j_username" class="short" /></div>
				</div>
				<div class="gridRow yui-gf">
					<div class="fieldLabel yui-u first">Пароль:</div>
					<div class="yui-u"><input type="password" name="j_password" class="short" /></div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first"></div>
					<div class="yui-u"><input type="checkbox" name="_spring_security_remember_me" />Запомнить меня</div>
				</div>
				<div class="gridRow yui-gf">
					<div class="yui-u first"></div>
					<div class="yui-u"><input type="submit" value="Войти" /></div>
				</div>
			</div>
		</form>
		
	</body>
</html>
