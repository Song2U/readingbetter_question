$(function() {
	// 폼 체크
	$("#make-quiz-form").submit(function() {
		// 입력 체크
		if ($("#quiz").val() == "") {
			alert("문제를 입력해주세요");
			$("#quiz").focus();
			return false;
		}

		if ($("#ex1").val() == "") {
			alert("보기 1번을 작성해주세요");
			$("#ex1").focus();
			return false;
		}

		if ($("#ex2").val() == "") {
			alert("보기 2번을 작성해주세요");
			$("#ex2").focus();
			return false;
		}

		if ($("#ex3").val() == "") {
			alert("보기 3번을 작성해주세요");
			$("#ex3").focus();
			return false;
		}

		if ($("#ex4").val() == "") {
			alert("보기 4번을 작성해주세요");
			$("#ex4").focus();
			return false;
		}

		alert("문제를 제출했습니다");

		return true;
	});
});