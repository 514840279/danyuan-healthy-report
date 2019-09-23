# danyuan-health-report

## 系统采用技术或开源框架：

1. 前端框架：adminLTE-2.3.11
2. 前端技术：bootstrap-3.x,bootstrap-table,juqery-2.2,ajax,ztree,
3. 后端技术：spring-boot-2.x,security,jpa
4. 数据库: mysql-5+
5. 其他工具：maven-3.3+,sts,navicat,nexus,

## 项目部署配置:

1. 系统安装jdk1.8，mysql8，
2. 新建数据库:healthy
3. 导入数据库脚本 sql/All.sql
4. 修改项目配置：src/main/resources/application.yml
	1. 修改数据库链接地址数据库用户名密码 
	2. 修改 server.port=80 # 项目端口号
5. 执行 java -jar danyuan-healthy-report.jar
8. 访问http://localhost
9. 输入用户名、密码 healthy/healthy



## 演示地址 
http://www.danyuan.wang/#

