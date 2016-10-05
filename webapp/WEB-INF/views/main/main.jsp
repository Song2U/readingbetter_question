<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>ReadingBetter</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/readingbetter/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/readingbetter/assets/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/readingbetter/assets/js/jquery/jquery-3.1.0.js"></script>
<script type="text/javascript" src="/readingbetter/assets/dist/js/bootstrap.js"></script>
<script type="text/javascript" src="/readingbetter/assets/js/main.js"></script>
</head>
<body>
<input type="hidden" name="check-attend" value="${checkAttend }">
	<div class="container-fluid">
		<c:import url='/WEB-INF/views/include/header.jsp' />
		<div class="row asideWrap">
			<div class="col-lg-2" id="navigation">
				<c:import url='/WEB-INF/views/include/navi_main.jsp' />
			</div>
			<div id="content" class="col-lg-10">
				<div id="main">
					<div class="col-lg-6">
						<div id="today_book_box">
							<h4>오늘의 책</h4>
							<div class="tab-box">
								<div>컨텐츠</div>
								<ul>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
						</div>

						<div id="notice_box">
							<h4>공지</h4>
							<ul id="notice_list">
								<li><a href="">공지입니다</a></li>
							</ul>
						</div>
					</div>

					<div class="col-lg-6">
						<div>
							<div id="ranking_box" class="tab-box2">
								<h4>순위</h4>
								<div id="ranking_content1" class="tab-content2">
									<div id="total_rank">
										<label>이 달의 Top 5</label>
										<table id="ltable" class="table table-striped">
											<tr>
												<td id="mtrtext">순위</td>
												<td id="mtrtext">아이디</td>
												<td id="mtrtext">점수</td>
											</tr>
											<c:forEach items="${monthlyMainRank }" var="scoresvo">
												<tr>
													<td>${scoresvo.rank }</td>
													<td>${scoresvo.id }</td>
													<td>${scoresvo.monthlyScore }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div id="honor_rank">
										<label>명예의 전당 Top 5</label>
										<table id="ltable" class="table table-striped">
											<tr>
												<td id="mtrtext">순위</td>
												<td id="mtrtext">아이디</td>
												<td id="mtrtext">점수</td>
											</tr>
											<c:forEach items="${mainHonor }" var="scoresvo">
												<tr>
													<td>${scoresvo.rank }</td>
													<td>${scoresvo.id }</td>
													<td>${scoresvo.totalScore }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
								<div id="ranking_content2" class="tab-content1">
									<div id="honor_rank">
										<label>이 달의 학교 Top 5</label>
										<table id="ltable" class="table table-striped">
											<tr>
												<td id="mtrtext">순위</td>
												<td id="mtrtext">아이디</td>
												<td id="mtrtext">점수</td>
											</tr>
											<c:forEach items="${mainSchool }" var="scoresvo">
												<tr>
													<td>${scoresvo.rank }</td>
													<td>${scoresvo.title }</td>
													<td>${scoresvo.schoolScore }</td>
												</tr>
											</c:forEach>
										</table>
									</div>
									<div id="honor_rank">
										<label>이 달의 우리 학년 Top 5</label>
										<table id="ltable" class="table table-striped">
											<colgroup>
												<col width="20%" />
												<col width="40%" />
												<col width="40%" />
											</colgroup>
											<tr>
												<th>순위</th>
												<th>아이디</th>
												<th>점수</th>
											</tr>
											<c:choose>
												<c:when test="${not empty sessionScope.authUser}">
													<c:choose>
														<c:when test="${mainGrade ne null}">
															<c:forEach items="${mainGrade}" var="scoresvo">
																<tr>
																	<td>${scoresvo.rank }</td>
																	<td>${scoresvo.id }</td>
																	<td>${scoresvo.score }</td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<td colspan=3>회원님의 학년 정보가<br>없습니다.
															</td>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<td colspan=3>로그인 하시면<br>확인 가능합니다.
													</td>
												</c:otherwise>
											</c:choose>
										</table>
									</div>
								</div>
								<ul>
									<li class="firstrankpage"></li>
									<li class="secondrankpage"></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<c:import url='/WEB-INF/views/include/footer.jsp' />
	</div>
</body>
</html>

<!-- 출석체크 모달 -->
<div id="attendModal" class="modal fade attend-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">출석체크</h4>
			</div>
			<div class="modal-body">
				<c:if test="${checkAttend == 0 }">
					<p>출석 확인 되었습니다.</p>
					<p>누적 출석일 : ${attCount }</p>
					<c:choose>
						<c:when test="${attCount%7 == 0 }">
							<p>출석 보너스를 받았습니다. 히스토리에서 확인하세요.</p>
						</c:when>
						<c:otherwise>
							<p>7일 출석할 때마다 캔디를 드려요 ~</p>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${checkAttend == 1 }">
					<p>이미 오늘 출석하셨습니다.</p>
					<p>누적 출석일 : ${attCount }</p>
					<p>7일 출석할 때마다 캔디를 드려요 ~</p>
				</c:if>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="remove-attend">다시 보지 않기</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->