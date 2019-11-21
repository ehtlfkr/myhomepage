<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String productId = request.getParameter("id");

	PreparedStatement pstmt = null;
	String sql = "delete from post where postid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("/Webcafe/Myhome.jsp");
%>