-- ================healthy.sys_assess_risk_info(风险因素评估)配置开始======================= 
-- 菜单配置 
 INSERT INTO application.sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('60a2ca0afb404e5fabd3bd081dde5ec2','0','风险因素评估','fa fa-checked','1','/pages/healthy/assess/sysassessriskinfo.html','风险因素评估','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO application.sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '60a2ca0afb404e5fabd3bd081dde5ec2', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================healthy.sys_assess_risk_info(风险因素评估)配置结束======================= 

