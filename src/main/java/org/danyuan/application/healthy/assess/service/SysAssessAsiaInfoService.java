package org.danyuan.application.healthy.assess.service;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.assess.dao.SysAssessAsiaInfoDao;
import org.danyuan.application.healthy.assess.dao.SysAssessInfoDao;
import org.danyuan.application.healthy.assess.po.SysAssessAsiaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @文件名 SysAssessAsiaInfoService.java
 * @包名 org.danyuan.application.healthy.assess.service
 * @描述 service层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Service
public class SysAssessAsiaInfoService extends BaseServiceImpl<SysAssessAsiaInfo> implements BaseService<SysAssessAsiaInfo> {

	@Autowired
	SysAssessAsiaInfoDao	sysAssessAsiaInfoDao;
	
	@Autowired
	SysAssessInfoDao		sysAssessInfoDao;
	
	@Override
	public SysAssessAsiaInfo save(SysAssessAsiaInfo info) {
		sysAssessAsiaInfoDao.save(info);
//		sysAssessInfoDao.updateAsia(info.getJibie(), info.getAssessUuid());
		return info;
	}
}
