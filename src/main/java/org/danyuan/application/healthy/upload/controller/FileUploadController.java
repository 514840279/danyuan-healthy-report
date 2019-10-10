/**
 *
 */
package org.danyuan.application.healthy.upload.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.danyuan.application.common.base.BaseController;
import org.danyuan.application.common.base.BaseControllerImpl;
import org.danyuan.application.common.base.BaseResult;
import org.danyuan.application.common.base.ResultUtil;
import org.danyuan.application.healthy.upload.po.SysFileImgInfo;
import org.danyuan.application.healthy.upload.service.SysFileImgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author wth
 */
@RestController
@RequestMapping("/upload")
public class FileUploadController extends BaseControllerImpl<SysFileImgInfo> implements BaseController<SysFileImgInfo> {

	@Autowired
	SysFileImgInfoService sysFileImgInfoService;
	
	@RequestMapping(path = "/uploadImg")
	public BaseResult<List<SysFileImgInfo>> uploadImg(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String username = request.getParameter("username");
		String baseUuid = request.getParameter("baseUuid");
		try {
			sysFileImgInfoService.uploadImg(request, username, baseUuid);
		} catch (IOException e) {
			e.printStackTrace();
		}
		SysFileImgInfo sysFileImgInfo = new SysFileImgInfo();
		sysFileImgInfo.setBaseUuid(baseUuid);

		return ResultUtil.success(sysFileImgInfoService.findAll(sysFileImgInfo));
	}

}
