<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<header>

	<div class="content">
		<div
			style="width: 100%; height: 300px; overflow: hidden; position: relative;">
			<img alt="headerImage" src="/Webcafe/resources/images/home_image.jpg"
				style="width: 100%; position: absolute; top: 0; z-index: -1;">
			<h3 style="text-align: center; line-height: 300px;">Welcome My
				HomePage</h3>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link"
						href="/Webcafe/Myhome.jsp">홈 <span
							class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Webcafe/Pcontent/allcontent.jsp?id=공지사항">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Webcafe/Pcontent/allcontent.jsp">전체글</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Webcafe/Pcontent/allcontent.jsp?id=일상 게시판">일상잡담</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Webcafe/Pcontent/gallery.jsp">갤러리</a></li>
				</ul>
				<form class="form-inline my-2 my-lg-0" name="Search" action="./Search.jsp" class="from-horizontal"
						method="post" accept-charset="utf-8" enctype="multipart/form-data">
					<select name="searchs" id="searchs">
						<option value="all"> 전체 </option>
						<option value="name">이름</option>
						<option value="title">제목</option>
					</select>
					<input class="form-control mr-sm-2" type="search" name="name" placeholder="검색"
						aria-label="Search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
			</div>
		</nav>
	</div>
</header>