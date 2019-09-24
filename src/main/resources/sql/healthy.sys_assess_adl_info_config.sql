-- ================healthy.sys_assess_adl_info(ADL评分)配置开始======================= 
-- 菜单配置 
 INSERT INTO application.sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('77af933a042447bf8d8795fd77d2f1b4','0','ADL评分','fa fa-checked','1','/pages/healthy/assess/sysassessadlinfo.html','ADL评分','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO application.sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '77af933a042447bf8d8795fd77d2f1b4', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================healthy.sys_assess_adl_info(ADL评分)配置结束======================= 

