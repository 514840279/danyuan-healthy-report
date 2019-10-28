$(function(){
	init();
})

function init(){
	$("#healthy_assess_sysAssessRiskInfo_shenjing").find("input[value='"+sysAssessRiskInfo.shenjing+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").find("input[value='"+sysAssessRiskInfo.yongguokangneng+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_zuzhiji").find("input[value='"+sysAssessRiskInfo.zuzhiji+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").find("input[value='"+sysAssessRiskInfo.xueguanbingshi+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_xueshuan").find("input[value='"+sysAssessRiskInfo.xueshuan+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_huxi").find("input[value='"+sysAssessRiskInfo.huxi+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_xiaohua").find("input[value='"+sysAssessRiskInfo.xiaohua+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessRiskInfo_qita").find("input[value='"+sysAssessRiskInfo.qita+"']").attr('checked','checked');
	
	$("#healthy_assess_sysAssessRiskInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessRiskInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessRiskInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	$("#healthy_assess_sysAssessRiskInfo_edit_button").click();
	
	
	$("#healthy_assess_sysAssessRiskInfo_save_button").bind("click",function(){
		var url = "/sysAssessRiskInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessRiskInfo_uuid").val(),
			baseUuid:$("#healthy_assess_sysAssessRiskInfo_baseUuid").val(),
			discription:$("#healthy_assess_sysAssessRiskInfo_discription").val(),
			deleteFlag:$("#healthy_assess_sysAssessRiskInfo_deleteFlag").val(),
			shenjing:$("#healthy_assess_sysAssessRiskInfo_shenjing").find("input:checked").val(),
			yongguokangneng:$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").find("input:checked").val(),
			zuzhiji:$("#healthy_assess_sysAssessRiskInfo_zuzhiji").find("input:checked").val(),
			xueguanbingshi:$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").find("input:checked").val(),
			xueshuan:$("#healthy_assess_sysAssessRiskInfo_xueshuan").find("input:checked").val(),
			huxi:$("#healthy_assess_sysAssessRiskInfo_huxi").find("input:checked").val(),
			xiaohua:$("#healthy_assess_sysAssessRiskInfo_xiaohua").find("input:checked").val(),
			qita:$("#healthy_assess_sysAssessRiskInfo_qita").find("input:checked").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessRiskInfoDetail);
	})
	
	$("#healthy_assess_sysAssessRiskInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/syshealthybaseinfo.html");
	})

}

// 状态修改，
function reloadSysAssessRiskInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessRiskInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessRiskInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessRiskInfo_save_button").css({"display":"none"});
		toastr.success("数据修改成功！","提示");
	}else{
		toastr.error(result.message,"error");
	}
}


