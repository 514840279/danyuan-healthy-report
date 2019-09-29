package org.danyuan.application.healthy.assess.controller;

import java.util.UUID;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.assess.po.SysAssessRiskInfo;
import org.danyuan.application.healthy.assess.service.SysAssessRiskInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysAssessRiskInfoController.java
 * @包名 org.danyuan.application.healthy.assess.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysAssessRiskInfo")
public class SysAssessRiskInfoController extends BaseControllerImpl<SysAssessRiskInfo> implements BaseController<SysAssessRiskInfo> {
	
	@Autowired
	SysAssessRiskInfoService sysAssessRiskInfoService;
	
	@GetMapping("/detail/{uuid}")
	public ModelAndView name(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/assess/sysassessriskinfodetail");
		SysAssessRiskInfo info = new SysAssessRiskInfo();
		info.setBaseUuid(uuid);
		info = sysAssessRiskInfoService.findOne(info);
		if (info == null) {
			info = new SysAssessRiskInfo();
			info.setUuid(UUID.randomUUID().toString());
			info.setBaseUuid(uuid);
			info.setDeleteFlag(0);
			info.setCreateUser("system");
			info.setUpdateUser("system");
			sysAssessRiskInfoService.save(info);
		}
		modelAndView.addObject("sysAssessRiskInfo", info);
		return modelAndView;
	}
	
}
