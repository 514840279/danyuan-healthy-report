package org.danyuan.application.healthy.assess.controller;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.assess.po.SysAssessAdlInfo;
import org.danyuan.application.healthy.assess.service.SysAssessAdlInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysAssessAdlInfoController.java
 * @包名 org.danyuan.application.healthy.assess.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysAssessAdlInfo")
public class SysAssessAdlInfoController extends BaseControllerImpl<SysAssessAdlInfo> implements BaseController<SysAssessAdlInfo> {
	
	@Autowired
	SysAssessAdlInfoService sysAssessAdlInfoService;
	
	@GetMapping("/detail/{uuid}")
	public ModelAndView name(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/assess/sysassessadlinfodetail");
		SysAssessAdlInfo info = new SysAssessAdlInfo();
		info.setAssessUuid(uuid);
		modelAndView.addObject("sysAssessAdlInfo", sysAssessAdlInfoService.findAll(info));
		return modelAndView;
	}
	
}
