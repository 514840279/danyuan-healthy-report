package org.danyuan.application.healthy.report.controller;

import java.util.UUID;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.report.po.SysHealthyBaseInfo;
import org.danyuan.application.healthy.report.service.SysHealthyBaseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysHealthyBaseInfoController.java
 * @包名 org.danyuan.application.healthy.report.controller
 * @描述 controller层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysHealthyBaseInfo")
public class SysHealthyBaseInfoController extends BaseControllerImpl<SysHealthyBaseInfo> implements BaseController<SysHealthyBaseInfo> {
	
	@Autowired
	SysHealthyBaseInfoService sysHealthyBaseInfoService;
	
	@GetMapping("/detail/{uuid}")
	public ModelAndView name(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/report/syshealthybaseinfodetail");
		SysHealthyBaseInfo info = new SysHealthyBaseInfo();
		info.setUuid(uuid);
		modelAndView.addObject("sysHealthyBaseInfo", sysHealthyBaseInfoService.findOne(info));
		return modelAndView;
	}
	
	@GetMapping("/demo/{uuid}")
	public ModelAndView demo(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/report/demo");
		modelAndView.addObject("sysHealthyBaseInfoUuid", uuid);
		return modelAndView;
	}
	
	@GetMapping("/demo2")
	public ModelAndView demo2() {
		ModelAndView modelAndView = new ModelAndView("healthy/report/demo");
		SysHealthyBaseInfo info = new SysHealthyBaseInfo();
		info.setUuid(UUID.randomUUID().toString());
		sysHealthyBaseInfoService.save(info);
		modelAndView.addObject("sysHealthyBaseInfoUuid", info.getUuid());
		return modelAndView;
	}
	
}
