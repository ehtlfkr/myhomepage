<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<div class="P_text main_p">
	<h4>전체글보기</h4>
	<div>
		<ul class="postlist list-group list-group-flush">
			<%
				String image = "block";
				int tt_wd = 8;
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from post";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {

					if (rs.getString("image") == null) {
						image = "none";
						tt_wd = 12;
					}
			%>
			<li class="list-group-item"><a
				href="/Webcafe/Pcontent/post.jsp?id=<%=rs.getString("postid")%>">
					<div class="card mb-2 mt-3" style="max-width: 540px;">
						<div class="row no-gutters">
							<div class="col-md-<%=tt_wd%>">
								<div class="card-body">
									<p class="card-text">
										<small class="text-muted Pnotice"> <%=rs.getString("notice")%>
										</small>
									</p>
									<h5 class="card-title Ptitle"> <%=rs.getString("title")%> </h5>
									<p class="card-text Ptext"> <%=rs.getString("text")%> </p>
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
								<img src="/Webcafe/resources/images/<%=rs.getString("image")%>" class="card-img"
									alt="이미지">
							</div>
						</div>
					</div>
			</a></li>
			<%
				}
				if (rs != null) 
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
		</ul>

	</div>
</div>