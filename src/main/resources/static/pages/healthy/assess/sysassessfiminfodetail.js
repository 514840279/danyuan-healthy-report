$(function(){
	init();
})

function init(){
	
	$.each(sysAssessFimInfoList,function(index,sysAssessFimInfo){
		var fim = $("input[name='"+sysAssessFimInfo.name+"'][value='"+sysAssessFimInfo.score+"']");
		fim.attr('checked','checked');
		fim.parents("td").parents("tr").data("uuid",sysAssessFimInfo.uuid);
	});
	
	
	$("#healthy_assess_sysAssessFimInfo_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('input').removeAttr("disabled");
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	});
	$("#healthy_assess_sysAssessFimInfo_edit_button").click();
	
	$("#healthy_assess_sysAssessFimInfo_save_button").bind("click",function(){
		var url = "/sysAssessFimInfo/saveAll";
		var list = [];
		$.each($("#section_healthy_assess_sysAssessFimInfo").find("input:checked"),function(index,input){
			var inuptobj = $(input);
			var	info={
				uuid:$(inuptobj).parents("td").parents("tr").data("uuid"),
				score:inuptobj.val(),
				assessUuid:sysAssessInfo.uuid,
				name:$(inuptobj).attr("name"),
				deleteFlag:0,
				createUser:username,
				updateUser:username,
			};
			
			list.push(info);
		})
		ajaxPost(url, {list:list}, reloadSysAssessFimInfoDetail);
	})
	
	$("#healthy_assess_sysAssessFimInfo_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_fim_modal");
	})
	
	var sportScore=0;
	$.each($("#sport-group").find("input:checked"),function(index,value){
		var score = $(value).val();
		sportScore +=Number(score);
	});
	$("#sport_score").text(sportScore);
	
	var yishiScore=0;
	$.each($("#yishi-group").find("input:checked"),function(index,value){
		var score = $(value).val();
		yishiScore +=Number(score);
	});
	$("#yishi-score").text(yishiScore);
	
	$("#totle-score").text(sportScore+yishiScore);
	
	$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('input').bind("click",function(){
		var sportScore=0;
		$.each($("#sport-group").find("input:checked"),function(index,value){
			var score = $(value).val();
			sportScore +=Number(score);
		});
		$("#sport_score").text(sportScore);
		
		var yishiScore=0;
		$.each($("#yishi-group").find("input:checked"),function(index,value){
			var score = $(value).val();
			yishiScore +=Number(score);
		});
		$("#yishi-score").text(yishiScore);
		
		$("#totle-score").text(sportScore+yishiScore);
		
	})
		// 下一项
	$("#healthy_assess_sysAssessFimInfo_save_and_next_button").bind("click",function(){
		$("#healthy_assess_sysAssessFimInfo_save_button").click();
		$("#healthy_assess_sysAssessInfo_burnnstrom_a").click();
	});
	setTimeout(() => {
		// 关闭其他modal
		modals.closeWin("healthy_assess_sysAssessInfo_adl_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_ashworth_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_asia_modal");
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
	}, 500);
}

// 状态修改，
function reloadSysAssessFimInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessFimInfo").find(".box-body").find('input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessFimInfo_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessFimInfo_save_button").css({"display":"none"});
//		$("#healthy_assess_sysAssessInfo_fim").val($("#totle-score").text());
	}else{
		toastr.error(result.message,"error");
	}
}


