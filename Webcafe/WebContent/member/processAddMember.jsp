<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ include file="../dbconn.jsp"%>

<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd hh:mm");

	String today = sf.format(now);

	request.setCharacterEncoding("UTF-8");
	
	String realFolder = "C:\\Users\\USER\\eclipse-workspace\\webmarket\\WebContent\\resources\\images";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String id = multi.getParameter("id");
	String name = multi.getParameter("name");
	String password = multi.getParameter("password");
	String phone = multi.getParameter("phone");
	String gender = multi.getParameter("gender");
	String brith = multi.getParameter("birth");
	String mail = multi.getParameter("mail");
	String address = multi.getParameter("address");
	String image = multi.getFilesystemName("image");
	
	PreparedStatement pstmt = null;
	String sql = null;
	
	if( image == null ) {
		sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, brith);
		pstmt.setString(6, mail);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, "poto.png");
		pstmt.setString(10, today);
		pstmt.executeUpdate();
		
	}else {
		sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, brith);
		pstmt.setString(6, mail);
		pstmt.setString(7, phone);
		pstmt.setString(8, address);
		pstmt.setString(9, image);
		pstmt.setString(10, today);
		pstmt.executeUpdate();
	}
	
	String a = id + 1;
	String title = name + " 님께서 가입하셨습니다.";
	String na = null;
	
	sql = "insert into post values(?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, a);
	pstmt.setString(2, id);
	pstmt.setString(3, name);
	pstmt.setString(4, "가입 게시판");
	pstmt.setString(5, title);
	pstmt.setString(6, title);
	pstmt.setString(7, na);
	pstmt.setString(8, today);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		pstmt.close();

	response.sendRedirect("resultMember.jsp?id=" + id);
%>