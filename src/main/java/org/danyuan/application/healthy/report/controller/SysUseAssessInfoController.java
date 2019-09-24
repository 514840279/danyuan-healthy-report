package org.danyuan.application.healthy.report.controller;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.report.po.SysUseAssessInfo;
import org.danyuan.application.healthy.report.service.SysUseAssessInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysUseAssessInfoController.java
 * @包名 org.danyuan.application.healthy.report.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysUseAssessInfo")
public class SysUseAssessInfoController extends BaseControllerImpl<SysUseAssessInfo> implements BaseController<SysUseAssessInfo> {

	@Autowired
	SysUseAssessInfoService sysUseAssessInfoService;

		@GetMapping("/detail/{uuid}")
		public ModelAndView name(@PathVariable("uuid") String uuid) {
			ModelAndView modelAndView = new ModelAndView("healthy/report/sysuseassessinfodetail");
			SysUseAssessInfo info = new SysUseAssessInfo();
			info.setUuid(uuid);
			modelAndView.addObject("sysUseAssessInfo", sysUseAssessInfoService.findOne(info));
			return modelAndView;
		}

}
