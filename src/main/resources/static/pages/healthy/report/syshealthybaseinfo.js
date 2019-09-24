window.operateEvents = {
	// 修改
	'click #clickA ': function (e, value, row, index) {
		var url="/sysHealthyBaseInfo/detail/"+row['uuid'];
		loadPage(url);
	},
	// 下载
	'click #clickB ': function (e, value, row, index) {
		var url="/sysHealthyBaseInfo/exportOne/"+row['uuid'];
		window.open(url);
	},
	// 导出
	'click #clickC ': function (e, value, row, index) {
		var url ="/sysHealthyBaseInfo/exportModal/"+row['uuid'];
		loadPage(url);
	},
	// 删除
	'click #clickD': function (e, value, row, index) {
		bootbox.setLocale("zh_CN");
		bootbox.confirm({
			message : "确定要删除选定行",
			title : "系统提示",
			callback : function(result) {
				if (result) {
					// 删除
					var url = "/sysHealthyBaseInfo/delete";	
					ajaxPost(url, row, refreshSysHealthyBaseInfo);	
				}
			}
		});
	}
}

$(function() {
	// 初始化
	init();
});

// 初始化
function init() {
	// 条件查询 
	$("#make_sure_search_healthy_report_sysHealthyBaseInfo_button_id").bind("click",function(){ 
		$('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable("refreshOptions",{pageNumber:1});
	})
	
	// 弹出编辑窗口
	$('#addnew_healthy_report_sysHealthyBaseInfo').click(function() {
		$("#healthy_report_sysHealthyBaseInfo_uuid").val("");
		$("#healthy_report_sysHealthyBaseInfo_deleteFlag").val("");
		$("#healthy_report_sysHealthyBaseInfo_discription").val("");
		$("#healthy_report_sysHealthyBaseInfo_contactName").val("");
		$("#healthy_report_sysHealthyBaseInfo_disableCard").val("");
		$("#healthy_report_sysHealthyBaseInfo_disableTypeName").val("");
		$("#healthy_report_sysHealthyBaseInfo_pathAssess").val("");
		$("#healthy_report_sysHealthyBaseInfo_bodyAssess").val("");
		$("#healthy_report_sysHealthyBaseInfo_mainAssessPerson").val("");
		$("#healthy_report_sysHealthyBaseInfo_gender").val("");
		$("#healthy_report_sysHealthyBaseInfo_disableType").val("");
		$("#healthy_report_sysHealthyBaseInfo_homeAddress").val("");
		$("#healthy_report_sysHealthyBaseInfo_contactTelphone").val("");
		$("#healthy_report_sysHealthyBaseInfo_name").val("");
		$("#healthy_report_sysHealthyBaseInfo_fullTimeMember").val("");
		$("#healthy_report_sysHealthyBaseInfo_assessTime").val("");
		$("#healthy_report_sysHealthyBaseInfo_idcard").val("");
		$("#healthy_report_sysHealthyBaseInfo_secondAssessPerson").val("");
		$('#healthy_report_sysHealthyBaseInfo_modal').modal({
			show:true,
		});
	});
	// 反填数据并弹出编辑窗口
	$('#editold_healthy_report_sysHealthyBaseInfo').click(function() {
		var data = $('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0||data.length >1){
			alert("必须选中一条数据");
		}else if(data.length > 0){
			$("#healthy_report_sysHealthyBaseInfo_uuid").val(data[0].uuid);
			$("#healthy_report_sysHealthyBaseInfo_deleteFlag").val(data[0].deleteFlag);
			$("#healthy_report_sysHealthyBaseInfo_discription").val(data[0].discription);
			$("#healthy_report_sysHealthyBaseInfo_contactName").val(data[0].contactName);
			$("#healthy_report_sysHealthyBaseInfo_disableCard").val(data[0].disableCard);
			$("#healthy_report_sysHealthyBaseInfo_disableTypeName").val(data[0].disableTypeName);
			$("#healthy_report_sysHealthyBaseInfo_pathAssess").val(data[0].pathAssess);
			$("#healthy_report_sysHealthyBaseInfo_bodyAssess").val(data[0].bodyAssess);
			$("#healthy_report_sysHealthyBaseInfo_mainAssessPerson").val(data[0].mainAssessPerson);
			$("#healthy_report_sysHealthyBaseInfo_gender").val(data[0].gender);
			$("#healthy_report_sysHealthyBaseInfo_disableType").val(data[0].disableType);
			$("#healthy_report_sysHealthyBaseInfo_homeAddress").val(data[0].homeAddress);
			$("#healthy_report_sysHealthyBaseInfo_contactTelphone").val(data[0].contactTelphone);
			$("#healthy_report_sysHealthyBaseInfo_name").val(data[0].name);
			$("#healthy_report_sysHealthyBaseInfo_fullTimeMember").val(data[0].fullTimeMember);
			$("#healthy_report_sysHealthyBaseInfo_assessTime").val(data[0].assessTime);
			$("#healthy_report_sysHealthyBaseInfo_idcard").val(data[0].idcard);
			$("#healthy_report_sysHealthyBaseInfo_secondAssessPerson").val(data[0].secondAssessPerson);
			
			// 模态框
			$('#healthy_report_sysHealthyBaseInfo_modal').modal({
				show:true,
			});
		}
	});
	// 删除记录
	$('#deleteold_healthy_report_sysHealthyBaseInfo').click(function() {
		var data = $('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0){
			alert("先选中一条数据");
		}else if(data.length>0){
			bootbox.setLocale("zh_CN");
			bootbox.confirm({
			message : "确定要导出代码",
			title : "系统提示",
			callback : function(result) {
					if (result) {
						var url = "/sysHealthyBaseInfo/deleteAll";
						var param={list:data};
						ajaxPost(url, param, refreshSysHealthyBaseInfo);
					}
				}
			});
			
		}
	});
	
	// 更新数据
	$('#healthy_report_sysHealthyBaseInfo_save_button').click(function() {
		
		var url = "/sysHealthyBaseInfo/save";
		var	info={
			uuid:$("#healthy_report_sysHealthyBaseInfo_uuid").val(),
			contactName:$("#healthy_report_sysHealthyBaseInfo_contactName").val(),
			disableCard:$("#healthy_report_sysHealthyBaseInfo_disableCard").val(),
			disableTypeName:$("#healthy_report_sysHealthyBaseInfo_disableTypeName").val(),
			pathAssess:$("#healthy_report_sysHealthyBaseInfo_pathAssess").val(),
			bodyAssess:$("#healthy_report_sysHealthyBaseInfo_bodyAssess").val(),
			mainAssessPerson:$("#healthy_report_sysHealthyBaseInfo_mainAssessPerson").val(),
			gender:$("#healthy_report_sysHealthyBaseInfo_gender").val(),
			disableType:$("#healthy_report_sysHealthyBaseInfo_disableType").val(),
			homeAddress:$("#healthy_report_sysHealthyBaseInfo_homeAddress").val(),
			contactTelphone:$("#healthy_report_sysHealthyBaseInfo_contactTelphone").val(),
			name:$("#healthy_report_sysHealthyBaseInfo_name").val(),
			fullTimeMember:$("#healthy_report_sysHealthyBaseInfo_fullTimeMember").val(),
			assessTime:$("#healthy_report_sysHealthyBaseInfo_assessTime").val(),
			idcard:$("#healthy_report_sysHealthyBaseInfo_idcard").val(),
			secondAssessPerson:$("#healthy_report_sysHealthyBaseInfo_secondAssessPerson").val(),
			deleteFlag:$("#healthy_report_sysHealthyBaseInfo_deleteFlag").val(),
			discription:$("#healthy_report_sysHealthyBaseInfo_discription").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, refreshSysHealthyBaseInfo );
		$('#healthy_report_sysHealthyBaseInfo_modal').modal("hide");
	});

	// bootstrap table 初始化
	$('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable({
		url : "/sysHealthyBaseInfo/page",
		dataType : "json",
		toolbar : '#healthy_report_sysHealthyBaseInfo_toolbar', // 工具按钮用哪个容器
		cache : true, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
		sortable : true, // 是否启用排序
		sortOrder : "asc", // 排序方式
		pagination : true, // 分页
		pageNumber : 1, // 初始化加载第一页，默认第一页
		pageSize : 10, // 每页的记录行数（*）
		pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
		strictSearch : true,
		showColumns : true, // 是否显示所有的列
		showRefresh : true, // 是否显示刷新按钮
		minimumCountColumns : 2, // 最少允许的列数
		clickToSelect : true, // 是否启用点击选中行
		height : 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
		uniqueId : "uuid", // 每一行的唯一标识，一般为主键列
		showToggle : true, // 是否显示详细视图和列表视图的切换按钮
		cardView : false, // 是否显示详细视图
		detailView : false, // 是否显示父子表
		singleSelect : false,
		locales : "zh-CN", // 表格汉化
		search : false, // 显示搜索框
		sidePagination : "server", // 服务端处理分页
		//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
		//设置为limit可以获取limit, offset, search, sort, order  
		queryParamsType : "undefined",
		contentType : "application/json",
		method : "post", // 使用get请求到服务器获取数据
		queryParams: function queryParams(params) {  
			var param = {  
				pageNumber: params.pageNumber,    
				pageSize: params.pageSize,
				sortOrder:params.sortOrder,
				sortName:params.sortName,
				filter:params.filter,
				info:{
					disableCard: $("#search_healthy_report_sysHealthyBaseInfo_disableCard").val()==""?null:$("#search_healthy_report_sysHealthyBaseInfo_disableCard").val(),
					name: $("#search_healthy_report_sysHealthyBaseInfo_name").val()==""?null:$("#search_healthy_report_sysHealthyBaseInfo_name").val(),
					idcard: $("#search_healthy_report_sysHealthyBaseInfo_idcard").val()==""?null:$("#search_healthy_report_sysHealthyBaseInfo_idcard").val(),
				}
			}; 
			return param;
		},
		columns : [ 
			{title : '全选',	checkbox : true,align : 'center',valign : 'middle'}, 
			{title : 'id',field : 'uuid',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '联系人',	field : 'contactName','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '残疾证号',	field : 'disableCard','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '肢体残疾',	field : 'disableTypeName','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '环境评估',	field : 'pathAssess','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '身体功能评估',	field : 'bodyAssess','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '主评人签字',	field : 'mainAssessPerson','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '性别',	field : 'gender','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '残疾类别',	field : 'disableType','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '家庭地址',	field : 'homeAddress','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '联系电话',	field : 'contactTelphone','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '姓名',	field : 'name','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '专职委员签字',	field : 'fullTimeMember','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '评估时间',	field : 'assessTime','width':150,align : 'right',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '身份证',	field : 'idcard','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '副评人签字',	field : 'secondAssessPerson','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '项目描述',	field : 'discription',align : 'left',sortable : true,	valign : 'middle',switchable:true,visible:false},
			{title : '创建时间',	field : 'createTime',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '创建者',	field : 'createUser',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '更新时间',	field : 'updateTime',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '更新者',	field : 'updateUser',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '标记',		field : 'deleteFlag',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '操作',align : 'left','width':180,sortable : true,valign : 'middle',switchable:true,visible:true,events: operateEvents,formatter : function(value, row, index) {
				var A = "<i  type='button' id='clickA'  class=' btn btn-default fa fa-edit' title='编辑' >详细内容</i>  ";
				var B = "<i  type='button' id='clickB'  class=' btn btn-default fa fa-download' title='下载' >下载</i>  ";
				var C = "<i  type='button' id='clickC'  class=' btn btn-default fa fa-arrow-circle-o-right' title='导出' >导出</i>  ";
				var D = "<i  type='button' id='clickD'  class=' btn btn-danger fa fa-circle-thin fa-remove' title='删除' >删除</i>  ";
				return A+D;
			}}
		],
		responseHandler: function(result){  // 成功时执行
			return {rows:result.data.content,total:result.data.totalElements}; // 绑定数据 
		},
		onLoadError: function(status,result){  // 成功时执行
			if($(result.responseText).find("form").attr("action")=="/login"){
				window.location.href="/";
			}
		},
		contextMenu: '#context-menu', // 右键菜单绑定
		onContextMenuItem: function(row,$ele){ // 右键菜单事件
		}
	}).on('dbl-click-row.bs.table', function (e, row, ele,field) { // 行双击事件 
	}).on('click-row.bs.table', function (e, row, ele,field) { // 行单击事件
	});
}
// 表格重载 事件
function refreshSysHealthyBaseInfo(){
	$('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable('refresh');
}

// 窗口大小改变时 重设表头
$(window).resize(function() {
	$('#healthy_report_sysHealthyBaseInfo_datagrid').bootstrapTable('resetView');
});


