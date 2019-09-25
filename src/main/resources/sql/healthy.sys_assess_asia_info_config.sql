-- ================sys_assess_asia_info(ASIA分级)配置开始======================= 
-- 菜单配置 
 INSERT INTO sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('60abbc3494c8493a93b82835c46012f4','0','ASIA分级','fa fa-checked','1','/pages/healthy/assess/sysassessasiainfo.html','ASIA分级','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '60abbc3494c8493a93b82835c46012f4', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================sys_assess_asia_info(ASIA分级)配置结束======================= 

