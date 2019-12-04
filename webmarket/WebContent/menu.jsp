<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="./dbconn.jsp"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-light" style="background-color: #e3f2fd;">

	<div class="container">
		<div class="navbar-header">
			<div class="nav-band">
				<a class="nav-link" href="/webmarket/webmarket.jsp">HOME</a>
			</div>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<%
					if (sessionId == null) {
				%>
					<li class="nav-item"><a class="nav-link"
							href="/webmarket/member/loginMember.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link"
							href='/webmarket/member/addMember.jsp'>회원 가입</a></li>
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
					<li style="padding-top: 7px; color: black">[<%= rs.getString("name") %> 님]</li>
					<li class="nav-item">
						<a class="nav-link" href="/webmarket/member/logoutMember.jsp">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/webmarket/member/resultMember.jsp">프로필</a>
					</li>
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
				<li class="nav-item">
					<a class="nav-link" href="/webmarket/products.jsp">상품목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/webmarket/BoardListAction.do?pageNum=1">게시판</a>
				</li>
			</ul>
		</div>

	</div>
</nav>