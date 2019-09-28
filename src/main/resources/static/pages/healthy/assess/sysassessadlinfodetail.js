$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessAdlInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAdlInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAdlInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessAdlInfo_save_button").bind("click",function(){
		var url = "/sysAssessAdlInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessAdlInfo_uuid").val(),
			score:$("#healthy_assess_sysAssessAdlInfo_score").val(),
			assessUuid:$("#healthy_assess_sysAssessAdlInfo_assessUuid").val(),
			name:$("#healthy_assess_sysAssessAdlInfo_name").val(),
			orderNum:$("#healthy_assess_sysAssessAdlInfo_orderNum").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessAdlInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAdlInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_adl_modal");
	})

}

// 状态修改，
function reloadSysAssessAdlInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAdlInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAdlInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAdlInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


