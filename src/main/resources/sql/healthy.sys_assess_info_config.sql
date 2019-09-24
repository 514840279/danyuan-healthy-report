-- ================healthy.sys_assess_info(一般资料)配置开始======================= 
-- 菜单配置 
 INSERT INTO application.sys_menu_info (`uuid`,`parents_id`,`name`,`icon`,`sort`,`uri`,`discription`,`update_user`,`update_time`, `create_user`, `create_time`, `delete_flag`, `home_page`) VALUES ('14ffad3c9e4749d69f1d4b310ea8a80f','0','一般资料','fa fa-checked','1','/pages/healthy/assess/sysassessinfo.html','一般资料','system',CURRENT_TIMESTAMP,'system',CURRENT_TIMESTAMP,0,0); 
 INSERT INTO application.sys_roles_jurisdiction_info(checked, create_time, create_user, delete_flag, discription, menu_id, role_id) VALUES (1,CURRENT_TIMESTAMP, 'system', 0, '生成语句', '14ffad3c9e4749d69f1d4b310ea8a80f', 'BEB0D81B918DD968D24D6F95AC15A753'); 

-- ================healthy.sys_assess_info(一般资料)配置结束======================= 

