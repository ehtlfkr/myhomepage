<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="javax.swing.plaf.DimensionUIResource"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%

	request.setCharacterEncoding("UTF-8");

	String path = "C:\\Users\\USER\\git\\myhomepage\\Webcafe\\WebContent\\resources\\images";
	
	int maxsize = 5 * 1024 * 1024;
	String enType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, path, maxsize, enType,
			new DefaultFileRenamePolicy());

	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");
	
	String postid = multi.getParameter("id");
	String username = multi.getParameter("username");
	String notice = multi.getParameter("notice");
	String title = multi.getParameter("title");
	String text = multi.getParameter("text");
	String image = multi.getFilesystemName("image");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from product where postid=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, postid);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		if (image != null) {
			sql = "UPDATE product SET username=?, notice=?, title=?, text=?, image=? WHERE postid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, notice);
			pstmt.setString(3, title);
			pstmt.setString(4, text);
			pstmt.setString(5, image);
			pstmt.setString(6, postid);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE product SET username=?, notice=?, title=?, text=? WHERE postid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, notice);
			pstmt.setString(3, title);
			pstmt.setString(4, text);
			pstmt.setString(5, postid);
			pstmt.executeUpdate();

		}
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();

	response.sendRedirect("post.jsp?id="+ postid);
%>