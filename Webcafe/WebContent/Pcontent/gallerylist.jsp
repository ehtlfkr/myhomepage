<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<div class="P_image main_p">
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
			<li style=" float: left; width: 240px; margin: 0 15px 15px 15px; ">
				<a href="./Pcontent/imagegallery.jsp?id=<%=rs.getString("galleryid")%>">
					<div class="card">
						<div class="card-body">
							<div style="height: 180px; overflow: hidden; background-color: #f3f3f3;" class="card-img-top">
								<img src="./resources/images/<%=rs.getString("image")%>" style="width: 150%;">
							</div>
							<p class="card-text"><%=rs.getString("username")%></p>
							<p class="card-text"><%=rs.getString("text")%></p>
						</div>
					</div>
				</a>
			</li>
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