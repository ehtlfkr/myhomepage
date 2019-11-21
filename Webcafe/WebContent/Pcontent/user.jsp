<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	
%>
<div class="user_if">
	<div class="user">
		<%
			if (sessionId == null) {
		%>
			<a href="/Webcafe/member/loginMember.jsp" style="margin: 15px 0px 20px 0px;">로그인</a>
			<a href='/Webcafe/member/addMember.jsp' style="margin: 20px 0px 20px 0px;">회원 가입</a>
		<%
			} else {
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionId);
				rs = pstmt.executeQuery();
				while (rs.next()) {
		%>
			<div style="padding: 15px;">
				<img alt="프로필" src="/Webcafe/resources/images/<%= rs.getString("image") %>" style=" width: 55px; height: 55px; border-radius: 50%; ">
				<p><a href="/Webcafe/member/resultMember.jsp?id=<%= sessionId %>" title="프로필 보기">[<%= rs.getString("name") %> 님]</a></p>
				<p><a href="/Webcafe/member/logoutMember.jsp">로그아웃</a></p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="/Webcafe/member/userpost.jsp?id=<%= sessionId %>"> 내가 쓴 글 보기 </a></li>
				<li class="list-group-item"><a href="/Webcafe/member/usergallery.jsp?id=<%= sessionId %>"> 내가 올린 사진 보기</a></li>
				<button type="button" class="btn btn-success">
					<a href="/Webcafe/addpost.jsp?id=<%= sessionId%>"> 게시판에 글쓰기 </a>
				</button>
				<button type="button" class="btn btn-success">
					<a href="/Webcafe/addGallery.jsp?id=<%= sessionId%>"> 갤러리에 업로드 </a>
				</button>
			</ul>
		<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
		%>

	</div>

	<ul class="notice list-group list-group-flush">
		<li class="list-group-item"><a class="active-menu" href="/Webcafe/Pcontent/allcontent.jsp"> 전체 게시판 </a></li>
		<li class="list-group-item"><a href="/Webcafe/Pcontent/allcontent.jsp?id=공지사항"> 공지사항 </a></li>
		<li class="list-group-item"><a href="/Webcafe/Pcontent/allcontent.jsp?id=가입 게시판"> 가입 게시판 </a></li>
		<li class="list-group-item"><a href="/Webcafe/Pcontent/allcontent.jsp?id=가족 게시판"> 가족 게시판 </a></li>
		<li class="list-group-item"><a href="/Webcafe/Pcontent/allcontent.jsp?id=일상 게시판"> 일상 게시판 </a></li>
		<li class="list-group-item"><a href="/Webcafe/Pcontent/gallery.jsp"> 갤러리 </a></li>
	</ul>
</div>