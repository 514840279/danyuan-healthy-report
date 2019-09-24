-- ================healthy.sys_assess_ashworth_info(Ashworth评级)配置开始======================= 
-- 菜单配置 
 INSERT INTO application.sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('4f99b47c87504561912e3b968575e070','0','Ashworth评级','fa fa-checked','1','/pages/healthy/assess/sysassessashworthinfo.html','Ashworth评级','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO application.sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '4f99b47c87504561912e3b968575e070', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================healthy.sys_assess_ashworth_info(Ashworth评级)配置结束======================= 

