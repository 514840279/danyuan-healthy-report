-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_assess_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 yisizhuangtai varchar(10)(500) COMMENT '意识状态',
 uuid varchar(36)(500) COMMENT '主键',
 fim int(11)(8) COMMENT 'FIM评分',
 guomin varchar(10)(500) COMMENT '过敏药物或食物',
 base_uuid varchar(36)(500) COMMENT '评估外键',
 daxiaobian varchar(10)(500) COMMENT '大小便',
 tizheng varchar(10)(500) COMMENT '生命体征平稳',
 waishang varchar(10)(500) COMMENT '手术外伤史',
 asia int(11)(8) COMMENT 'ASIA分级',
 yichuan varchar(10)(500) COMMENT '家族遗传病及传染病史',
 adl int(11)(8) COMMENT 'ADL评分',
 zizhunengli varchar(10)(500) COMMENT '自主能力',
 burnnstrom int(11)(8) COMMENT 'Burnnstrom分级',
 ashworth int(11)(8) COMMENT 'Ashworth评级',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_assess_info set uuid = UUID();
 alter table sys_assess_info add primary key(uuid); 
 alter table sys_assess_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_assess_info  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_assess_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_assess_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_assess_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_assess_info comment '一般资料'; 

-- 修改字段 注释 
 -- yisizhuangtai注释 
  alter table sys_assess_info  modify column yisizhuangtai VARCHAR(500) comment '意识状态'; 

 -- uuid注释 
  alter table sys_assess_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- fim注释 
  alter table sys_assess_info  modify column fim VARCHAR(500) comment 'FIM评分'; 

 -- guomin注释 
  alter table sys_assess_info  modify column guomin VARCHAR(500) comment '过敏药物或食物'; 

 -- base_uuid注释 
  alter table sys_assess_info  modify column base_uuid VARCHAR(500) comment '评估外键'; 

 -- daxiaobian注释 
  alter table sys_assess_info  modify column daxiaobian VARCHAR(500) comment '大小便'; 

 -- tizheng注释 
  alter table sys_assess_info  modify column tizheng VARCHAR(500) comment '生命体征平稳'; 

 -- waishang注释 
  alter table sys_assess_info  modify column waishang VARCHAR(500) comment '手术外伤史'; 

 -- asia注释 
  alter table sys_assess_info  modify column asia VARCHAR(500) comment 'ASIA分级'; 

 -- yichuan注释 
  alter table sys_assess_info  modify column yichuan VARCHAR(500) comment '家族遗传病及传染病史'; 

 -- adl注释 
  alter table sys_assess_info  modify column adl VARCHAR(500) comment 'ADL评分'; 

 -- zizhunengli注释 
  alter table sys_assess_info  modify column zizhunengli VARCHAR(500) comment '自主能力'; 

 -- burnnstrom注释 
  alter table sys_assess_info  modify column burnnstrom VARCHAR(500) comment 'Burnnstrom分级'; 

 -- ashworth注释 
  alter table sys_assess_info  modify column ashworth VARCHAR(500) comment 'Ashworth评级'; 


-- 生成索引命令 
 -- 评估外键索引
  alter table sys_assess_info add index index_UY6EtGlS55lEn5rS (base_uuid) ; 



