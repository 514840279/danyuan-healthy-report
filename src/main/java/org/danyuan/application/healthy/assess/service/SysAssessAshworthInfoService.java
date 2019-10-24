package org.danyuan.application.healthy.assess.service;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.assess.dao.SysAssessAshworthInfoDao;
import org.danyuan.application.healthy.assess.dao.SysAssessInfoDao;
import org.danyuan.application.healthy.assess.po.SysAssessAshworthInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @文件名 SysAssessAshworthInfoService.java
 * @包名 org.danyuan.application.healthy.assess.service
 * @描述 service层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Service
public class SysAssessAshworthInfoService extends BaseServiceImpl<SysAssessAshworthInfo> implements BaseService<SysAssessAshworthInfo> {

	@Autowired
	SysAssessAshworthInfoDao	sysAssessAshworthInfoDao;
	
	@Autowired
	SysAssessInfoDao			sysAssessInfoDao;
	
	@Override
	public SysAssessAshworthInfo save(SysAssessAshworthInfo info) {
		sysAssessAshworthInfoDao.save(info);
//		sysAssessInfoDao.updateAshworth(info.getJibie(), info.getAssessUuid());
		return info;
	}
	
}
