$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessRiskInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessRiskInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessRiskInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessRiskInfo_save_button").bind("click",function(){
		var url = "/sysAssessRiskInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessRiskInfo_uuid").val(),
			shenjing:$("#healthy_assess_sysAssessRiskInfo_shenjing").val(),
			yongguokangneng:$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").val(),
			zuzhiji:$("#healthy_assess_sysAssessRiskInfo_zuzhiji").val(),
			xueguanbingshi:$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").val(),
			xueshuan:$("#healthy_assess_sysAssessRiskInfo_xueshuan").val(),
			huxi:$("#healthy_assess_sysAssessRiskInfo_huxi").val(),
			xiaohua:$("#healthy_assess_sysAssessRiskInfo_xiaohua").val(),
			baseUuid:$("#healthy_assess_sysAssessRiskInfo_baseUuid").val(),
			qita:$("#healthy_assess_sysAssessRiskInfo_qita").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessRiskInfoDetail);
	})
	
	$("#healthy_assess_sysAssessRiskInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/assess/sysassessriskinfo.html")
	})

}

// 状态修改，
function reloadSysAssessRiskInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessRiskInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessRiskInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessRiskInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


