window.operateEvents = {
	// 修改
	'click #clickA ': function (e, value, row, index) {
		var url="/sysAssessRiskInfo/detail/"+row['uuid'];
		loadPage(url);
	},
	// 下载
	'click #clickB ': function (e, value, row, index) {
		var url="/sysAssessRiskInfo/exportOne/"+row['uuid'];
		window.open(url);
	},
	// 导出
	'click #clickC ': function (e, value, row, index) {
		var url ="/sysAssessRiskInfo/exportModal/"+row['uuid'];
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
					var url = "/sysAssessRiskInfo/delete";	
					ajaxPost(url, row, refreshSysAssessRiskInfo);	
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
	$("#make_sure_search_healthy_assess_sysAssessRiskInfo_button_id").bind("click",function(){ 
		$('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable("refreshOptions",{pageNumber:1});
	})
	
	// 弹出编辑窗口
	$('#addnew_healthy_assess_sysAssessRiskInfo').click(function() {
		$("#healthy_assess_sysAssessRiskInfo_uuid").val("");
		$("#healthy_assess_sysAssessRiskInfo_deleteFlag").val("");
		$("#healthy_assess_sysAssessRiskInfo_discription").val("");
		$("#healthy_assess_sysAssessRiskInfo_shenjing").val("");
		$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").val("");
		$("#healthy_assess_sysAssessRiskInfo_zuzhiji").val("");
		$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").val("");
		$("#healthy_assess_sysAssessRiskInfo_xueshuan").val("");
		$("#healthy_assess_sysAssessRiskInfo_huxi").val("");
		$("#healthy_assess_sysAssessRiskInfo_xiaohua").val("");
		$("#healthy_assess_sysAssessRiskInfo_baseUuid").val("");
		$("#healthy_assess_sysAssessRiskInfo_qita").val("");
		$('#healthy_assess_sysAssessRiskInfo_modal').modal({
			show:true,
		});
	});
	// 反填数据并弹出编辑窗口
	$('#editold_healthy_assess_sysAssessRiskInfo').click(function() {
		var data = $('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0||data.length >1){
			alert("必须选中一条数据");
		}else if(data.length > 0){
			$("#healthy_assess_sysAssessRiskInfo_uuid").val(data[0].uuid);
			$("#healthy_assess_sysAssessRiskInfo_deleteFlag").val(data[0].deleteFlag);
			$("#healthy_assess_sysAssessRiskInfo_discription").val(data[0].discription);
			$("#healthy_assess_sysAssessRiskInfo_shenjing").val(data[0].shenjing);
			$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").val(data[0].yongguokangneng);
			$("#healthy_assess_sysAssessRiskInfo_zuzhiji").val(data[0].zuzhiji);
			$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").val(data[0].xueguanbingshi);
			$("#healthy_assess_sysAssessRiskInfo_xueshuan").val(data[0].xueshuan);
			$("#healthy_assess_sysAssessRiskInfo_huxi").val(data[0].huxi);
			$("#healthy_assess_sysAssessRiskInfo_xiaohua").val(data[0].xiaohua);
			$("#healthy_assess_sysAssessRiskInfo_baseUuid").val(data[0].baseUuid);
			$("#healthy_assess_sysAssessRiskInfo_qita").val(data[0].qita);
			
			// 模态框
			$('#healthy_assess_sysAssessRiskInfo_modal').modal({
				show:true,
			});
		}
	});
	// 删除记录
	$('#deleteold_healthy_assess_sysAssessRiskInfo').click(function() {
		var data = $('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0){
			alert("先选中一条数据");
		}else if(data.length>0){
			bootbox.setLocale("zh_CN");
			bootbox.confirm({
			message : "确定要导出代码",
			title : "系统提示",
			callback : function(result) {
					if (result) {
						var url = "/sysAssessRiskInfo/deleteAll";
						var param={list:data};
						ajaxPost(url, param, refreshSysAssessRiskInfo);
					}
				}
			});
			
		}
	});
	
	// 更新数据
	$('#healthy_assess_sysAssessRiskInfo_save_button').click(function() {
		
		var url = "/sysAssessRiskInfo/save";
		var	info={
			uuid:$("#healthy_assess_sysAssessRiskInfo_uuid").val(),
			shenjing:$("#healthy_assess_sysAssessRiskInfo_shenjing").val(),
			yongguokangneng:$("#healthy_assess_sysAssessRiskInfo_yongguokangneng").val(),
			zuzhiji:$("#healthy_assess_sysAssessRiskInfo_zuzhiji").val(),
			xueguanbingshi:$("#healthy_assess_sysAssessRiskInfo_xueguanbingshi").val(),
			xueshuan:$("#healthy_assess_sysAssessRiskInfo_xueshuan").val(),
			huxi:$("#healthy_assess_sysAssessRiskInfo_huxi").val(),
			xiaohua:$("#healthy_assess_sysAssessRiskInfo_xiaohua").val(),
			baseUuid:$("#healthy_assess_sysAssessRiskInfo_baseUuid").val(),
			qita:$("#healthy_assess_sysAssessRiskInfo_qita").val(),
			deleteFlag:$("#healthy_assess_sysAssessRiskInfo_deleteFlag").val(),
			discription:$("#healthy_assess_sysAssessRiskInfo_discription").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, refreshSysAssessRiskInfo );
		$('#healthy_assess_sysAssessRiskInfo_modal').modal("hide");
	});

	// bootstrap table 初始化
	$('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable({
		url : "/sysAssessRiskInfo/page",
		dataType : "json",
		toolbar : '#healthy_assess_sysAssessRiskInfo_toolbar', // 工具按钮用哪个容器
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
					baseUuid: $("#search_healthy_assess_sysAssessRiskInfo_baseUuid").val()==""?null:$("#search_healthy_assess_sysAssessRiskInfo_baseUuid").val(),
				}
			}; 
			return param;
		},
		columns : [ 
			{title : '全选',	checkbox : true,align : 'center',valign : 'middle'}, 
			{title : 'id',field : 'uuid',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '神经系统病史',	field : 'shenjing','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '是否服用抗凝药物',	field : 'yongguokangneng','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '服用β受体阻滞剂',	field : 'zuzhiji','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '心脑血管病史',	field : 'xueguanbingshi','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '深静脉血栓/肺栓塞风险',	field : 'xueshuan','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '呼吸系统病史',	field : 'huxi','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '消化系统病史',	field : 'xiaohua','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '评估外键',	field : 'baseUuid','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '其他',	field : 'qita','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
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
function refreshSysAssessRiskInfo(){
	$('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable('refresh');
}

// 窗口大小改变时 重设表头
$(window).resize(function() {
	$('#healthy_assess_sysAssessRiskInfo_datagrid').bootstrapTable('resetView');
});


