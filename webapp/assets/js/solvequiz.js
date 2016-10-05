$(function() {
	$("#go-result").on("click", function() {
		var bookNo = $("input[name=no]").val();
		var answerList = new Array();
		var obj;
		
		for(var i=0; i<5; i++){
			obj = new Object();
			obj.quizNo = $("input[name=no" + i +"]").val();
			obj.answer = $(":input[name=selectedRadio" + i +"]:radio:checked").val();
			answerList.push(obj);
		}
		
		console.log(answerList);
		
		$.ajax({
			url : "countquiz",
			type : "POST",
			data : JSON.stringify(answerList),
			contentType: "application/json",
			dataType : "json",
			success : function(count) {
				var url = "resultquiz?count=" + count + "&no=" + bookNo;
				
				location.replace(url);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});