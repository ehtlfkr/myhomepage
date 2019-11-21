<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 수정</title>

</head>
<body>

	<div class="jumbotron">
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">회원 수정</h1>
			</div>
		</div>
		<%@include file="../dbconn.jsp"%>
		<%
			String id = request.getParameter("id");

			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
		%>
		<div class="container">
			<div class="row">
				<div class="col-sm-7">
					<form name="member" action="./processUpdateMember.jsp?id=<%= rs.getString("id") %>"
						class="form-horizontal" method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-sm-2">아이디 : </label>
							<div class="col-sm-3">
								<input type="text" class="form-control"
									value='<%=rs.getString("id")%>' disabled />

							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">비밀번호 : </label>
							<div class="col-sm-3">
								<input type="text" id="password" name="password" class="form-control"
									value="<%=rs.getString("password")%>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이름</label>
							<div class="col-sm-3">
								<input type="text" name="name" class="form-control"
									value="<%=rs.getString("name")%>" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">성별</label>
							<div class="col-sm-3">
								<select name="gender" id="gender" >
									<option value="남자">남자</option>
									<option value="여자">여자</option>
									<option value="기타">기타</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">생일</label>
							<div class="col-sm-5">
								<input type="date" name="brith" class="form-control"
									value="<%=rs.getString("birth")%>" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">이메일 : </label>
							<div class="col-sm-3">
								<input type="email" name="mail" class="form-control"
									value="<%=rs.getString("mail")%>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">전화번호</label>
							<div class="col-sm-3">
								<input type="tel" name="phone" class="form-control"
									value="<%=rs.getString("phone")%>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label>
							<div class="col-sm-3">
								<input type="text" name="address" class="form-control"
									value="<%=rs.getString("address")%>">
							</div>
						</div>
						
						<div>
							<label> 이미지 추가 </label><br>
							<div>
								<input id="image" type="file" name="image">
								<div class="select_img">
									<img src="" />
								</div>
								<script>
									$("#image")
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

						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="수정">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	%>
</body>
</html>