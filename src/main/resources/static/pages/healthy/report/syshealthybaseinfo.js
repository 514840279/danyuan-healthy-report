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
$(function() {
	
	// 查询按钮事件
	searchButtonClick()
});


function searchButtonClick() {
	// 绑定提交
	$("#make_sure_search_healthy_report_sysHealthyBaseInfo_button_id").bind("click", function() {
		var param ={
				"pageNumber":1,
				"pageSize":5,
				"info":{
					"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
					"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
					"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
					"username":username
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
					"pageSize":5,
					"info":{
						"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
						"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
						"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
						"username":username
					}
				}
			var url = '/sysHealthyBaseInfo/page';
			ajaxPost(url, param, findAllBaseInfoSucess);
	    }
	});
}

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
				row.find(".item_d").find(".row span:eq(0)").text("家庭地址:"+value.homeAddress);
			}
			
			// 联系人 
			if(value.contactName != "" && value.contactName != null){
				row.find(".item_d").find(".row span:eq(1)").text("联系人:"+value.contactName);
			}
			// 联系人 
			if(value.contactTelphone != "" && value.contactTelphone != null){
				row.find(".item_d").find(".row span:eq(2)").text("联系电话:"+value.contactTelphone);
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
			onPageClicked:function(event, originalEvent, type,page){
				var searchText = $("#keyword").val();
				var userDesc = $(".search_bar").find("li.active").text();
				var param ={
					"pageNumber":page,
					"pageSize":5,
					"info":{
						"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
						"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
						"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
						"username":username
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

function addNewbase(){
	var param = {
		"idcard" : $("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
		"name" : $("#search_healthy_report_sysHealthyBaseInfo_name").val(),
		"disableCard" : $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
		"username":username
	};
	var url="/sysHealthyBaseInfo/save";
	ajaxPost(url,param,successAddnewBase);
	function successAddnewBase(result){
		var url ="/sysHealthyBaseInfo/demo/"+result.data.uuid;
		loadPage(url);
	}
	
}

