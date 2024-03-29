$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessAshworthInfo_jibie").find("input[name='ashworth'][value='"+sysAssessAshworthInfo.jibie+"']").attr("checked","checked");
	$("#ashworth_sore").text(sysAssessAshworthInfo.jibie);
	
	$("#healthy_assess_sysAssessAshworthInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAshworthInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAshworthInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	
	$("#healthy_assess_sysAssessAshworthInfo_edit_button").click();
	
	$("#healthy_assess_sysAssessAshworthInfo_save_button").bind("click",function(){
		var url = "/sysAssessAshworthInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessAshworthInfo_uuid").val(),
			discription:$("#healthy_assess_sysAssessAshworthInfo_discription").val(),
			deleteFlag:$("#healthy_assess_sysAssessAshworthInfo_deleteFlag").val(),
			jibie:$("#healthy_assess_sysAssessAshworthInfo_jibie").find("input[name='ashworth']:checked").val(),
			assessUuid:$("#healthy_assess_sysAssessAshworthInfo_assessUuid").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessAshworthInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAshworthInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_ashworth_modal");
	})
	$("#healthy_assess_sysAssessAshworthInfo_jibie").find("input").bind("click",function(){
		$("#ashworth_sore").text($(this).val());
	})
	
	// 下一项
	$("#healthy_assess_sysAssessAshworthInfo_save_and_next_button").bind("click",function(){
		$("#healthy_assess_sysAssessAshworthInfo_save_button").click();
		$("#healthy_assess_sysAssessInfo_fim_a").click();
		
	});
	
	
	setTimeout(() => {
		// 关闭其他modal
		modals.closeWin("healthy_assess_sysAssessInfo_adl_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_fim_modal");
	}, 300);
	
}

// 状态修改，
function reloadSysAssessAshworthInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAshworthInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAshworthInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAshworthInfo_save_button").css({"display":"none"});
//		$("#healthy_assess_sysAssessInfo_ashworth").val($("#ashworth_sore").text());
		toastr.success("数据修改成功！","提示");
	}else{
		toastr.error(result.message,"error");
	}
}


