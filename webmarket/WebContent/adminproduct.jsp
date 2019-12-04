<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import ="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 상세 정보</title>
<script type = "text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		}else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<div class="container">
	<%@include file ="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select * from product where p_id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()){
		
	%>
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=rs.getString("p_fileName")%>"style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_id")%></span>
				<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<p><b>재고 수</b> : <%=rs.getString("p_unitPrice")%>
				<h4><%=rs.getString("p_unitPrice")%>원</h4>
			
				<a href="/webmarket/deleteProduct.jsp?id=<%= rs.getString("p_id") %>" class="btn btn-info" > 상품삭제 &raquo;</a> 
				<a href ="/webmarket/updateProduct.jsp?id=<%= rs.getString("p_id") %>" class ="btn btn-warning"> 상품수정  &raquo;</a>
				<a href="./admin.jsp" class="btn btn-secondary"> 뒤로가기  &raquo;</a>
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
		<hr>
	</div>
</body>
</html>