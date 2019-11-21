<%@ page contentType="text/html; chatset=utf-8" %>
<%
	session.invalidate();
	response.sendRedirect("http://localhost:8080/Webcafe/Myhome.jsp");
%>