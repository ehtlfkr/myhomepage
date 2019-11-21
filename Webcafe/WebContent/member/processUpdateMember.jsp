<%@page contentType="text/html; charset=utf-8"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@include file="../dbconn.jsp"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	
	String realFolder = "C:\\Users\\USER\\eclipse-workspace\\Webcafe\\WebContent\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String password = multi.getParameter("password");
	String name = multi.getParameter("name");
	String gender = multi.getParameter("gender");
	String brith = multi.getParameter("brith");
	String mail = request.getParameter("mail");
	String phone = multi.getParameter("phone");
	String address = multi.getParameter("address");
	String image = multi.getFilesystemName("image");
	
	if( image == null ) image = "poto.png";


	PreparedStatement pstmt = null;

	String sql = "update member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, address=?, image=? where id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, password);
	pstmt.setString(2, name);
	pstmt.setString(3, gender);
	pstmt.setString(4, brith);
	pstmt.setString(5, mail);
	pstmt.setString(6, phone);
	pstmt.setString(7, address);
	pstmt.setString(8, image);
	pstmt.setString(9, id);
	pstmt.executeUpdate();
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("resultMember.jsp?id="+id);
%>