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
	++a;	

	request.setCharacterEncoding("UTF-8");

	String path = "C:\\Users\\USER\\git\\myhomepage\\Webcafe\\WebContent\\resources\\images";

	int maxsize = 5 * 1024 * 1024;
	String enType = "utf-8";

	MultipartRequest multi = new MultipartRequest(request, path, maxsize, enType, new DefaultFileRenamePolicy());
	
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy.MM.dd a hh:mm");
	
	String today = sf.format(now);
	String myhomePost = "post" + a;
	String username = multi.getParameter("userid");
	String userid = multi.getParameter("id");
	String notice = multi.getParameter("notice");
	String title = multi.getParameter("title");
	String text = multi.getParameter("text");
	String image = multi.getFilesystemName("image");

	if (title.isEmpty()) title = text;
	
	
	if( image == null ) image = null;

	PreparedStatement pstmt = null;
	String sql = "insert into post values(?, ?, ?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, myhomePost);
	pstmt.setString(2, userid);
	pstmt.setString(3, username);
	pstmt.setString(4, notice);
	pstmt.setString(5, title);
	pstmt.setString(6, text);
	pstmt.setString(7, image);
	pstmt.setString(8, today);
	pstmt.executeUpdate();

	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		pstmt.close();


	response.sendRedirect("Myhome.jsp");
%>

<%! long a = 0; %>