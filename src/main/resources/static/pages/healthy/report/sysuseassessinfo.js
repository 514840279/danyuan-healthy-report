window.operateSysUseAssessInfoEvents = {
	// 修改
	'click #clickA ': function (e, value, row, index) {
		var url="/sysUseAssessInfo/detail/"+row['uuid'];
		loadPage(url);
	},
	// 下载
	'click #clickB ': function (e, value, row, index) {
		var url="/sysUseAssessInfo/exportOne/"+row['uuid'];
		window.open(url);
	},
	// 导出
	'click #clickC ': function (e, value, row, index) {
		var url ="/sysUseAssessInfo/exportModal/"+row['uuid'];
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
					var url = "/sysUseAssessInfo/delete";	
					ajaxPost(url, row, refreshSysUseAssessInfo);	
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
	$("#make_sure_search_healthy_report_sysUseAssessInfo_button_id").bind("click",function(){ 
		$('#healthy_report_sysUseAssessInfo_datagrid').bootstrapTable("refreshOptions",{pageNumber:1});
	})
	
	// 弹出编辑窗口
	$('#addnew_healthy_report_sysUseAssessInfo').click(function() {
		var d=new Date().Format("yyyy-MM-dd");
		$("#healthy_report_sysUseAssessInfo_uuid").val("");
		$("#healthy_report_sysUseAssessInfo_deleteFlag").val(0);
		$("#healthy_report_sysUseAssessInfo_discription").val("");
		$("#healthy_report_sysUseAssessInfo_assistiveDevicesName").val("");
		$("#healthy_report_sysUseAssessInfo_baseUuid").val(sysHealthyBaseInfoUuid);
		$("#healthy_report_sysUseAssessInfo_grantTime").val(d);
		$("#healthy_report_sysUseAssessInfo_useState").val("");
		$('#healthy_report_sysUseAssessInfo_modal').modal({
			show:true,
		});
	});
	// 反填数据并弹出编辑窗口
	$('#editold_healthy_report_sysUseAssessInfo').click(function() {
		var data = $('#healthy_report_sysUseAssessInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0||data.length >1){
			alert("必须选中一条数据");
		}else if(data.length > 0){
			$("#healthy_report_sysUseAssessInfo_uuid").val(data[0].uuid);
			$("#healthy_report_sysUseAssessInfo_deleteFlag").val(data[0].deleteFlag);
			$("#healthy_report_sysUseAssessInfo_discription").val(data[0].discription);
			$("#healthy_report_sysUseAssessInfo_assistiveDevicesName").val(data[0].assistiveDevicesName);
			$("#healthy_report_sysUseAssessInfo_baseUuid").val(data[0].baseUuid);
			var d=new Date().Format("yyyy-MM-dd");
			$("#healthy_report_sysUseAssessInfo_grantTime").val(data[0].grantTime==null?d:data[0].grantTime);
			$("#healthy_report_sysUseAssessInfo_useState").val(data[0].useState);
			
			// 模态框
			$('#healthy_report_sysUseAssessInfo_modal').modal({
				show:true,
			});
		}
	});
	// 删除记录
	$('#deleteold_healthy_report_sysUseAssessInfo').click(function() {
		var data = $('#healthy_report_sysUseAssessInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0){
			alert("先选中一条数据");
		}else if(data.length>0){
			bootbox.setLocale("zh_CN");
			bootbox.confirm({
			message : "确定要导出代码",
			title : "系统提示",
			callback : function(result) {
					if (result) {
						var url = "/sysUseAssessInfo/deleteAll";
						var param={list:data};
						ajaxPost(url, param, refreshSysUseAssessInfo);
					}
				}
			});
			
		}
	});
	
	// 更新数据
	$('#healthy_report_sysUseAssessInfo_save_button').click(function() {
		
		var url = "/sysUseAssessInfo/save";
		var	info={
			uuid:$("#healthy_report_sysUseAssessInfo_uuid").val(),
			assistiveDevicesName:$("#healthy_report_sysUseAssessInfo_assistiveDevicesName").val(),
			baseUuid:$("#healthy_report_sysUseAssessInfo_baseUuid").val(),
			grantTime:$("#healthy_report_sysUseAssessInfo_grantTime").val(),
			useState:$("#healthy_report_sysUseAssessInfo_useState").val(),
			deleteFlag:$("#healthy_report_sysUseAssessInfo_deleteFlag").val(),
			discription:$("#healthy_report_sysUseAssessInfo_discription").val(),
			createUser:username,
			updateUser:username,
			
		};
		ajaxPost(url, info, refreshSysUseAssessInfo );
		$('#healthy_report_sysUseAssessInfo_modal').modal("hide");
	});

	// bootstrap table 初始化
	$('#healthy_report_sysUseAssessInfo_datagrid').bootstrapTable({
		url : "/sysUseAssessInfo/page",
		dataType : "json",
		toolbar : '#healthy_report_sysUseAssessInfo_toolbar', // 工具按钮用哪个容器
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
//		height : 500, // 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
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
					baseUuid:sysHealthyBaseInfoUuid
				}
			}; 
			return param;
		},
		columns : [ 
			{title : '全选',	checkbox : true,align : 'center',valign : 'middle'}, 
			{title : 'id',field : 'uuid',align : 'left',sortable : true,valign : 'middle',switchable:false,visible:false},
			{title : '已发放辅具名称',	field : 'assistiveDevicesName','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '评估外键',	field : 'baseUuid','width':150,align : 'left',sortable : true,valign : 'middle',switchable:false,visible:false},
			{title : '发放时间',	field : 'grantTime','width':150,align : 'right',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '现使用状况',	field : 'useState','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '项目描述',	field : 'discription',align : 'left',sortable : true,	valign : 'middle',switchable:false,visible:false},
			{title : '创建时间',	field : 'createTime',align : 'left',sortable : true,valign : 'middle',switchable:false,visible:false},
			{title : '创建者',	field : 'createUser',align : 'left',sortable : true,valign : 'middle',switchable:false,visible:false},
			{title : '更新时间',	field : 'updateTime',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '更新者',	field : 'updateUser',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '标记',		field : 'deleteFlag',align : 'left',sortable : true,valign : 'middle',switchable:false,visible:false},
			{title : '操作',align : 'left','width':180,sortable : true,valign : 'middle',switchable:true,visible:true,events: operateSysUseAssessInfoEvents,formatter : function(value, row, index) {
				var A = "<i  type='button' id='clickA'  class=' btn btn-default fa fa-edit' title='编辑' >详细内容</i>  ";
				var B = "<i  type='button' id='clickB'  class=' btn btn-default fa fa-download' title='下载' >下载</i>  ";
				var C = "<i  type='button' id='clickC'  class=' btn btn-default fa fa-arrow-circle-o-right' title='导出' >导出</i>  ";
				var D = "<i  type='button' id='clickD'  class=' btn btn-danger fa fa-circle-thin fa-remove' title='删除' >删除</i>  ";
				return D;
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
function refreshSysUseAssessInfo(){
	$('#healthy_report_sysUseAssessInfo_datagrid').bootstrapTable('refresh');
	toastr.success("数据修改成功！","提示");
}



