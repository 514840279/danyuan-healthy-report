package org.danyuan.application.healthy.assess.controller;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.assess.po.SysAssessBrunnstrom;
import org.danyuan.application.healthy.assess.service.SysAssessBrunnstromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysAssessBrunnstromController.java
 * @包名 org.danyuan.application.healthy.assess.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysAssessBrunnstrom")
public class SysAssessBrunnstromController extends BaseControllerImpl<SysAssessBrunnstrom> implements BaseController<SysAssessBrunnstrom> {
	
	@Autowired
	SysAssessBrunnstromService sysAssessBrunnstromService;
	
	@GetMapping("/detail/{uuid}")
	public ModelAndView name(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/assess/sysassessbrunnstromdetail");
		SysAssessBrunnstrom info = new SysAssessBrunnstrom();
		info.setAssessUuid(uuid);
		modelAndView.addObject("sysAssessBrunnstrom", sysAssessBrunnstromService.findAll(info));
		return modelAndView;
	}
	
}
