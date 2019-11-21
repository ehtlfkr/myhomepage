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
<title>Myhomepage</title>
</head>
<body>

	<jsp:include page="./header.jsp" flush="true" />

	<div class="main">
		<div class="content">
			<jsp:include page="./user.jsp" flush="true" />

			<div id="mainpage" class="P_Content">
			
				
				<div class="P_image main_p" style=" width: 100%;">
					<h4>갤러리보기</h4>
					<div>
						<ul>
							<%
								PreparedStatement pstmt = null;
								ResultSet rs = null;
								String sql = "select * from gallery";
								pstmt = conn.prepareStatement(sql);
								rs = pstmt.executeQuery();
								while (rs.next()) {
				
							%>
							<li style=" float: left; width: 300px; height: 262px; margin-right: 10px;">
								<a href="/Webcafe/Pcontent/imagegallery.jsp?id=<%=rs.getString("galleryid")%>">
									<div class="card">
										<div class="card-body">
											<img src="/Webcafe/resources/images/<%=rs.getString("image")%>" class="card-img-top">
											<p class="card-text"><%=rs.getString("username")%></p>
											<p class="card-text"><%=rs.getString("text")%></p>
										</div>
									</div>
								</a>
							</li>
							<%
								}
							%>
						</ul>

					</div>
				</div>
				
			</div>

		</div>
	</div>


</body>
</html>