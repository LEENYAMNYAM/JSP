$(document).ready(function(){
	
	$("#btnIdCheck").click(function(){
		window.open("idCheck.jsp","","width=500 height=300")
	})
	
	$("#btnUse").click(function(){
		if($("#userid").val()==""){
			alert("userid 입력하세요")
			return
		}
		$.ajax({
			type: "get",
			url : "idCheckProc.jsp",
			data : { userid : $("#userid").val()},
			success:function(resp){
				if(resp.trim()=="yes"){
					alert("사용가능한 아이디 입니다.")
					$(opener.document).find("#userid").val($("#userid").val())
					self.close()
				}else{
					alert("사용 불가능한 아이디 입니다.");
					$("#userid").val("")
					$("#userid").focus()
				}
			},
			error:function(e){
				alert(e + " : error");
			}
		})
	})  //btnUse
}) //document