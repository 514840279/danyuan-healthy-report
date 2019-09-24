$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessFimInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessFimInfo_save_button").bind("click",function(){
		var url = "/sysAssessFimInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessFimInfo_uuid").val(),
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
		loadPage("/pages/healthy/assess/sysassessfiminfo.html")
	})

}

// 状态修改，
function reloadSysAssessFimInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessFimInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


