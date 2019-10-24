$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessAsiaInfo_jibie").find("input[value='"+sysAssessAsiaInfo.jibie+"']").attr("checked","checked");
	$("#asia_jibie").text(sysAssessAsiaInfo.jibie);
	
	$("#healthy_assess_sysAssessAsiaInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAsiaInfo").find(".box-body").find('input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAsiaInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	$("#healthy_assess_sysAssessAsiaInfo_edit_button").click();
	
	$("#healthy_assess_sysAssessAsiaInfo_save_button").bind("click",function(){
		var url = "/sysAssessAsiaInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessAsiaInfo_uuid").val(),
			discription:$("#healthy_assess_sysAssessAsiaInfo_discription").val(),
			deleteFlag:$("#healthy_assess_sysAssessAsiaInfo_deleteFlag").val(),
			jibie:$("#healthy_assess_sysAssessAsiaInfo_jibie").find('input:checked').val(),
			assessUuid:$("#healthy_assess_sysAssessAsiaInfo_assessUuid").val(),
			biaoxian:$("#healthy_assess_sysAssessAsiaInfo_biaoxian").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessAsiaInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAsiaInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
	})
	
	$("#healthy_assess_sysAssessAsiaInfo_jibie").find("input").bind("click",function(){
		$("#asia_jibie").text($("#healthy_assess_sysAssessAsiaInfo_jibie").find('input:checked').val());
	})
	
	// 下一项
	$("#healthy_assess_sysAssessAsiaInfo_save_and_next_button").bind("click",function(){
		$("#healthy_assess_sysAssessAsiaInfo_save_button").click();
		$("#assess-index").tabs().showTab("assess-risk");
		setTimeout(() => {
			modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
		}, 100);
	});
	
	setTimeout(() => {
		// 关闭其他modal
		modals.closeWin("healthy_assess_sysAssessInfo_adl_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_ashworth_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_fim_modal");
	}, 500);
	
}

// 状态修改，
function reloadSysAssessAsiaInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAsiaInfo").find(".box-body").find('input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAsiaInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAsiaInfo_save_button").css({"display":"none"});
//		$("#healthy_assess_sysAssessInfo_asia").val($("#asia_jibie").text());
		modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
	}else{
		toastr.error(result.message,"error");
	}
}


