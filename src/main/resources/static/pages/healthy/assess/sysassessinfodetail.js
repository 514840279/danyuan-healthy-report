$(function(){
	init();
})

function init(){
	
	$("#healthy_assess_sysAssessInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessInfo_save_button").bind("click",function(){
		var url = "/sysAssessInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessInfo_uuid").val(),
			yisizhuangtai:$("#healthy_assess_sysAssessInfo_yisizhuangtai").val(),
			fim:$("#healthy_assess_sysAssessInfo_fim").val(),
			guomin:$("#healthy_assess_sysAssessInfo_guomin").val(),
			baseUuid:$("#healthy_assess_sysAssessInfo_baseUuid").val(),
			daxiaobian:$("#healthy_assess_sysAssessInfo_daxiaobian").val(),
			tizheng:$("#healthy_assess_sysAssessInfo_tizheng").val(),
			waishang:$("#healthy_assess_sysAssessInfo_waishang").val(),
			asia:$("#healthy_assess_sysAssessInfo_asia").val(),
			yichuan:$("#healthy_assess_sysAssessInfo_yichuan").val(),
			adl:$("#healthy_assess_sysAssessInfo_adl").val(),
			zizhunengli:$("#healthy_assess_sysAssessInfo_zizhunengli").val(),
			burnnstrom:$("#healthy_assess_sysAssessInfo_burnnstrom").val(),
			ashworth:$("#healthy_assess_sysAssessInfo_ashworth").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessInfoDetail);
	})
	
	$("#healthy_assess_sysAssessInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/assess/sysassessinfo.html")
	})

}

// 状态修改，
function reloadSysAssessInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessInfo_save_button").css({"display":"none"});
	}else{
		toastr.error(result.message,"error");
	}
}


