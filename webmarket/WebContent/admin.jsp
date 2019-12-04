<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Welcome</title>
</head>
<body>

	<nav class="navbar navbar-light" style="background-color: #e3f2fd;">

		<div class="container">
			<div class="navbar-header">
				<div class="nav-band">
					<a class="nav-link" href="/webmarket/webmarket.jsp">HOME</a>
				</div>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/webmarket/addProduct.jsp">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" href="/webmarket/updateProduct.jsp">상품수정</a></li>
				</ul>
			</div>

		</div>
	</nav>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="resources/images/<%=rs.getString("p_fileName")%>"
					style="width: 200px;">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><%=rs.getString("p_unitPrice")%>원
				<p>
					<a href="./adminproduct.jsp?id=<%=rs.getString("p_id")%>"
						class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<%
				}
				if (rs != null)
					rs.close();
				if (pstmt != null)
					rs.close();
				if (conn != null)
					conn.close();
			%>

		</div>
		<hr>
	</div>

</body>
</html>