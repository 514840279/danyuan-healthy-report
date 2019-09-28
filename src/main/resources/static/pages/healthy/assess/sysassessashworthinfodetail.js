$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessAshworthInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAshworthInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAshworthInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessAshworthInfo_save_button").bind("click",function(){
		var url = "/sysAssessAshworthInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessAshworthInfo_uuid").val(),
			jibie:$("#healthy_assess_sysAssessAshworthInfo_jibie").val(),
			assessUuid:$("#healthy_assess_sysAssessAshworthInfo_assessUuid").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessAshworthInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAshworthInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_ashworth_modal");
	})

}

// 状态修改，
function reloadSysAssessAshworthInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAshworthInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAshworthInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAshworthInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


