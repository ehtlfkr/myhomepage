<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 수정</title>
</head>
<body>
	<div class="jumbotron">
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">상품 수정</h1>
			</div>
		</div>
		<%@include file="dbconn.jsp"%>
		<%
			String productId = request.getParameter("id");

			PreparedStatement pstmt = null;
			ResultSet rs = null;

			String sql = "select * from product where p_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
		%>
		<div class="container">
			<div class="row">
				<div class="col-sm-5">
					<img src="resources/images/<%=rs.getString("p_fileName")%>"
						style="width: 400px" height="500px" />
				</div>
				<div class="col-sm-7">
					<form name="newProduct" action="processUpdateProduct.jsp"
						class="form-horizontal" method="post"
						enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-sm-2">상품코드</label>
							<div class="col-sm-3">
								<input type="text" id="productId" name="productId"
									class="form-control" value='<%=rs.getString("p_id")%>' disabled>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">상품이름</label>
							<div class="col-sm-3">
								<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("p_name")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">상품가격</label>
							<div class="col-sm-3">
								<input type="text" id="unitPrice" name="unitPrice"
									class="form-control" value='<%=rs.getString("p_unitPrice")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">상품설명</label>
							<div class="col-sm-5">
								<textarea name="description" cols="50" rows="2"
									class="form-control"><%=rs.getString("p_description")%></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">제조사</label>
							<div class="col-sm-3">
								<input type="text" name="manufacturer" class="form-control" value='<%=rs.getString("p_manufacturer")%>'>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">분류</label>
							<div class="col-sm-3">
								<select name="category" id="category">
									<option value="남성의류">남성의류</option>
									<option value="여성의류">여성의류</option>
									<option value="아동의류">아동의류</option>
									<option value="스포츠용품">스포츠용품</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">재고수</label>
							<div class="col-sm-3">
								<input type="text" id="unitsInStock" name="unitsInStock"
									class="form-control" value='<%=rs.getString("p_unitsInStock")%>' >
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">상품이미지</label>
							<div class="col-sm-5">
								<input type="file" name="productImage" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<input type="submit" class="btn btn-primary" value="등록">
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