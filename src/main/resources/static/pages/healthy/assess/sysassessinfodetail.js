$(function(){
	init();
})

function init(){
	$("#healthy_assess_sysAssessInfo_yisizhuangtai").find("input[value='"+sysAssessInfo.yisizhuangtai+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_guomin").find("input[value='"+sysAssessInfo.guomin+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_daxiaobian").find("input[value='"+sysAssessInfo.daxiaobian+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_tizheng").find("input[value='"+sysAssessInfo.tizheng+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_waishang").find("input[value='"+sysAssessInfo.waishang+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_yichuan").find("input[value='"+sysAssessInfo.yichuan+"']").attr('checked','checked');
	$("#healthy_assess_sysAssessInfo_zizhunengli").find("input[value='"+sysAssessInfo.zizhunengli+"']").attr('checked','checked');

	
	
	$("#healthy_assess_sysAssessInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	$("#healthy_assess_sysAssessInfo_edit_button").click();
	
	$("#healthy_assess_sysAssessInfo_save_button").bind("click",function(){
		var url = "/sysAssessInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessInfo_uuid").val(),
			baseUuid:$("#healthy_assess_sysAssessInfo_baseUuid").val(),
			discription:$("#healthy_assess_sysAssessInfo_discription").val(),
			deleteFlag:$("#healthy_assess_sysAssessInfo_deleteFlag").val(),
			yisizhuangtai:$("#healthy_assess_sysAssessInfo_yisizhuangtai").find("input:checked").val(),
			guomin:$("#healthy_assess_sysAssessInfo_guomin").find("input:checked").val(),
			daxiaobian:$("#healthy_assess_sysAssessInfo_daxiaobian").find("input:checked").val(),
			tizheng:$("#healthy_assess_sysAssessInfo_tizheng").find("input:checked").val(),
			waishang:$("#healthy_assess_sysAssessInfo_waishang").find("input:checked").val(),
			yichuan:$("#healthy_assess_sysAssessInfo_yichuan").find("input:checked").val(),
			zizhunengli:$("#healthy_assess_sysAssessInfo_zizhunengli").find("input:checked").val(),
			adl:$("#healthy_assess_sysAssessInfo_adl").val(),
			ashworth:$("#healthy_assess_sysAssessInfo_ashworth").val(),
			burnnstrom:$("#healthy_assess_sysAssessInfo_burnnstrom").val(),
			fim:$("#healthy_assess_sysAssessInfo_fim").val(),
			asia:$("#healthy_assess_sysAssessInfo_asia").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysAssessInfoDetail);
	})
	
	$("#healthy_assess_sysAssessInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/syshealthybaseinfo.html");
	})
	
	
	// adl 绑定点击事件
	$("#healthy_assess_sysAssessInfo_adl").bind("click focus",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_adl_modal",
	    	title:'ADL评分',
	    	width:'95%',
	    	url:"/sysAssessAdlInfo/detail/"+assess_uuid
	    });
	})
	
	// Ashworth评级
	$("#healthy_assess_sysAssessInfo_ashworth").bind("click focus",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_ashworth_modal",
	    	title:'Ashworth量表评定',
	    	width:'95%',
	    	url:"/sysAssessAshworthInfo/detail/"+assess_uuid
	    });
	})
	
	// FIM评分  绑定点击事件
	$("#healthy_assess_sysAssessInfo_fim").bind("click focus",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_fim_modal",
	    	title:'功能独立性评定（FIM）量表',
	    	width:'95%',
	    	url:"/sysAssessFimInfo/detail/"+assess_uuid
	    });
	})
	
	// Burnnstrom分级 绑定点击事件
	$("#healthy_assess_sysAssessInfo_burnnstrom").bind("click focus",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_burnnstrom_modal",
	    	title:'Brunnstrom量表评定',
	    	width:'95%',
	    	url:"/sysAssessBrunnstrom/detail/"+assess_uuid
	    });
	})
	
	// ASIA分级 绑定点击事件
	$("#healthy_assess_sysAssessInfo_asia").bind("click focus",function(){
		var assess_uuid=$("#healthy_assess_sysAssessInfo_uuid").val();
		modals.openWin({
	    	winId:"healthy_assess_sysAssessInfo_asia_modal",
	    	title:'ASIA损伤程度分级',
	    	width:'95%',
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


