package org.danyuan.application.healthy.assess.controller;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.assess.po.SysAssessAshworthInfo;
import org.danyuan.application.healthy.assess.service.SysAssessAshworthInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysAssessAshworthInfoController.java
 * @包名 org.danyuan.application.healthy.assess.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysAssessAshworthInfo")
public class SysAssessAshworthInfoController extends BaseControllerImpl<SysAssessAshworthInfo> implements BaseController<SysAssessAshworthInfo> {

	@Autowired
	SysAssessAshworthInfoService sysAssessAshworthInfoService;

		@GetMapping("/detail/{uuid}")
		public ModelAndView name(@PathVariable("uuid") String uuid) {
			ModelAndView modelAndView = new ModelAndView("healthy/assess/sysassessashworthinfodetail");
			SysAssessAshworthInfo info = new SysAssessAshworthInfo();
			info.setUuid(uuid);
			modelAndView.addObject("sysAssessAshworthInfo", sysAssessAshworthInfoService.findOne(info));
			return modelAndView;
		}

}
