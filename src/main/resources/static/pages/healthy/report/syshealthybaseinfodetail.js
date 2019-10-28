var mainAssessPerson=null;
var secondAssessPerson=null;
var area=null;
var street=null;
var garden=null;
$(function(){
	init();
})
function init(){
	$("#healthy_report_sysHealthyBaseInfo_gender").find("input[value='"+sysHealthyBaseInfo.gender+"']").attr('checked','checked');
	$("#healthy_report_sysHealthyBaseInfo_disableType").find("input[value='"+sysHealthyBaseInfo.disableType+"']").attr('checked','checked');
	if(sysHealthyBaseInfo.disableType == '其它'){
		$("#healthy_report_sysHealthyBaseInfo_disableTypeName").show();
	}else{
		$("#healthy_report_sysHealthyBaseInfo_disableTypeName").hide();
	}
	
	
	$("#healthy_report_sysHealthyBaseInfo_edit_button").bind("click",function(){
		$("#section_healthy_report_sysHealthyBaseInfo").find(".box-body").find('.row input,.row textarea,.row select').removeAttr("disabled");
		$("#healthy_report_sysHealthyBaseInfo_save_button").css({"display":""});
		$(this).css({"display":"none"});
	})
	
	$("#healthy_report_sysHealthyBaseInfo_edit_button").click();
	
	$("#healthy_report_sysHealthyBaseInfo_save_button").bind("click",function(){
		var url = "/sysHealthyBaseInfo/save";
		var	info={
			uuid:$("#healthy_report_sysHealthyBaseInfo_uuid").val(),
			discription:$("#healthy_report_sysHealthyBaseInfo_discription").val(),
			deleteFlag:$("#healthy_report_sysHealthyBaseInfo_deleteFlag").val(),
			contactName:$("#healthy_report_sysHealthyBaseInfo_contactName").val(),
			disableCard:$("#healthy_report_sysHealthyBaseInfo_disableCard").val(),
			pathAssess:$("#healthy_report_sysHealthyBaseInfo_pathAssess").val(),
			bodyAssess:$("#healthy_report_sysHealthyBaseInfo_bodyAssess").val(),
			mainAssessPerson:mainAssessPerson,
			gender:$("#healthy_report_sysHealthyBaseInfo_gender").find("input:checked").val(),
			disableType:$("#healthy_report_sysHealthyBaseInfo_disableType").find("input:checked").val(),
			disableTypeName:$("#healthy_report_sysHealthyBaseInfo_disableTypeName").val(),
			homeAddress:$("#healthy_report_sysHealthyBaseInfo_homeAddress").val(),
			contactTelphone:$("#healthy_report_sysHealthyBaseInfo_contactTelphone").val(),
			name:$("#healthy_report_sysHealthyBaseInfo_name").val(),
			fullTimeMember:$("#healthy_report_sysHealthyBaseInfo_fullTimeMember").val(),
			assessTime:$("#healthy_report_sysHealthyBaseInfo_assessTime").val(),
			idcard:$("#healthy_report_sysHealthyBaseInfo_idcard").val(),
			area:area,
			street:street,
			garden:garden,
			secondAssessPerson:secondAssessPerson,
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, reloadSysHealthyBaseInfoDetail);
	})
	
	$("#healthy_report_sysHealthyBaseInfo_disableType").find("input[type='radio']").bind("click",function(){
		console.log($(this).val());
		if($(this).val() == '其它'){
			$("#healthy_report_sysHealthyBaseInfo_disableTypeName").show();
		}else{
			$("#healthy_report_sysHealthyBaseInfo_disableTypeName").hide();
		}
	})
	
	$("#healthy_report_sysHealthyBaseInfo_exit_button").bind("click",function(){
		loadPage("/pages/healthy/report/syshealthybaseinfo.html");
	})
	
	// 主评人
	var url = "/sysDicName/findkeyList";
	var param={code:"chief_judge"};
	mainAssessPerson=sysHealthyBaseInfo.mainAssessPerson;
	ajaxPost(url, param, addChiefJudge);
	function addChiefJudge(result){
		var data=[{id:'请选择',text:'请选择'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#healthy_report_sysHealthyBaseInfo_mainAssessPerson').select2({
			placeholder: "请选择",
			tags: true,
		    data:data
		}).on('select2:select', function (evt) {
			mainAssessPerson = evt.params.data.text;
			if(mainAssessPerson=='请选择'){
				mainAssessPerson=null;
			}
		});
		
		$('#healthy_report_sysHealthyBaseInfo_mainAssessPerson').val(sysHealthyBaseInfo.mainAssessPerson).trigger("change");
	}
	
	// 副评人
	var url = "/sysDicName/findkeyList";
	var param={code:"deputy_commentators"};
	ajaxPost(url, param, addDeputyCommentatorsSuccess);
	secondAssessPerson=sysHealthyBaseInfo.secondAssessPerson;
	function addDeputyCommentatorsSuccess(result){
		var data=[{id:'请选择',text:'请选择'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#healthy_report_sysHealthyBaseInfo_secondAssessPerson').select2({
			placeholder: "请选择",
			tags: true,
		    data:data
		}).on('select2:select', function (evt) {
			secondAssessPerson = evt.params.data.text;
			if(secondAssessPerson=='请选择'){
				secondAssessPerson=null;
			}
		});
		
		$('#healthy_report_sysHealthyBaseInfo_secondAssessPerson').val(sysHealthyBaseInfo.secondAssessPerson).trigger("change");
	}
	
	// 地区
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_area"};
	ajaxPost(url, param, addAreaSuccess);
	area=sysHealthyBaseInfo.area;
	function addAreaSuccess(result){
		var data=[{id:'请选择',text:'请选择'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#healthy_report_sysHealthyBaseInfo_area').select2({
			placeholder: "请选择",
			tags: true,
		    data:data
		}).on('select2:select', function (evt) {
			area = evt.params.data.text;
			if(area=='请选择'){
				area=null;
			}
		});
		
		$('#healthy_report_sysHealthyBaseInfo_area').val(sysHealthyBaseInfo.area).trigger("change");
	}
	
	// 街道
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_street"};
	ajaxPost(url, param, addStreetSuccess);
	street=sysHealthyBaseInfo.street;
	function addStreetSuccess(result){
		var data=[{id:'请选择',text:'请选择'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#healthy_report_sysHealthyBaseInfo_street').select2({
			placeholder: "请选择",
			tags: true,
		    data:data
		}).on('select2:select', function (evt) {
			street = evt.params.data.text;
			if(street=='请选择'){
				street=null;
			}
		});
		
		$('#healthy_report_sysHealthyBaseInfo_street').val(sysHealthyBaseInfo.street).trigger("change");
	}
	
	// 社区
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_garden"};
	ajaxPost(url, param, addGardenSuccess);
	garden=sysHealthyBaseInfo.garden;
	function addGardenSuccess(result){
		var data=[{id:'请选择',text:'请选择'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#healthy_report_sysHealthyBaseInfo_garden').select2({
			placeholder: "请选择",
			tags: true,
		    data:data
		}).on('select2:select', function (evt) {
			garden = evt.params.data.text;
			if(garden=='请选择'){
				garden=null;
			}
		});
		
		$('#healthy_report_sysHealthyBaseInfo_garden').val(sysHealthyBaseInfo.garden).trigger("change");
	}

}

// 状态修改，
function reloadSysHealthyBaseInfoDetail(result){
	if(result.code=="200"){
		$("#section_healthy_report_sysHealthyBaseInfo").find(".box-body").find('.row input,.row textarea,.row select').attr("disabled","disabled");
		$("#healthy_report_sysHealthyBaseInfo_edit_button").css({"display":""});
		$("#healthy_report_sysHealthyBaseInfo_save_button").css({"display":"none"});
		toastr.success("数据修改成功！","提示");
	}else{
		toastr.error(result.message,"error");
	}
}


