-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_assess_asia_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 jibie varchar(255)(500) COMMENT '级别',
 assess_uuid varchar(36)(500) COMMENT '一般外键',
 uuid varchar(36)(500) COMMENT '主键',
 biaoxian varchar(255)(500) COMMENT '临床表现',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_assess_asia_info set uuid = UUID();
 alter table sys_assess_asia_info add primary key(uuid); 
 alter table sys_assess_asia_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_assess_asia_info  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_assess_asia_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_assess_asia_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_assess_asia_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_assess_asia_info comment 'ASIA分级'; 

-- 修改字段 注释 
 -- jibie注释 
  alter table sys_assess_asia_info  modify column jibie VARCHAR(500) comment '级别'; 

 -- assess_uuid注释 
  alter table sys_assess_asia_info  modify column assess_uuid VARCHAR(500) comment '一般外键'; 

 -- uuid注释 
  alter table sys_assess_asia_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- biaoxian注释 
  alter table sys_assess_asia_info  modify column biaoxian VARCHAR(500) comment '临床表现'; 


-- 生成索引命令 
 -- 一般外键索引
  alter table sys_assess_asia_info add index index_YStC0Y5MUlS9GtUj (assess_uuid) ; 



