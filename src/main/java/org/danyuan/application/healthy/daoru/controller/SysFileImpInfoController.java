package org.danyuan.application.healthy.daoru.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.healthy.daoru.po.SysFileImpInfo;
import org.danyuan.application.healthy.daoru.service.SysFileImpInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * @文件名 SysFileImpInfoController.java
 * @包名 org.danyuan.application.healthy.daoru.controller
 * @描述 controller层
 * @时间 2019年10月28日 10:53:12
 * @author test
 * @版本 V1.0
 */
@RestController
@RequestMapping("/sysFileImpInfo")
public class SysFileImpInfoController extends BaseControllerImpl<SysFileImpInfo> implements BaseController<SysFileImpInfo> {

	@Autowired
	SysFileImpInfoService sysFileImpInfoService;

	@GetMapping("/detail/{uuid}")
	public ModelAndView name(@PathVariable("uuid") String uuid) {
		ModelAndView modelAndView = new ModelAndView("healthy/daoru/sysfileimpinfodetail");
		SysFileImpInfo info = new SysFileImpInfo();
		info.setUuid(uuid);
		modelAndView.addObject("sysFileImpInfo", sysFileImpInfoService.findOne(info));
		return modelAndView;
	}
	
	@RequestMapping(path = "/upload")
	public int upload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String baseUuid = request.getParameter("baseUuid");
		sysFileImpInfoService.upload(request, username, baseUuid);
		SysFileImpInfo sysFileImpInfo = new SysFileImpInfo();

		return 1;
	}
}
