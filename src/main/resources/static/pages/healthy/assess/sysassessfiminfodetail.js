$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessFimInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('input').removeAttr("disabled");
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessFimInfo_save_button").bind("click",function(){
		var url = "/sysAssessFimInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessFimInfo_uuid").val(),
			discription:$("#healthy_assess_sysAssessFimInfo_discription").val(),
			deleteFlag:$("#healthy_assess_sysAssessFimInfo_deleteFlag").val(),
			assessUuid:$("#healthy_assess_sysAssessFimInfo_assessUuid").val(),
			score:$("#healthy_assess_sysAssessFimInfo_score").val(),
			name:$("#healthy_assess_sysAssessFimInfo_name").val(),
			orderNum:$("#healthy_assess_sysAssessFimInfo_orderNum").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessFimInfoDetail);
	})
	
	$("#healthy_assess_sysAssessFimInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_fim_modal");
	})

}

// 状态修改，
function reloadSysAssessFimInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessFimInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


