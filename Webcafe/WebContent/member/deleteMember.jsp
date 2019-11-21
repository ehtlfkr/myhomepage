<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<%
	String id = request.getParameter("id");

	PreparedStatement pstmt = null;
	String sql = "delete from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	
	sql = "delete from post where userid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	
	sql = "delete from gallery where userid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	session.removeAttribute("sessionId");
	
	response.sendRedirect("/Webcafe/Myhome.jsp");
%>