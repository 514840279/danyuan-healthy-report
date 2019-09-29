$(function(){
	init();
})

function init(){
	
	$.each(sysAssessBrunnstromList,function(index,sysAssessBrunnstrom){
		var adl = $("input[name='"+sysAssessBrunnstrom.name+"'][value='"+sysAssessBrunnstrom.score+"']");
		adl.attr('checked','checked');
		$.each($("input[name='"+sysAssessBrunnstrom.name+"']"),function(index,value){
			$(value).data("uuid",sysAssessBrunnstrom.uuid);
			$(value).data("deleteflag",sysAssessBrunnstrom.deleteFlag);
			$(value).data("discription",sysAssessBrunnstrom.discription);
		})
		$("#"+sysAssessBrunnstrom.name).text(sysAssessBrunnstrom.score);
	});
	
	
	$("#healthy_assess_sysAssessBrunnstrom_edit_button").bind("click",function(){
		$("#section_healthy_assess_sysAssessBrunnstrom").find(".box-body").find('input').removeAttr("disabled");
		$("#healthy_assess_sysAssessBrunnstrom_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_assess_sysAssessBrunnstrom_save_button").bind("click",function(){
		
		var url = "/sysAssessBrunnstrom/saveAll";
		
		var list=[];
		$.each($("#section_healthy_assess_sysAssessBrunnstrom").find("input:checked"),function(index,value){
			console.log($(value).data());
			var	info={
				uuid:$(value).data("uuid"),
				discription:$(value).data("discription"),
				deleteFlag:$(value).data("deleteflag"),
				score:$(value).val(),
				assessUuid: sysAssessInfo.uuid,
				name:$(value).attr("name"),
				createUser:username,
				updateUser:username,
			};
			list.push(info);
		})
		
		ajaxPost(url, {list:list}, reloadSysAssessBrunnstromDetail);
	})
	
	$("#healthy_assess_sysAssessBrunnstrom_exit_button").bind("click",function(){
		modals.closeWin("healthy_assess_sysAssessInfo_burnnstrom_modal");
	})
	
	$("#section_healthy_assess_sysAssessBrunnstrom").find("input").bind("click",function(){
		var name = $(this).attr("name");
		$("#"+name).text( $(this).val());
	})

}

// 状态修改，
function reloadSysAssessBrunnstromDetail(result){
	if(result.code=="200"){
		$("#section_healthy_assess_sysAssessBrunnstrom").find(".box-body").find('input').attr("disabled","disabled");
		$("#healthy_assess_sysAssessBrunnstrom_edit_button").css({"display":""});
		$("#healthy_assess_sysAssessBrunnstrom_save_button").css({"display":"none"});
		var brunnstromscore="";
		$.each($("#sysAssessBrunnstrom_score").find("td"),function(index,value){
			if($(value).attr("id") != undefined||$(value).attr("id") !=null){
				brunnstromscore+=$(value).attr("id")+":"+$(value).text()+";";
			}
		})
		$("#healthy_assess_sysAssessInfo_burnnstrom").val(brunnstromscore);
	}else{
		toastr.error(result.message,"error");
	}
}


