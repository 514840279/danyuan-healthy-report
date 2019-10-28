window.sysFileImpInfoOperateEvents = {
	// 修改
	'click #clickA ': function (e, value, row, index) {
		var url="/sysFileImpInfo/detail/"+row['uuid'];
		loadPage(url);
	},
	// 下载
	'click #clickB ': function (e, value, row, index) {
		var url=row['filePath'];
		window.open(url);
	},
	// 导出
	'click #clickC ': function (e, value, row, index) {
		var url ="/sysFileImpInfo/exportModal/"+row['uuid'];
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
					var url = "/sysFileImpInfo/delete";	
					ajaxPost(url, row, refreshSysFileImpInfo);	
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
	$("#file").fileinput({
		uploadUrl : '/sysFileImpInfo/upload', //上传的地址
		language : 'zh', //设置语言
//		slugCallback : function(filename) {
//			return filename.replace('(', '_').replace(']', '_');
//		},
		allowedFileExtensions : [ 'xlsx' ],//接收的文件后缀
		showCaption: true,//是否显示标题
		showUpload : true, //是否显示上传按钮,跟随文本框的那个
        showRemove : true, //显示移除按钮,跟随文本框的那个
        showPreview : false, //是否显示预览,不写默认为true
        uploadProgress : false,
        dropZoneEnabled : false,//是否显示拖拽区域，默认不写为true，但是会占用很大区域
		textEncoding:'utf-8',
		browseClass : "btn btn-primary", //按钮样式     
		//		dropZoneEnabled : false,
		// 			mainClass : "input-group-lg",
		enctype: 'multipart/form-data',
	 	maxFileCount: 20,
 	 	msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
		enctype : 'multipart/form-data',
		validateInitialCount : true,
		overwriteInitial: true,
		previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
		uploadExtraData : function() {
			return {
				username : username
			}
		},
		uploadAsync : false,
	}).on("filebatchuploadsuccess",function(event, data, previewId, index) {
        console.log(1,data.response.data);
        refreshSysFileImpInfo()
    }).on('filebatchuploaderror', function(event, data, msg) {
		console.log(2,data);
    }).on("fileuploaded", function(event, data, previewId, index) {
		console.log(3,data);
		//导入文件上传完成之后的事件

	}).on('fileerror', function(event, data, msg) { //一个文件上传失败
		console.log(4,data);
		console.log('文件上传失败！' + msg);

	});
	
	
	// 下载模板
	$("#make_sure_download_healthy_daoru_sysFileImpInfo_button_id").bind("click",function(){ 
		window.open("/pages/healthy/daoru/daoru.xlsx");
	})
	
	// 弹出编辑窗口
	$('#addnew_healthy_daoru_sysFileImpInfo').click(function() {
		$("#healthy_daoru_sysFileImpInfo_uuid").val("");
		$("#healthy_daoru_sysFileImpInfo_deleteFlag").val("");
		$("#healthy_daoru_sysFileImpInfo_discription").val("");
		$("#healthy_daoru_sysFileImpInfo_impType").val("");
		$("#healthy_daoru_sysFileImpInfo_fileName").val("");
		$("#healthy_daoru_sysFileImpInfo_fileSize").val("");
		$("#healthy_daoru_sysFileImpInfo_filePath").val("");
		$('#healthy_daoru_sysFileImpInfo_modal').modal({
			show:true,
		});
	});
	// 反填数据并弹出编辑窗口
	$('#editold_healthy_daoru_sysFileImpInfo').click(function() {
		var data = $('#healthy_daoru_sysFileImpInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0||data.length >1){
			alert("必须选中一条数据");
		}else if(data.length > 0){
			$("#healthy_daoru_sysFileImpInfo_uuid").val(data[0].uuid);
			$("#healthy_daoru_sysFileImpInfo_deleteFlag").val(data[0].deleteFlag);
			$("#healthy_daoru_sysFileImpInfo_discription").val(data[0].discription);
			$("#healthy_daoru_sysFileImpInfo_impType").val(data[0].impType);
			$("#healthy_daoru_sysFileImpInfo_fileName").val(data[0].fileName);
			$("#healthy_daoru_sysFileImpInfo_fileSize").val(data[0].fileSize);
			$("#healthy_daoru_sysFileImpInfo_filePath").val(data[0].filePath);
			
			// 模态框
			$('#healthy_daoru_sysFileImpInfo_modal').modal({
				show:true,
			});
		}
	});
	// 删除记录
	$('#deleteold_healthy_daoru_sysFileImpInfo').click(function() {
		var data = $('#healthy_daoru_sysFileImpInfo_datagrid').bootstrapTable('getAllSelections');
		if(data.length == 0){
			alert("先选中一条数据");
		}else if(data.length>0){
			bootbox.setLocale("zh_CN");
			bootbox.confirm({
			message : "确定要导出代码",
			title : "系统提示",
			callback : function(result) {
					if (result) {
						var url = "/sysFileImpInfo/deleteAll";
						var param={list:data};
						ajaxPost(url, param, refreshSysFileImpInfo);
					}
				}
			});
			
		}
	});
	
	// 更新数据
	$('#healthy_daoru_sysFileImpInfo_save_button').click(function() {
		
		var url = "/sysFileImpInfo/save";
		var	info={
			uuid:$("#healthy_daoru_sysFileImpInfo_uuid").val(),
			impType:$("#healthy_daoru_sysFileImpInfo_impType").val(),
			fileName:$("#healthy_daoru_sysFileImpInfo_fileName").val(),
			fileSize:$("#healthy_daoru_sysFileImpInfo_fileSize").val(),
			filePath:$("#healthy_daoru_sysFileImpInfo_filePath").val(),
			deleteFlag:$("#healthy_daoru_sysFileImpInfo_deleteFlag").val(),
			discription:$("#healthy_daoru_sysFileImpInfo_discription").val(),
			createUser:username,
			updateUser:username,
		};
		ajaxPost(url, info, refreshSysFileImpInfo );
		$('#healthy_daoru_sysFileImpInfo_modal').modal("hide");
	});

	// bootstrap table 初始化
	$('#healthy_daoru_sysFileImpInfo_datagrid').bootstrapTable({
		url : "/sysFileImpInfo/page",
		dataType : "json",
		toolbar : '#healthy_daoru_sysFileImpInfo_toolbar', // 工具按钮用哪个容器
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
				}
			}; 
			return param;
		},
		columns : [ 
			{title : '全选',	checkbox : true,align : 'center',valign : 'middle'}, 
			{title : 'id',field : 'uuid',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '文件名称',	field : 'fileName','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '文件大小',	field : 'fileSize','width':150,align : 'right',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '导入标记',	field : 'impType','width':150,align : 'right',sortable : true,valign : 'middle',switchable:true,visible:true,formatter:formatterType},
			{title : '文件路径',	field : 'filePath','width':150,align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '项目描述',	field : 'discription',align : 'left',sortable : true,	valign : 'middle',switchable:true,visible:false},
			{title : '创建时间',	field : 'createTime',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '创建者',	field : 'createUser',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '更新时间',	field : 'updateTime',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '更新者',	field : 'updateUser',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:true},
			{title : '标记',		field : 'deleteFlag',align : 'left',sortable : true,valign : 'middle',switchable:true,visible:false},
			{title : '操作',align : 'left','width':180,sortable : true,valign : 'middle',switchable:true,visible:true,events: sysFileImpInfoOperateEvents,formatter : function(value, row, index) {
				var A = "<i  type='button' id='clickA'  class=' btn btn-default fa fa-edit' title='编辑' >详细内容</i>  ";
				var B = "<i  type='button' id='clickB'  class=' btn btn-default fa fa-download' title='下载' >下载</i>  ";
				var C = "<i  type='button' id='clickC'  class=' btn btn-default fa fa-arrow-circle-o-right' title='导出' >导出</i>  ";
				var D = "<i  type='button' id='clickD'  class=' btn btn-danger fa fa-circle-thin fa-remove' title='删除' >删除</i>  ";
				return B+D;
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
function refreshSysFileImpInfo(){
	$('#healthy_daoru_sysFileImpInfo_datagrid').bootstrapTable('refresh');
}

// 窗口大小改变时 重设表头
$(window).resize(function() {
	$('#healthy_daoru_sysFileImpInfo_datagrid').bootstrapTable('resetView');
});

function formatterType(value){
	console.log(value);
	if(value == 0){
		return "未导入";
	}else{
		return "已导入";
	}
}

