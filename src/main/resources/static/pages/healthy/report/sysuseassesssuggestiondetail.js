$(function(){
	init();
})

function init(){
	
	$("#healthy_report_sysUseAssessSuggestion_edit_button").bind("click",function(){
		$("#section_healthy_report_sysUseAssessSuggestion").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_report_sysUseAssessSuggestion_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_report_sysUseAssessSuggestion_save_button").bind("click",function(){
		var url = "/sysUseAssessSuggestion/save";
		var	info={
			uuid:$("#healthy_report_sysUseAssessSuggestion_uuid").val(),
			comments:$("#healthy_report_sysUseAssessSuggestion_comments").val(),
			baseUuid:$("#healthy_report_sysUseAssessSuggestion_baseUuid").val(),
			assistiveDevicesName:$("#healthy_report_sysUseAssessSuggestion_assistiveDevicesName").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysUseAssessSuggestionDetail);
	})
	
	$("#healthy_report_sysUseAssessSuggestion_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/sysuseassesssuggestion.html")
	})

}

// 状态修改，
function reloadSysUseAssessSuggestionDetail(result){
	if(result.code=="200"){
		$("#section_healthy_report_sysUseAssessSuggestion").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_report_sysUseAssessSuggestion_edit_button").css({"display":""});
		$("#healthy_report_sysUseAssessSuggestion_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


