<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/readingbetter/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/board.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="container-fluid">
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<div class="row asideWrap">
			<div class="col-lg-2" id="navigation">
				<c:import url='/WEB-INF/views/include/navi_service.jsp' />
			</div>
			<div id="content" class="col-lg-10">
				<div id="question">
					<div class="small-menu">
						<a href="/readingbetter/main">홈</a> > 
						<a href="/readingbetter/service/noticelist">고객센터</a> > 
						문의 게시판
					</div>
					<p class="menu-title">문의 게시판</p>
					
					<form id="search_form" action="/mysite/board" method="post">
						<input type="text" id="kwd" name="kwd" value="${kwd }"> 
						<input type="submit" value="찾기">
					</form>

					<div id="board">
						<table class="tbl-ex">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>답변</th>
							</tr>
							<c:forEach items="${list }" var="boardvo">
								<tr>
									<c:choose>
										<c:when test="${boardvo.boardPosition eq 2 }">
											<td></td>
										</c:when>
										<c:otherwise>
											<td>${boardvo.no }</td>
										</c:otherwise>
									</c:choose>
									<td>
										<c:if test="${boardvo.boardPosition eq 2 }"><img id="re-img"src="http://ec2-52-34-170-68.us-west-2.compute.amazonaws.com/images/re.png"></c:if> <a href="/readingbetter/service/questionview?no=${boardvo.no }"> ${boardvo.title }</a>
									</td>
									<c:choose>
										<c:when test="${boardvo.position eq 0 }">
											<td>${boardvo.name }</td>
										</c:when>
										<c:otherwise>
											<td >${boardvo.id }</td>
										</c:otherwise>
									</c:choose>
									<td>${boardvo.viewCount }</td>
									<td>${boardvo.regDate }</td>
									<c:choose>
										<c:when test="${boardvo.accept eq 0}">
											<td>대기</td>
										</c:when>
										<c:when test="${boardvo.accept eq 1}">
											<td>완료</td>
										</c:when>
										<c:otherwise>
										<td><td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</table>
						<div id="button-set">
							<c:choose>
								<c:when test="${not empty sessionScope.authUser}">
									<c:if test="${authUser.position eq 1 }">
										<a class="btn btn-default" href="/readingbetter/service/questionwrite" role="button">글쓰기</a>
									</c:if>
								</c:when>
							</c:choose>
						</div>

						<!-- begin:paging -->
						<div class="pager">
							<ul>
								<li>
								<li><a href="">◀</a></li>
								<li><a href="">1</a></li>
								<li><a href="">2</a></li>
								<li><a href="">3</a></li>
								<li><a href="">4</a></li>
								<li><a href="">5</a></li>
								<li><a href="">▶</a></li>
							</ul>
						</div>
						<!-- end:paging -->
					</div>
				</div>
			</div>
		</div>

		<c:import url='/WEB-INF/views/include/footer.jsp' />

	</div>
</body>
</html>