package org.danyuan.application.healthy.assess.service;

import java.util.List;
import java.util.UUID;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.assess.dao.SysAssessFimInfoDao;
import org.danyuan.application.healthy.assess.dao.SysAssessInfoDao;
import org.danyuan.application.healthy.assess.po.SysAssessFimInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @文件名 SysAssessFimInfoService.java
 * @包名 org.danyuan.application.healthy.assess.service
 * @描述 service层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Service
public class SysAssessFimInfoService extends BaseServiceImpl<SysAssessFimInfo> implements BaseService<SysAssessFimInfo> {
	@Autowired
	SysAssessFimInfoDao	sysAssessFimInfoDao;
	
	@Autowired
	SysAssessInfoDao	sysAssessInfo;
	
	@Override
	public void saveAll(List<SysAssessFimInfo> entities) {
		SysAssessFimInfo tsysAssessFimInfo = new SysAssessFimInfo();
		tsysAssessFimInfo.setAssessUuid(entities.get(0).getAssessUuid());
		sysAssessFimInfoDao.deleteAll(findAll(tsysAssessFimInfo));
		int totle = 0;
		for (SysAssessFimInfo sysAssessAdlInfo : entities) {
			if (sysAssessAdlInfo.getUuid() == null || "".equals(sysAssessAdlInfo.getUuid())) {
				sysAssessAdlInfo.setUuid(UUID.randomUUID().toString());
				sysAssessAdlInfo.setDeleteFlag(0);
				sysAssessAdlInfo.setCreateUser("system");
				sysAssessAdlInfo.setUpdateUser("system");
				
			}
			totle += sysAssessAdlInfo.getScore();
		}
		sysAssessFimInfoDao.saveAll(entities);
		sysAssessInfo.updateFim(totle, entities.get(0).getAssessUuid());
	}
}
