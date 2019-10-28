-- ================healthy.sys_file_imp_info(数据导入表)配置开始======================= 
-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table healthy.sys_file_imp_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 imp_type int(8) COMMENT '导入标记',
 uuid varchar(500) COMMENT '主键',
 file_name varchar(500) COMMENT '文件名称',
 file_size int(8) COMMENT '文件大小',
 file_path varchar(500) COMMENT '文件路径',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 修改字段非空 
 update healthy.sys_file_imp_info set uuid = UUID();
 alter table healthy.sys_file_imp_info add primary key(uuid); 
 alter table healthy.sys_file_imp_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table healthy.sys_file_imp_info  MODIFY `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table healthy.sys_file_imp_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table healthy.sys_file_imp_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table healthy.sys_file_imp_info  MODIFY `delete_flag` int  NOT NULL default 0 ;

-- 表注释 
 alter table healthy.sys_file_imp_info comment '数据导入表'; 

-- 修改字段 注释 
-- imp_type注释 
 alter table healthy.sys_file_imp_info  modify column imp_type VARCHAR(500) comment '导入标记'; 
-- uuid注释 
 alter table healthy.sys_file_imp_info  modify column uuid VARCHAR(500) comment '主键'; 
-- file_name注释 
 alter table healthy.sys_file_imp_info  modify column file_name VARCHAR(500) comment '文件名称'; 
-- file_size注释 
 alter table healthy.sys_file_imp_info  modify column file_size VARCHAR(500) comment '文件大小'; 
-- file_path注释 
 alter table healthy.sys_file_imp_info  modify column file_path VARCHAR(500) comment '文件路径'; 

-- 生成索引命令 

-- ================healthy.sys_file_imp_info(数据导入表)配置结束======================= 


