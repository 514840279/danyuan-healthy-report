package org.danyuan.application.common.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 文件名 ： LogsClearScheduled.java
 * 包 名 ： com.shumeng.application.common.config
 * 描 述 ： TODO(用一句话描述该文件做什么)
 * 机能名称：
 * 技能ID ：
 * 作 者 ： Administrator
 * 时 间 ： 2018年4月23日 下午2:45:13
 * 版 本 ： V1.0
 */
@Component
public class LogsClearScheduled {
	private static final Logger	logger	= LoggerFactory.getLogger(LogsClearScheduled.class);
	@Autowired
	JdbcTemplate				jdbcTemplate;

	@Scheduled(cron = "1 0 0 * * *")
	public void delete() {
		logger.info("delete", LogsClearScheduled.class);
		String sql = "DELETE FROM sys_comn_logs WHERE TIMESTAMPDIFF(DAY,create_time,NOW())>30";
		jdbcTemplate.update(sql);

	}

}
