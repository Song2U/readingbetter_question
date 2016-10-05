$(function(){
	
	// 찾기
	$("#btn-s").on("click", function(){
		var bkwd= $("#bkwd").val();
	});
	
	// 문제가 없을시
	$(".btn-solve").on("click", function(){
		var no = $(this).data("no");
		
		$.ajax({
			url : "/readingbetter/book/existquiz",
			type : "POST",
			data : {"no" : no},
			success : function(count) {
				if(count == 0){
					alert("퀴즈가 아직 없습니다");
					return false;
				}
				
				url = "/readingbetter/book/solvequizform?no="+no;
				
				location.replace(url);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});