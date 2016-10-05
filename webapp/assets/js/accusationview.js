$(function() {
	$("#btn-accept").on("click", function() {
		var accept = $(":input[name=accept]:radio:checked").val();
		var no = $("input[name=no]").val();
		var accuTarget = $("input[name=accuTarget]").val();
		var id = $("input[name=id]").val();
		var keyNo = $("input[name=keyNo]").val();
		var identity = $("input[name=identity]").val();
		
		var vo = {
				"no" : no,
				"accept" : accept,
				"accuTarget" : accuTarget,
				"id" : id,
				"keyNo" : keyNo,
				"identity" : identity
		}
		
		$.ajax({
			url : "../update",
			type : "POST",
			data : JSON.stringify(vo),
			contentType: "application/json", 
//			dataType : "json",
			success : function() {
				var url = "../accusationlist";
				
				location.replace(url);
			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
});