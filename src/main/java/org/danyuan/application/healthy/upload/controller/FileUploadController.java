/**
 *
 */
package org.danyuan.application.healthy.upload.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.danyuan.application.common.base.BaseResult;
import org.danyuan.application.common.base.ResultUtil;
import org.danyuan.application.healthy.upload.po.SysFileImgInfo;
import org.danyuan.application.healthy.upload.service.SysFileImgInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @author wth
 */
@RestController
@RequestMapping("/upload")
public class FileUploadController {

	@Autowired
	SysFileImgInfoService sysFileImgInfoService;
	
	@RequestMapping(path = "/uploadImg")
	public BaseResult<List<SysFileImgInfo>> uploadResume(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		String username = request.getParameter("username");
		String baseUuid = request.getParameter("baseUuid");
		// 文件保存
		request.setCharacterEncoding("UTF-8");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("file");
		for (MultipartFile multipartFile : files) {
			String filename = multipartFile.getOriginalFilename();
			InputStream inputStream = null;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			
			String path = System.getProperty("user.dir") + "/fileupload/" + simpleDateFormat.format(new Date());
			
			File file = new File(path);
			try {
				inputStream = multipartFile.getInputStream();
				
				if (!file.exists()) {
					file.mkdirs();
				}
				path = path + "/" + filename;
				FileOutputStream fos = new FileOutputStream(path);

				byte[] b = new byte[1024];
				while ((inputStream.read(b)) != -1) {
					fos.write(b);
				}
				fos.close();
				inputStream.close();
				
				//

				SysFileImgInfo sysFileImgInfo = new SysFileImgInfo();
				sysFileImgInfo.setFileLocalPath("/" + simpleDateFormat.format(new Date()) + "/" + URLEncoder.encode(filename, "utf-8"));
				if (sysFileImgInfoService.findAll(sysFileImgInfo).isEmpty()) {
					sysFileImgInfo.setBaseUuid(baseUuid);
					sysFileImgInfo.setFileName(filename);
					sysFileImgInfo.setCreateUser(username);
					sysFileImgInfo.setDeleteFlag(0);
					sysFileImgInfo.setFileSize(Long.toString(multipartFile.getSize()));
					sysFileImgInfoService.save(sysFileImgInfo);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		SysFileImgInfo sysFileImgInfo = new SysFileImgInfo();
		sysFileImgInfo.setBaseUuid(baseUuid);

		return ResultUtil.success(sysFileImgInfoService.findAll(sysFileImgInfo));
	}
}
