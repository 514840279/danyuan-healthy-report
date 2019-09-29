-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_use_assess_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 uuid varchar(36)(500) COMMENT '主键',
 assistive_devices_name varchar(255)(500) COMMENT '已发放辅具名称',
 base_uuid varchar(36)(500) COMMENT '评估外键',
 grant_time date COMMENT '发放时间',
 use_state varchar(255)(500) COMMENT '现使用状况',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_use_assess_info set uuid = UUID();
 alter table sys_use_assess_info add primary key(uuid); 
 alter table sys_use_assess_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_use_assess_info  MODIFY `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_use_assess_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_use_assess_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_use_assess_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_use_assess_info comment '辅具使用评估'; 

-- 修改字段 注释 
 -- uuid注释 
  alter table sys_use_assess_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- assistive_devices_name注释 
  alter table sys_use_assess_info  modify column assistive_devices_name VARCHAR(500) comment '已发放辅具名称'; 

 -- base_uuid注释 
  alter table sys_use_assess_info  modify column base_uuid VARCHAR(500) comment '评估外键'; 

 -- grant_time注释 
  alter table sys_use_assess_info  modify column grant_time VARCHAR(500) comment '发放时间'; 

 -- use_state注释 
  alter table sys_use_assess_info  modify column use_state VARCHAR(500) comment '现使用状况'; 


-- 生成索引命令 
 -- 评估外键索引
  alter table sys_use_assess_info add index index_p0O24OOEp21zzEI0 (base_uuid) ; 



