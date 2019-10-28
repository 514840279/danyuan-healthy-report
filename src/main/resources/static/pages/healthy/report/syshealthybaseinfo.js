//window.operateEvents = {
//	// 修改
//	'click #clickA ': function (e, value, row, index) {
//		var url="/sysHealthyBaseInfo/detail/"+row['uuid'];
//		loadPage(url);
//	},
//	// 下载
//	'click #clickB ': function (e, value, row, index) {
//		var url="/sysHealthyBaseInfo/exportOne/"+row['uuid'];
//		window.open(url);
//	},
//	// 导出
//	'click #clickC ': function (e, value, row, index) {
//		var url ="/sysHealthyBaseInfo/exportModal/"+row['uuid'];
//		loadPage(url);
//	},
//	// 删除
//	'click #clickD': function (e, value, row, index) {
//		bootbox.setLocale("zh_CN");
//		bootbox.confirm({
//			message : "确定要删除选定行",
//			title : "系统提示",
//			callback : function(result) {
//				if (result) {
//					// 删除
//					var url = "/sysHealthyBaseInfo/delete";	
//					ajaxPost(url, row, refreshSysHealthyBaseInfo);	
//				}
//			}
//		});
//	}
//}

var area=null;
var street=null;
var garden=null;
$(function() {
	init();
	// 查询按钮事件
	searchButtonClick()
});
function init(){
	
	// 地区
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_area"};
	ajaxPost(url, param, searchAreaSuccess);
	function searchAreaSuccess(result){
		var data=[{id:'请选择地区',text:'请选择地区'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#search_healthy_report_sysHealthyBaseInfo_area').select2({
			placeholder: "请选择地区",
			tags: true,
			width:165,
		    data:data
		}).on('select2:select', function (evt) {
			area = evt.params.data.text;
			if(area=='请选择地区'){
				area=null;
			}
		});
		
	}
	
	// 街道
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_street"};
	ajaxPost(url, param, searchStreetSuccess);
	function searchStreetSuccess(result){
		var data=[{id:'请选择街道',text:'请选择街道'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#search_healthy_report_sysHealthyBaseInfo_street').select2({
			placeholder: "请选择街道",
			tags: true,
			width:165,
		    data:data
		}).on('select2:select', function (evt) {
			street = evt.params.data.text;
			if(street=='请选择街道'){
				street=null;
			}
		});
		
	}
	
	// 社区
	var url = "/sysDicName/findkeyList";
	var param={code:"addr_garden"};
	ajaxPost(url, param, searchGardenSuccess);
	function searchGardenSuccess(result){
		var data=[{id:'请选择社区',text:'请选择社区'}]
		$.each(result,function(index,value){
			data.push({id:value.keyValue,text:value.keyword})
		})
		$('#search_healthy_report_sysHealthyBaseInfo_garden').select2({
			placeholder: "请选择社区",
			tags: true,
			width:300,
		    data:data
		}).on('select2:select', function (evt) {
			garden = evt.params.data.text;
			if(garden=='请选择社区'){
				garden=null;
			}
		});
		
	}
}

function searchButtonClick() {
	// 绑定提交
	$("#make_sure_search_healthy_report_sysHealthyBaseInfo_button_id").bind("click", function() {
		var param ={
				"pageNumber":1,
				"pageSize":10,
				"info":{
					"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
					"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
					"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
					"username":username,
					area:area,
					street:street,
					garden:garden,
				}
			}
		var url = '/sysHealthyBaseInfo/page';
		ajaxPost(url, param, findAllBaseInfoSucess);
	});
	
	// 默认提交
	$("#make_sure_search_healthy_report_sysHealthyBaseInfo_button_id").click();
	
	// 按键方法
	$("#search_healthy_report-group").bind("keypress",function(e){
		if(e.keyCode == 13){
	        //模拟点击登陆按钮，触发上面的 Click 事件
			var param ={
					"pageNumber":1,
					"pageSize":10,
					"info":{
						"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
						"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
						"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
						"username":username,
						area:area,
						street:street,
						garden:garden,
					},
					sortOrder:"desc",
					sortName:"createTime",
				}
			var url = '/sysHealthyBaseInfo/page';
			ajaxPost(url, param, findAllBaseInfoSucess);
	    }
	});
}

var currPage=1;
var deleteFlag=false;
// 数据show
function findAllBaseInfoSucess(result){
	$('#example').show();
	var context = $("#main_context");
	
	$.each(context.find("div.item"),function(index,value){
		if(index>0){
			$(value).remove();
		}
	})
	
	if(result.data.content!==null&&result.data.content.length>0){
		$.each(result.data.content,function(index,value){
			var row = context.find("div.item:eq(0)").clone(false);
			row.css({"display":""});
			
			// 名称|id|disid
			row.find(".item_a_a span").text(value.name+"("+value.idcard+")"+"("+value.disableCard+")");
			row.find(".item_a_a span").click(function(){
				var url ="/sysHealthyBaseInfo/demo/"+value.uuid;
//				var url ="/sysHealthyBaseInfo/detail/"+value.uuid;
				window.open(url);
//				loadPage(url);
			})
			// 录入时间
			if(value.createTime){
				row.find(".item_a .item_a_b").find("span:eq(0)").text(value.createTime);
			}
			
			var item_b = row.find(".item_b");
			// 性别
			if(value.gender != "" && value.gender != null){
				var item_b_d=item_b.find("div:eq(0)").clone(false);
				item_b_d.css({"display":""});
				item_b_d.find("span:eq(0)").text( value.gender);
				item_b.append(item_b_d);
			}
			
			// 残疾类型
			if(value.disableType != "" && value.disableType != null){
				var item_b_d=item_b.find("div:eq(0)").clone(false);
				item_b_d.css({"display":""});
				item_b_d.find("span:eq(0)").text( value.disableType);
				item_b.append(item_b_d);
			}
			
			// 主评人
			if(value.mainAssessPerson != "" && value.mainAssessPerson != null){
				var item_b_d=item_b.find("div:eq(0)").clone(false);
				item_b_d.css({"display":""});
				item_b_d.find("span:eq(0)").text( "主评:"+value.mainAssessPerson);
				item_b.append(item_b_d);
			}
			
			// 副评人
			if(value.secondAssessPerson != "" && value.secondAssessPerson != null){
				var item_b_d=item_b.find("div:eq(0)").clone(false);
				item_b_d.css({"display":""});
				item_b_d.find("span:eq(0)").text( "副评:"+value.secondAssessPerson);
				item_b.append(item_b_d);
			}
			
			// 专职委
			if(value.fullTimeMember != "" && value.fullTimeMember != null){
				var item_b_d=item_b.find("div:eq(0)").clone(false);
				item_b_d.css({"display":""});
				item_b_d.find("span:eq(0)").text( "专职委员:"+value.fullTimeMember);
				item_b.append(item_b_d);
			}
			
			// 环境评估
			row.find(".item_c").append("环境评估:"+value.pathAssess+"<br />");
			row.find(".item_c").append("辅具使用估:"+value.bodyAssess+"<br />");
			// home_address
			if(value.homeAddress != "" && value.homeAddress != null){
				row.find(".item_d").find(".row span.item_d_a0").text("性别:"+value.gender);
			}
			// home_address
			if(value.homeAddress != "" && value.homeAddress != null){
				row.find(".item_d").find(".row span.item_d_a").text("家庭地址:"+value.homeAddress);
			}
			
			// 联系人 
			if(value.contactName != "" && value.contactName != null){
				row.find(".item_d").find(".row span.item_d_b").text("联系人:"+value.contactName);
			}
			// 联系电话
			if(value.contactTelphone != "" && value.contactTelphone != null){
				row.find(".item_d").find(".row span.item_d_c span:first").text("联系电话:"+value.contactTelphone);
			}
			row.find(".item_d").find(".row span.item_d_c a").bind("click",function(){
				bootbox.setLocale("zh_CN");
				bootbox.confirm({
					message : "确定要删除选定行",
					title : "系统提示",
					callback : function(result) {
						if (result) {
							// 删除
							var url = "/sysHealthyBaseInfo/delete";	
							value.updateUser=username;
							ajaxPost(url, value, reloadAllBaseInfoSucess);	
						}
					}
				});
			});
			if(!deleteFlag){
				row.find(".item_d").find(".row span.item_d_c a").hide();
			}
			
			context.append(row);
		});
	
		// 分页
		var options = {
			size:"large",
			bootstrapMajorVersion:3,
			currentPage: result.data.number+1,
			totalPages: result.data.totalPages,
			numberOfPages:result.data.numberOfElements,
			itemTexts: function (type, page, current) {
			     switch (type) {
			      case "first": return "首页";
			      case "prev": return "上一页";
			      case "next": return "下一页";
			      case "last": return "末页";
			      case "page": return page;
			     }
			    },//改写分页按钮字样
			onPageClicked:function(event, originalEvent, type,page){
				currPage = page;
				var searchText = $("#keyword").val();
				var userDesc = $(".search_bar").find("li.active").text();
				var param ={
					"pageNumber":page,
					"pageSize":10,
					"info":{
						"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
						"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
						"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
						"username":username,
						area:area,
						street:street,
						garden:garden,
					}
				};
				var url = '/sysHealthyBaseInfo/page';
				ajaxPost(url, param, findAllBaseInfoSucess);
			}
		}
		
		$('#example').bootstrapPaginator(options);
	}else{
		$('#example').hide();
	}
}

function reloadAllBaseInfoSucess(){
	var searchText = $("#keyword").val();
	var userDesc = $(".search_bar").find("li.active").text();
	var param ={
		"pageNumber": currPage,
		"pageSize":10,
		"info":{
			"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
			"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
			"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
			"username":username,
			area:area,
			street:street,
			garden:garden,
		}
	};
	var url = '/sysHealthyBaseInfo/page';
	ajaxPost(url, param, findAllBaseInfoSucess);
}

function addNewbase(){
	var param = {
		"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
		"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
		"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
		"username":username,
		"createUser":username,
		area:area,
		street:street,
		garden:garden,
	};
	var url="/sysHealthyBaseInfo/save";
	ajaxPost(url,param,successAddnewBase);
	function successAddnewBase(result){
		var url ="/sysHealthyBaseInfo/demo/"+result.data.uuid;
//		loadPage(url);
		window.open(url)
	}
	
}

function showdeletebutton(){
	deleteFlag=true;
	var context = $("#main_context");
	$.each(context.find("div.item"),function(index,row){
		if(index>0){
			$(row).find(".item_d").find(".row span.item_d_c a").show();
		}
	})
	$("#showdeletebutton_id").css({"display":"none"});
	$("#makesuredelete_id").css({"display":""});
}

function makesuredelete(){
	deleteFlag=false;
	var context = $("#main_context");
	$.each(context.find("div.item"),function(index,row){
		if(index>0){
			$(row).find(".item_d").find(".row span.item_d_c a").hide();
		}
	})
	$("#makesuredelete_id").css({"display":"none"});
	$("#showdeletebutton_id").css({"display":""});
}

