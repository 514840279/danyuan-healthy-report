-- 表创建 表创建语句并不完全正确，需要确认后在执行 
create table sys_assess_risk_info(
 uuid varchar(36) NOT NULL COMMENT '主键' primary key,
 shenjing varchar(10)(500) COMMENT '神经系统病史',
 yongguokangneng varchar(10)(500) COMMENT '是否服用抗凝药物',
 zuzhiji varchar(10)(500) COMMENT '服用β受体阻滞剂',
 xueguanbingshi varchar(10)(500) COMMENT '心脑血管病史',
 uuid varchar(36)(500) COMMENT '主键',
 xueshuan varchar(10)(500) COMMENT '深静脉血栓/肺栓塞风险',
 huxi varchar(10)(500) COMMENT '呼吸系统病史',
 xiaohua varchar(10)(500) COMMENT '消化系统病史',
 base_uuid varchar(36)(500) COMMENT '评估外键',
 qita varchar(10)(500) COMMENT '其他',
 create_time timestamp NOT NULL default CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
 update_time timestamp NOT NULL default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT  '更新时间',
 create_user varchar(50) NOT NULL default 'system' COMMENT '记录人',
 update_user varchar(50) NOT NULL default 'system' COMMENT '更新人',
 delete_flag tinyint NOT NULL default 0 COMMENT '应用标识',
 discription varchar(200) COMMENT '数据描述',
);
-- 修改字段非空 
 update sys_assess_risk_info set uuid = UUID();
 alter table sys_assess_risk_info add primary key(uuid); 
 alter table sys_assess_risk_info  MODIFY `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL;
 alter table sys_assess_risk_info  MODIFY `update_time` TIMESTAMP ON UPDATE CURRENT_TIMESTAMP   NOT NULL;
 alter table sys_assess_risk_info  MODIFY `create_user` varchar(50)  NOT NULL;
 alter table sys_assess_risk_info  MODIFY `update_user` varchar(50)  NOT NULL;
 alter table sys_assess_risk_info  MODIFY `delete_flag` int  NOT NULL;

-- 表注释 
 alter table sys_assess_risk_info comment '风险因素评估'; 

-- 修改字段 注释 
 -- shenjing注释 
  alter table sys_assess_risk_info  modify column shenjing VARCHAR(500) comment '神经系统病史'; 

 -- yongguokangneng注释 
  alter table sys_assess_risk_info  modify column yongguokangneng VARCHAR(500) comment '是否服用抗凝药物'; 

 -- zuzhiji注释 
  alter table sys_assess_risk_info  modify column zuzhiji VARCHAR(500) comment '服用β受体阻滞剂'; 

 -- xueguanbingshi注释 
  alter table sys_assess_risk_info  modify column xueguanbingshi VARCHAR(500) comment '心脑血管病史'; 

 -- uuid注释 
  alter table sys_assess_risk_info  modify column uuid VARCHAR(500) comment '主键'; 

 -- xueshuan注释 
  alter table sys_assess_risk_info  modify column xueshuan VARCHAR(500) comment '深静脉血栓/肺栓塞风险'; 

 -- huxi注释 
  alter table sys_assess_risk_info  modify column huxi VARCHAR(500) comment '呼吸系统病史'; 

 -- xiaohua注释 
  alter table sys_assess_risk_info  modify column xiaohua VARCHAR(500) comment '消化系统病史'; 

 -- base_uuid注释 
  alter table sys_assess_risk_info  modify column base_uuid VARCHAR(500) comment '评估外键'; 

 -- qita注释 
  alter table sys_assess_risk_info  modify column qita VARCHAR(500) comment '其他'; 


-- 生成索引命令 
 -- 评估外键索引
  alter table sys_assess_risk_info add index index_ftUAnYlMYY1dKfxb (base_uuid) ; 



