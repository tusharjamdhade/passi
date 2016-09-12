<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%
int timeout = session.getMaxInactiveInterval();
String contextPath = request.getContextPath();
response.setHeader("Refresh", timeout + "; URL = " + contextPath + "/expired");
%>

<!DOCTYPE html>
<html>
<head>
<title>Passi&nbsp;&nbsp;&bull;&nbsp;&nbsp;Index</title>

<meta name="author" content="Mika Ropponen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- bootstrap libraries -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="text-align: center; font: normal 14px Consolas;">
	<h3>PASSI</h3>
	<p>Tervetuloa Työkykypassiin, <c:out value="${user}" />!</p>
	<p>Käyttöoikeutesi on <c:out value="${role == 'ROLE_ADMIN' ? 'ADMIN' : 'USER'}" /></p>
	
	<div>
	
		<div style="text-align: left; display: inline-block;">
		<form action="upload" method="POST" enctype="multipart/form-data"> <!-- ?${_csrf.parameterName}=${_csrf.token} -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="hidden" name="name" value="image.jpg" />
		<input type="file" name="file" style="display: inline;" /><br /><br />		
		<input type="submit" value="Tallenna" />
		</form>
		</div>
		
		<p>
		<img src="<c:url value='/download/external' />" style="height: 100px; width: 100px; margin: 15px;" />
        </p>
		
		<p>
		<c:if test="${not empty message}">
			<c:out value="${message}" />
		</c:if>
		</p>
		
	</div>
	
	<div>
		<c:url value="/logout" var="logoutUrl" />
		<form id="logout" action="${logoutUrl}" method="post" >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
		<a href="javascript:document.getElementById('logout').submit()">Kirjaudu ulos</a>
		</c:if>
	</div>
</div>
</body>
</html>