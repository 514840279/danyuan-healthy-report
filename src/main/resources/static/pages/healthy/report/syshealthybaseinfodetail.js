$(function(){
	init();
})

function init(){
	
	$("#healthy_report_sysHealthyBaseInfo_edit_button").bind("click",function(){
		$("#section_healthy_report_sysHealthyBaseInfo").find(".box-body").find('.row input,.row textarea').removeAttr("disabled");
		$("#healthy_report_sysHealthyBaseInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_report_sysHealthyBaseInfo_save_button").bind("click",function(){
		var url = "/sysHealthyBaseInfo/save";
		var	info={
			uuid:$("#healthy_report_sysHealthyBaseInfo_uuid").val(),
			contactName:$("#healthy_report_sysHealthyBaseInfo_contactName").val(),
			disableCard:$("#healthy_report_sysHealthyBaseInfo_disableCard").val(),
			disableTypeName:$("#healthy_report_sysHealthyBaseInfo_disableTypeName").val(),
			pathAssess:$("#healthy_report_sysHealthyBaseInfo_pathAssess").val(),
			bodyAssess:$("#healthy_report_sysHealthyBaseInfo_bodyAssess").val(),
			mainAssessPerson:$("#healthy_report_sysHealthyBaseInfo_mainAssessPerson").val(),
			gender:$("#healthy_report_sysHealthyBaseInfo_gender").val(),
			disableType:$("#healthy_report_sysHealthyBaseInfo_disableType").val(),
			homeAddress:$("#healthy_report_sysHealthyBaseInfo_homeAddress").val(),
			contactTelphone:$("#healthy_report_sysHealthyBaseInfo_contactTelphone").val(),
			name:$("#healthy_report_sysHealthyBaseInfo_name").val(),
			fullTimeMember:$("#healthy_report_sysHealthyBaseInfo_fullTimeMember").val(),
			assessTime:$("#healthy_report_sysHealthyBaseInfo_assessTime").val(),
			idcard:$("#healthy_report_sysHealthyBaseInfo_idcard").val(),
			secondAssessPerson:$("#healthy_report_sysHealthyBaseInfo_secondAssessPerson").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysHealthyBaseInfoDetail);
	})
	
	
	
	$("#healthy_report_sysHealthyBaseInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/syshealthybaseinfo.html");
	})

}

// 状态修改，
function reloadSysHealthyBaseInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_report_sysHealthyBaseInfo").find(".box-body").find('.row input,.row textarea').attr("disabled","disabled");
		$("#healthy_report_sysHealthyBaseInfo_edit_button").css({"display":""});
		$("#healthy_report_sysHealthyBaseInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


