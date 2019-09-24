$(function(){
	init();
})

function init(){
	
	$("#healthy_report_sysUseAssessInfo_edit_button").bind("click",function(){
		$("#section_healthy_report_sysUseAssessInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_report_sysUseAssessInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_report_sysUseAssessInfo_save_button").bind("click",function(){
		var url = "/sysUseAssessInfo/save";
		var	info={
			uuid:$("#healthy_report_sysUseAssessInfo_uuid").val(),
			assistiveDevicesName:$("#healthy_report_sysUseAssessInfo_assistiveDevicesName").val(),
			baseUuid:$("#healthy_report_sysUseAssessInfo_baseUuid").val(),
			grantTime:$("#healthy_report_sysUseAssessInfo_grantTime").val(),
			useState:$("#healthy_report_sysUseAssessInfo_useState").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysUseAssessInfoDetail);
	})
	
	$("#healthy_report_sysUseAssessInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/sysuseassessinfo.html")
	})

}

// 状态修改，
function reloadSysUseAssessInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_report_sysUseAssessInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_report_sysUseAssessInfo_edit_button").css({"display":""});
		$("#healthy_report_sysUseAssessInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


