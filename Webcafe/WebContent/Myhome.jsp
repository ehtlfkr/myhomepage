<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="dto.Myhome"%>
<%@ page import="dao.MyhomePicture"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="/Webcafe/resources/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src='http://unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='http://unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='http://unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<title>Myhomepage</title>
</head>
<body>

	<jsp:include page="./Pcontent/header.jsp" flush="true" />

	<div class="main">
		<div class="content">
		
			<jsp:include page="./Pcontent/user.jsp" flush="true" />
						
			<jsp:include page="./Pcontent/mainpage.jsp" flush="true" />


		</div>
	</div>

</body>
</html>