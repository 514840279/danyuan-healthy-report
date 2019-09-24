package org.danyuan.application.healthy.assess.controller;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.assess.po.SysAssessInfo;
import org.danyuan.application.healthy.assess.service.SysAssessInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysAssessInfoController.java
 * @包名 org.danyuan.application.healthy.assess.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysAssessInfo")
public class SysAssessInfoController extends BaseControllerImpl<SysAssessInfo> implements BaseController<SysAssessInfo> {

	@Autowired
	SysAssessInfoService sysAssessInfoService;

		@GetMapping("/detail/{uuid}")
		public ModelAndView name(@PathVariable("uuid") String uuid) {
			ModelAndView modelAndView = new ModelAndView("healthy/assess/sysassessinfodetail");
			SysAssessInfo info = new SysAssessInfo();
			info.setUuid(uuid);
			modelAndView.addObject("sysAssessInfo", sysAssessInfoService.findOne(info));
			return modelAndView;
		}

}
