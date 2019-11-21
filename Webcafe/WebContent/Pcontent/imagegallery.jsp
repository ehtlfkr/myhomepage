<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="../style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src='http://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='http://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='http://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<title>Document</title>
</head>
<body>

	<jsp:include page="./header.jsp" flush="true" />

	<div class="main">
		<div class="content">
			<jsp:include page="./user.jsp" flush="true" />

			<div id="postide" class="P_Content">
				<%
					String display = "block";
					String id = request.getParameter("id");
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String sql = "select * from gallery where galleryid = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();
					while (rs.next()) {

				%>
				<div class="post" style="padding: 10px 15px 10px 15px">
					<div style="width: 100%;">
						<div class="title">
							<p style="float: left; margin: 0;">
								<small class="text-muted Pnotice"> <%= rs.getString("notice") %>
								</small>
							</p>
							<a href="/Webcafe/member/usergallery.jsp?id=<%=rs.getString("userid") %>" style="float: left; margin-left: 10px;">
								<small class="text-muted Pname"> <%=rs.getString("username")%>
								</small>
							</a>
							<p
								style="float: right; margin-left: 10px; margin-bottom: 0; line-height: 40px;">
								<small class="text-muted Pdate"> <%=rs.getString("day")%>
								</small>
							</p>
						</div>
						<div class="left  text">
							<img style="margin-left: 10px; width: 500px;" src="../resources/images/<%=rs.getString("image")%>" class="card-img Pimage"
								alt="이미지">
							<p class="Ptext">
								<%=rs.getString("text")%>
							</p>
						</div>
					</div>
					<hr>
				</div>
				<%
					}
					if (rs != null) 
						rs.close();
					if(pstmt != null)
						pstmt.close();
					if(conn != null)
						conn.close();
				%>
			</div>
		</div>
	</div>


</body>
</html>