<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="main">
<div id="loginbox">
	<c:choose>
		<c:when test='${empty authUser }'>
			<div id="login_before">
				<h4>
					로그인<a href="/readingbetter/member/joinform">가입하기</a>
				</h4>
				<!-- <form action="/readingbetter/main/login" method="post"> -->
					<div class="form-group">
						<label for="id">아이디:</label>
						<input type="text" class="form-control input-sm" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="pw">비밀번호:</label>
						<input type="password" class="form-control input-sm" id="pw" name="pw">
					</div>
					<!--<div class="checkbox">
					<label><input type="checkbox"> Remember me</label></div> -->
					<button type="submit" class="btn btn-default" id="btn-login">로그인</button>
				<!-- </form> --><br><br>
				<a href="/readingbetter/member/findform">아이디/비밀번호 찾기</a>
			</div>
		</c:when>
		
		<c:otherwise>
			<div id="login_after">
				<h5>${authUser.name }님 환영합니다 !</h5>
				<div id="myinfo_mini">
					<p>보유 캔디 : 개</p>
					<p>누적점수 : 점</p>
					<p>이번 달 점수 : 점</p>
					<p>이번 달 전체 순위 : 위</p>
					<p>명예의 전당 순위 : 위</p>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div id="search">
	<h5>책 검색</h5>
	<form id="searchform" action="" method="get">
		<div class="form-group">
 			<input type="text" id="bkwd" class="form-control input-sm" name="bkwd" value="${bkwd }">
 		</div>
 		<button type="submit" class="btn btn-default">검색</button>
	</form>
	
</div>

<div id="helpcall">
	<h4>상담전화 :</h4>
	<h4>010) xxx - xxxx</h4>
</div>
</div>