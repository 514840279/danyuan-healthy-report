$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessAsiaInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAsiaInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAsiaInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessAsiaInfo_save_button").bind("click",function(){
		var url = "/sysAssessAsiaInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessAsiaInfo_uuid").val(),
			jibie:$("#healthy_assess_sysAssessAsiaInfo_jibie").val(),
			assessUuid:$("#healthy_assess_sysAssessAsiaInfo_assessUuid").val(),
			biaoxian:$("#healthy_assess_sysAssessAsiaInfo_biaoxian").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessAsiaInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAsiaInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/assess/sysassessasiainfo.html")
	})

}

// 状态修改，
function reloadSysAssessAsiaInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAsiaInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAsiaInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAsiaInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


