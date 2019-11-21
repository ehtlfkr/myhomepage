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
				<div class="P_text main_p" style="width: 100%;">
					<%
						request.setCharacterEncoding("UTF-8");
					
						String image = "block";
						int tt_wd = 8;
						
						String id = request.getParameter("id");
						
						PreparedStatement pstmt = null;
						ResultSet rs = null;
						
						if(id == null){
							String sql = "select * from post";
							pstmt = conn.prepareStatement(sql);
							
						}else {
							String sql = "select * from post where notice = ?";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, id);
							
						}
						rs = pstmt.executeQuery();
					%>
					<% 
					if(id == null){
					%>
					<h4>전체글 보기</h4>
					<% 
					}else{
					%>
					<h4><%=  id %> </h4>
					<%
					}
					%>
					<div>
						<ul class="postlist list-group list-group-flush">
							<%
								while (rs.next()) {

									if (rs.getString("image") == null) {
										image = "none";
										tt_wd = 12;
									}
							%>
							<li class="list-group-item"><a
								href="/Webcafe//Pcontent/post.jsp?id=<%=rs.getString("postid")%>">
									<div class="card mb-2 mt-3" style=" width: 100%;">
										<div class="row no-gutters">
											<div class="col-md-<%=tt_wd%>">
												<div class="card-body">
													<p class="card-text">
														<small class="text-muted Pnotice"> <%=rs.getString("notice")%>
														</small>
													</p>
													<h5 class="card-title Ptitle">
														<%=rs.getString("title")%>
													</h5>
													<p class="card-text Ptext">
														<%=rs.getString("text")%>
													</p>
													<p class="card-text">
														<small class="text-muted Pname"> <%=rs.getString("username")%>
														</small>
													</p>
													<p class="card-text">
														<small class="text-muted Pdate"> <%=rs.getString("day")%>
														</small>
													</p>
												</div>
											</div>
											<div class="Pimage col-md-4" style="display: <%=image%>;">
												<img src="./resources/images/<%=rs.getString("image")%>"
													class="card-img" alt="이미지">
											</div>
										</div>
									</div>
							</a></li>
							<%
								}
								if (rs != null)
									rs.close();
								if (pstmt != null)
									pstmt.close();
								if (conn != null)
									conn.close();
							%>
						</ul>

					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>