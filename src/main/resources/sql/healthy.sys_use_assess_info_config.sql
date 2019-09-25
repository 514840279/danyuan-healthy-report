-- ================sys_use_assess_info(辅具使用评估)配置开始======================= 
-- 菜单配置 
 INSERT INTO sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('72463e38dbd748f2afea4396b58b8eea','0','辅具使用评估','fa fa-checked','1','/pages/healthy/report/sysuseassessinfo.html','辅具使用评估','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '72463e38dbd748f2afea4396b58b8eea', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================sys_use_assess_info(辅具使用评估)配置结束======================= 

