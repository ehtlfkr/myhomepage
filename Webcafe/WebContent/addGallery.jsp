<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.swing.plaf.DimensionUIResource"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src='http://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='http://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='http://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="./js/jquery-3.4.1.min.js"></script>
<script src="./js/script.js"></script>

<title>Document</title>
</head>
<body>

	<jsp:include page="./Pcontent/header.jsp" flush="true" />


	<div class="main">
		<div class="content">
			<jsp:include page="./Pcontent/user.jsp" flush="true" />
			
			<%
				String id = request.getParameter("id");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()){
			%>
			
			<div id="posting" class="P_Content">
				<div class="container">
				<h4> 갤러리 </h4>
					<form name="newposting" onsubmit="return newGallery()" action="./processAddGallery.jsp?id=<%= rs.getString("id")%>"
						class="from-horizontal" method="post" accept-charset="utf-8"
						enctype="multipart/form-data">
						<div style="display: none;">
							<label> username </label>
							<div>
								<input id="title" type="text" name="userid" class="from-contorl" value="<%= rs.getString("name")%>">
							</div>
						</div>
						<div>
							<label> 글쓰기 </label><br>
							<div>
								<textarea name="text" id="text"
									style="overflow: scroll; width: 80%; height: 300px;"></textarea>
							</div>
						</div>
						<div>
							<label> 이미지 넣기 </label><br>
							<div>
								<input id="gallery" type="file" name="image">
								<div class="select_img">
									<img src="" />
								</div>
								<script>
									$("#gallery")
											.change(
													function() {
														if (this.files
																&& this.files[0]) {
															var reader = new FileReader;
															reader.onload = function(
																	data) {
																$(
																		".select_img img")
																		.attr(
																				"src",
																				data.target.result)
																		.width(
																				500);
															}
															reader
																	.readAsDataURL(this.files[0]);
														}
													});
								</script>
							</div>
						</div>
						<div class="from-group row">
							<div class="col-sm-3">
								<input type="submit"
									class="btn btn-primary" value="업로드">
							</div>
						</div>
					</form>
				</div>
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
	
	<!-- <script>
	function newGallery() {

        var username = document.getElementById('username').value;
        var gallery = document.getElementById('gallery').value;

        if (!username || !gallery) {
            alert("이미지 또는 이름이 비어 있습니다.");
            return false;
        }


    }
	</script> -->


</body>
</html>