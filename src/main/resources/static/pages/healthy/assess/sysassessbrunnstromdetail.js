$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessBrunnstrom_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessBrunnstrom").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessBrunnstrom_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessBrunnstrom_save_button").bind("click",function(){
		var url = "/sysAssessBrunnstrom/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessBrunnstrom_uuid").val(),
			orderNum:$("#healthy_assess_sysAssessBrunnstrom_orderNum").val(),
			score:$("#healthy_assess_sysAssessBrunnstrom_score").val(),
			assessUuid:$("#healthy_assess_sysAssessBrunnstrom_assessUuid").val(),
			name:$("#healthy_assess_sysAssessBrunnstrom_name").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessBrunnstromDetail);
	})
	
	$("#healthy_assess_sysAssessBrunnstrom_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
	})

}

// 状态修改，
function reloadSysAssessBrunnstromDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessBrunnstrom").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessBrunnstrom_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessBrunnstrom_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


