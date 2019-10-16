$(function(){
	init();
})

function init(){
	
	var totalsore=0;
	$.each(sysAssessAdlInfoList,function(index,sysAssessAdlInfo){
		var adl = $("input[name='"+sysAssessAdlInfo.name+"'][value='"+sysAssessAdlInfo.score+"']");
		adl.attr('checked','checked');
		adl.parents("div").parents("div").parents("div").data("uuid",sysAssessAdlInfo.uuid);
		totalsore +=sysAssessAdlInfo.score;
//		console.log(totalsore,sysAssessAdlInfo.score,sysAssessAdlInfo.name,sysAssessAdlInfo.uuid);
	});
	$("#adl_sore").text(totalsore);
	
	
	$("#healthy_assess_sysAssessAdlInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessAdlInfo").find(".box-body").find('.row input').removeAttr("disabled");
		$("#healthy_assess_sysAssessAdlInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	$("#healthy_assess_sysAssessAdlInfo_edit_button").click();
	
	$("#healthy_assess_sysAssessAdlInfo_save_button").bind("click",function(){
		var url = "/sysAssessAdlInfo/saveAll";
		var list = [];
		$.each($("#adl-group-body").find("input:checked"),function(index,input){
			var inuptobj = $(input);
			var	info={
				uuid:$(inuptobj).parents("div").parents("div").parents("div").data("uuid"),
				score:inuptobj.val(),
				assessUuid:sysAssessInfo.uuid,
				name:$(inuptobj).attr("name"),
				deleteFlag:0,
				createUser:username,
				updateUser:username,
			};
			
			list.push(info);
		})
		ajaxPost(url, {list:list}, reloadSysAssessAdlInfoDetail);
	})
	
	$("#healthy_assess_sysAssessAdlInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_adl_modal");
	})
	
	$("#adl-group-body").find("input").bind("click",function(){
		totalsore=0;
		$.each($("#adl-group-body").find("input:checked"),function(index,input){
			var inuptobj = $(input).val();
			totalsore +=Number(inuptobj);
		})
		$("#adl_sore").text(totalsore);
	})
	
	// 下一项
	$("#healthy_assess_sysAssessAdlInfo_save_and_next_button").bind("click",function(){
		$("#healthy_assess_sysAssessAdlInfo_save_button").click();
		$("#healthy_assess_sysAssessInfo_ashworth").click();
		
	});
	
	setTimeout(() => {
		// 关闭其他modal
		modals.closeWin("healthy_assess_sysAssessInfo_ashworth_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_fim_modal");
	}, 300);
	
	
}

// 状态修改，
function reloadSysAssessAdlInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessAdlInfo").find(".box-body").find('.row input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessAdlInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessAdlInfo_save_button").css({"display":"none"});
		$("#healthy_assess_sysAssessInfo_adl").val($("#adl_sore").text());
	}else{
		toastr.error(result.message,"error");
	}
}


