-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_use_assess_suggestion(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 comments varchar(1000)(500) COMMENT '备注',
 base_uuid varchar(36)(500) COMMENT '评审外键',
 assistive_devices_name varchar(255)(500) COMMENT '辅具名称',
 uuid varchar(36)(500) COMMENT '主键',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_use_assess_suggestion set uuid = UUID();
 alter table sys_use_assess_suggestion add primary key(uuid); 
 alter table sys_use_assess_suggestion  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_use_assess_suggestion  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_use_assess_suggestion  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_use_assess_suggestion  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_use_assess_suggestion  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_use_assess_suggestion comment '辅具评估适配意见'; 

-- 修改字段 注释 
 -- comments注释 
  alter table sys_use_assess_suggestion  modify column comments VARCHAR(500) comment '备注'; 

 -- base_uuid注释 
  alter table sys_use_assess_suggestion  modify column base_uuid VARCHAR(500) comment '评审外键'; 

 -- assistive_devices_name注释 
  alter table sys_use_assess_suggestion  modify column assistive_devices_name VARCHAR(500) comment '辅具名称'; 

 -- uuid注释 
  alter table sys_use_assess_suggestion  modify column uuid VARCHAR(500) comment '主键'; 


-- 生成索引命令 
 -- 评审外键索引
  alter table sys_use_assess_suggestion add index index_UMU3A5SSIhhpnUUh (base_uuid) ; 



