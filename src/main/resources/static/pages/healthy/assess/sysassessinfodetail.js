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
		loadPage("/pages/healthy/report/syshealthybaseinfo.html");
	})
	
	
	// adl 绑定点击事件
	$("#healthy_assess_sysAssessInfo_adl").bind("click",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_adl_modal",
	    	title:'ADL评分',
	    	width:'80%',
	    	url:"/sysAssessAdlInfo/detail/"+assess_uuid
	    });
	})
	
	// Ashworth评级
	$("#healthy_assess_sysAssessInfo_ashworth").bind("click",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_ashworth_modal",
	    	title:'Ashworth量表评定',
	    	width:'80%',
	    	url:"/sysAssessAshworthInfo/detail/"+assess_uuid
	    });
	})
	
	// FIM评分  绑定点击事件
	$("#healthy_assess_sysAssessInfo_fim").bind("click",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_fim_modal",
	    	title:'功能独立性评定（FIM）量表',
	    	width:'80%',
	    	url:"/sysAssessFimInfo/detail/"+assess_uuid
	    });
	})
	
	// Burnnstrom分级 绑定点击事件
	$("#healthy_assess_sysAssessInfo_burnnstrom").bind("click",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_burnnstrom_modal",
	    	title:'Brunnstrom量表评定',
	    	width:'80%',
	    	url:"/sysAssessBrunnstrom/detail/"+assess_uuid
	    });
	})
	
	// ASIA分级 绑定点击事件
	$("#healthy_assess_sysAssessInfo_asia").bind("click",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_asia_modal",
	    	title:'ASIA损伤程度分级',
	    	width:'80%',
	    	url:"/sysAssessAsiaInfo/detail/"+assess_uuid
	    });
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


