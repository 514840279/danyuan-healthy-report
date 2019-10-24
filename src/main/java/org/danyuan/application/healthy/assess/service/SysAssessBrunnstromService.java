package org.danyuan.application.healthy.assess.service;

import java.util.List;
import java.util.UUID;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.assess.dao.SysAssessBrunnstromDao;
import org.danyuan.application.healthy.assess.dao.SysAssessInfoDao;
import org.danyuan.application.healthy.assess.po.SysAssessBrunnstrom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @文件名 SysAssessBrunnstromService.java
 * @包名 org.danyuan.application.healthy.assess.service
 * @描述 service层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Service
public class SysAssessBrunnstromService extends BaseServiceImpl<SysAssessBrunnstrom> implements BaseService<SysAssessBrunnstrom> {

	@Autowired
	SysAssessBrunnstromDao	sysAssessBrunnstromDao;
	
	@Autowired
	SysAssessInfoDao		sysAssessInfo;

	@Override
	public void saveAll(List<SysAssessBrunnstrom> entities) {
		SysAssessBrunnstrom tsysAssessBrunnstrom = new SysAssessBrunnstrom();
		tsysAssessBrunnstrom.setAssessUuid(entities.get(0).getAssessUuid());
		sysAssessBrunnstromDao.deleteAll(findAll(tsysAssessBrunnstrom));
		
		String totle = "";
		for (SysAssessBrunnstrom sysAssessBrunnstrom : entities) {
			if (sysAssessBrunnstrom.getUuid() == null || "".equals(sysAssessBrunnstrom.getUuid())) {
				sysAssessBrunnstrom.setUuid(UUID.randomUUID().toString());
				sysAssessBrunnstrom.setDeleteFlag(0);
				sysAssessBrunnstrom.setCreateUser("system");
				sysAssessBrunnstrom.setUpdateUser("system");
			}
			totle += sysAssessBrunnstrom.getName() + ":" + sysAssessBrunnstrom.getScore() + ";";
		}
		sysAssessBrunnstromDao.saveAll(entities);
//		sysAssessInfo.updateBrunnstrom(totle, entities.get(0).getAssessUuid());
	}
}
