$(function() {
	$(".tab-content1").hide();

	$(".tab-box li").click(function() {
		var $li = $(".tab-box li");

		$(".tab-box li.selected").removeClass("selected");
		$li.addClass("selected");
	});

	$(".tab-box2 li").click(function() {
		var $li = $(this);

		$(".tab-box2 li.selected").removeClass("selected");
		$li.addClass("selected");

		if ($(".firstrankpage").hasClass("selected")) {
			$(".tab-content1").show();
			$(".tab-content2").hide();
		}
		if ($(".secondrankpage").hasClass("selected")) {
			$(".tab-content1").hide();
			$(".tab-content2").show();
		}
	});
	
	$("#btn-login").on("click", function(){
		var id = $("input[name=id]").val();
		var pw = $("input[name=pw]").val();
		
		var vo = {
				"id" : id,
				"pw" : pw
		}
		
		$.ajax({
			url : "main/login",
			type : "POST",
			data : JSON.stringify(vo),
			contentType: "application/json", 
//			dataType : "json",
			success : function(url) {
				var url = url;
				
				location.replace(url);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/*$(function() {
	   setInterval(function() {
	      var $li = $(this);
	      setTimeout(function() {
	         $(".tab-box2 li.selected").removeClass("selected");
	         $li.addClass("selected");
	      }, 3000);
	      
	      if ($(".firstrankpage").hasClass("selected")) {
	         $(".tab-content1").show();
	         $(".tab-content2").hide();
	      }
	      if ($(".secondrankpage").hasClass("selected")) {
	         $(".tab-content1").hide();
	         $(".tab-content2").show();
	      }
	   }, 6000)
	   
	 * function first() { $(".secondrankpage").addClass("selected");
	 * $(".firstrankpage").removeClass("selected"); console.log("첫번째 페이지");
	 * setTimeout(second(), 3000); } function second() {
	 * $(".secondrankpage").addClass("selected");
	 * $(".firstrankpage").removeClass("selected"); console.log("두번째 페이지");
	 * setTimeout(first(), 3000); } first();
	    
	});*/
	
	var a = $("input[name=check-attend]").val();
	
	if(a != ""){
		$("div.modal").modal();
	}
	
	// 출석 체크 창 다시 보지 않기
	$("#remove-attend").on("click", function(){
		$.ajax({
			url : "main/removeattend",
			type : "POST",
			success : function() {
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});