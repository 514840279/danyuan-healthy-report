-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table healthy.sys_healthy_base_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 contact_name varchar(500) COMMENT '联系人',
 disable_card varchar(255)(500) COMMENT '残疾证号',
 disable_type_name varchar(255)(500) COMMENT '肢体残疾',
 path_assess varchar(1000)(500) COMMENT '环境评估',
 body_assess varchar(1000)(500) COMMENT '身体功能评估',
 main_assess_person varchar(100)(500) COMMENT '主评人签字',
 gender varchar(255)(500) COMMENT '性别',
 disable_type varchar(255)(500) COMMENT '残疾类别',
 home_address varchar(500)(500) COMMENT '家庭地址',
 uuid varchar(36)(500) COMMENT '主键',
 contact_telphone varchar(500) COMMENT '联系电话',
 name varchar(255)(500) COMMENT '姓名',
 full_time_member varchar(100)(500) COMMENT '专职委员签字',
 assess_time date COMMENT '评估时间',
 idcard varchar(255)(500) COMMENT '身份证',
 second_assess_person varchar(100)(500) COMMENT '副评人签字',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update healthy.sys_healthy_base_info set uuid = UUID();
 alter table healthy.sys_healthy_base_info add primary key(uuid); 
 alter table healthy.sys_healthy_base_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table healthy.sys_healthy_base_info  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table healthy.sys_healthy_base_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table healthy.sys_healthy_base_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table healthy.sys_healthy_base_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table healthy.sys_healthy_base_info comment '辅助器具评估'; 

-- 修改字段 注释 
 -- contact_name注释 
  alter table healthy.sys_healthy_base_info  modify column contact_name VARCHAR(500) comment '联系人'; 

 -- disable_card注释 
  alter table healthy.sys_healthy_base_info  modify column disable_card VARCHAR(500) comment '残疾证号'; 

 -- disable_type_name注释 
  alter table healthy.sys_healthy_base_info  modify column disable_type_name VARCHAR(500) comment '肢体残疾'; 

 -- path_assess注释 
  alter table healthy.sys_healthy_base_info  modify column path_assess VARCHAR(500) comment '环境评估'; 

 -- body_assess注释 
  alter table healthy.sys_healthy_base_info  modify column body_assess VARCHAR(500) comment '身体功能评估'; 

 -- main_assess_person注释 
  alter table healthy.sys_healthy_base_info  modify column main_assess_person VARCHAR(500) comment '主评人签字'; 

 -- gender注释 
  alter table healthy.sys_healthy_base_info  modify column gender VARCHAR(500) comment '性别'; 

 -- disable_type注释 
  alter table healthy.sys_healthy_base_info  modify column disable_type VARCHAR(500) comment '残疾类别'; 

 -- home_address注释 
  alter table healthy.sys_healthy_base_info  modify column home_address VARCHAR(500) comment '家庭地址'; 

 -- uuid注释 
  alter table healthy.sys_healthy_base_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- contact_telphone注释 
  alter table healthy.sys_healthy_base_info  modify column contact_telphone VARCHAR(500) comment '联系电话'; 

 -- name注释 
  alter table healthy.sys_healthy_base_info  modify column name VARCHAR(500) comment '姓名'; 

 -- full_time_member注释 
  alter table healthy.sys_healthy_base_info  modify column full_time_member VARCHAR(500) comment '专职委员签字'; 

 -- assess_time注释 
  alter table healthy.sys_healthy_base_info  modify column assess_time VARCHAR(500) comment '评估时间'; 

 -- idcard注释 
  alter table healthy.sys_healthy_base_info  modify column idcard VARCHAR(500) comment '身份证'; 

 -- second_assess_person注释 
  alter table healthy.sys_healthy_base_info  modify column second_assess_person VARCHAR(500) comment '副评人签字'; 


-- 生成索引命令 
 -- 残疾证号索引
  alter table healthy.sys_healthy_base_info add index index_C1M68Ob286b9hUlG (disable_card) ; 

 -- 姓名索引
  alter table healthy.sys_healthy_base_info add index index_Qv6SK6pp8KnUpWIb (name) ; 

 -- 身份证索引
  alter table healthy.sys_healthy_base_info add index index_9h4YEhr0vv5tKSCx (idcard) ; 



