$(function() {
	$("#findId").on("click", function() {
		$("#yourId").empty();		
		var name = $("#inputNameForId").val();
		var email = $("#inputEmailForId").val();

		if (name == "") {
			alert("이름을 입력해주세요");
			$("#inputNameForId").focus();
			return false;
		}

		if (email == "") {
			alert("이메일을 입력해주세요");
			$("#inputEmailForId").focus();
			return false;
		}

		var vo = {
			"name" : name,
			"email" : email
		}

		$.ajax({
			url : "/readingbetter/member/findId",
			type : "POST",
			data : JSON.stringify(vo),
			contentType : "application/json",
			dataType : "json",
			success : function(vo) {
				if (vo.id == "") {
					$("#yourId").text("존재하지 않는 정보 입니다");
					return;
				}

				$("#yourId").text("당신의 아이디는 " + vo.id);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$("#findPw").on("click", function() {
		$("#yourPw").empty();		
		var id = $("#inputIdForPw").val();
		var name = $("#inputNameForPw").val();
		var email = $("#inputEmailForPw").val();

		if (id == "") {
			alert("아이디를 입력해주세요");
			$("#inputIdForPw").focus();
			return false;
		}
		
		if (name == "") {
			alert("이름을 입력해주세요");
			$("#inputNameForPw").focus();
			return false;
		}

		if (email == "") {
			alert("이메일을 입력해주세요");
			$("#inputEmailForPw").focus();
			return false;
		}

		var vo = {
			"id" : id, 
			"name" : name,
			"email" : email
		}

		$.ajax({
			url : "/readingbetter/member/findPw",
			type : "POST",
			data : JSON.stringify(vo),
			contentType : "application/json",
			dataType : "json",
			success : function(vo) {
				if (vo.pw == "") {
					$("#yourPw").text("존재하지 않는 정보 입니다");
					return;
				}

				$("#yourPw").text("입력된 이메일로 임시 비밀번호를 보냈습니다");
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});