package org.danyuan.application.healthy.daoru.service;

import java.util.List;

import org.danyuan.application.healthy.daoru.dao.SysFileImpInfoDao;
import org.danyuan.application.healthy.daoru.po.SysFileImpInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DaoruRunner implements ApplicationRunner {
	@Autowired
	DaoruAsyncService	daoruAsyncService;
	@Autowired
	SysFileImpInfoDao	sysFileImpInfoDao;
	
	@Override
	public void run(ApplicationArguments var1) throws Exception {
		List<SysFileImpInfo> daList = sysFileImpInfoDao.findAllByImpType();
		if (daList != null && daList.size() > 0) {
			daoruAsyncService.execAsync();
		}

	}
}