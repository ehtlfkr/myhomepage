<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@include file="../dbconn.jsp"%>
<%
	
	request.setCharacterEncoding("UTF-8");	

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String brith = request.getParameter("brith");
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	PreparedStatement pstmt = null;

	String sql = "UPDATE member SET password=? name=?, gender=?, birth=?, mail=?, phone=?, address=? WHERE id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, brith);
	pstmt.setString(5, mail);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	pstmt.setString(8, id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("resultMember.jsp?id="+id);
%>