-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_assess_brunnstrom(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 discription varchar(255)(500) COMMENT '描述',
 order_num int(11)(8) COMMENT '排序',
 score varchar(10)(500) COMMENT '评分',
 assess_uuid varchar(36)(500) COMMENT '一般外键',
 uuid varchar(36)(500) COMMENT '主键',
 name varchar(255)(500) COMMENT '列名',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_assess_brunnstrom set uuid = UUID();
 alter table sys_assess_brunnstrom add primary key(uuid); 
 alter table sys_assess_brunnstrom  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_assess_brunnstrom  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_assess_brunnstrom  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_assess_brunnstrom  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_assess_brunnstrom  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_assess_brunnstrom comment 'Burnnstrom分级'; 

-- 修改字段 注释 
 -- discription注释 
  alter table sys_assess_brunnstrom  modify column discription VARCHAR(500) comment '描述'; 

 -- order_num注释 
  alter table sys_assess_brunnstrom  modify column order_num VARCHAR(500) comment '排序'; 

 -- score注释 
  alter table sys_assess_brunnstrom  modify column score VARCHAR(500) comment '评分'; 

 -- assess_uuid注释 
  alter table sys_assess_brunnstrom  modify column assess_uuid VARCHAR(500) comment '一般外键'; 

 -- uuid注释 
  alter table sys_assess_brunnstrom  modify column uuid VARCHAR(500) comment '主键'; 

 -- name注释 
  alter table sys_assess_brunnstrom  modify column name VARCHAR(500) comment '列名'; 


-- 生成索引命令 
 -- 一般外键索引
  alter table sys_assess_brunnstrom add index index_lhzUWb28xvYGCAK6 (assess_uuid) ; 



