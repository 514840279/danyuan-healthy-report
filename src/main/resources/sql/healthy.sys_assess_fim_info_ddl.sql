-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_assess_fim_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 uuid varchar(36)(500) COMMENT '主键',
 assess_uuid varchar(36)(500) COMMENT '一般外键',
 score int(11)(8) COMMENT '评分',
 name varchar(255)(500) COMMENT '列名',
 discription varchar(255)(500) COMMENT '描述',
 order_num int(11)(8) COMMENT '字段排序',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_assess_fim_info set uuid = UUID();
 alter table sys_assess_fim_info add primary key(uuid); 
 alter table sys_assess_fim_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_assess_fim_info  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_assess_fim_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_assess_fim_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_assess_fim_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_assess_fim_info comment 'FIM评分'; 

-- 修改字段 注释 
 -- uuid注释 
  alter table sys_assess_fim_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- assess_uuid注释 
  alter table sys_assess_fim_info  modify column assess_uuid VARCHAR(500) comment '一般外键'; 

 -- score注释 
  alter table sys_assess_fim_info  modify column score VARCHAR(500) comment '评分'; 

 -- name注释 
  alter table sys_assess_fim_info  modify column name VARCHAR(500) comment '列名'; 

 -- discription注释 
  alter table sys_assess_fim_info  modify column discription VARCHAR(500) comment '描述'; 

 -- order_num注释 
  alter table sys_assess_fim_info  modify column order_num VARCHAR(500) comment '字段排序'; 


-- 生成索引命令 
 -- 一般外键索引
  alter table sys_assess_fim_info add index index_9jMK63h82t8M88d1 (assess_uuid) ; 



