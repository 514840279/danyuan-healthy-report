package org.danyuan.application.healthy.daoru.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.daoru.po.SysFileImpInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * @文件名 SysFileImpInfoService.java
 * @包名 org.danyuan.application.healthy.daoru.service
 * @描述 service层
 * @时间 2019年10月28日 10:53:12
 * @author test
 * @版本 V1.0
 */
@Service
public class SysFileImpInfoService extends BaseServiceImpl<SysFileImpInfo> implements BaseService<SysFileImpInfo> {

	@Autowired
	DaoruAsyncService daoruAsyncService;

	/**
	 * @throws IOException
	 * @方法名 upload
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param request
	 * @参数 @param username
	 * @参数 @param baseUuid
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	public void upload(HttpServletRequest request, String username, String baseUuid) throws IOException {
		// 文件保存
		request.setCharacterEncoding("UTF-8");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("file");
		for (MultipartFile multipartFile : files) {
			String filename = multipartFile.getOriginalFilename();
			// .replace("(", "").replace(" ", "").replace(")", "");
			InputStream inputStream = null;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

			String path = System.getProperty("user.dir") + "/fileupload/" + simpleDateFormat.format(new Date());

			File file = new File(path);
			inputStream = multipartFile.getInputStream();
			// 获取excel文件的io流
			// 根据文件后缀名不同(xls和xlsx)获得不同的Workbook实现类对象
			Workbook workbook = null;
			if (filename.endsWith("xls")) {
				// xls
				workbook = new HSSFWorkbook(inputStream);
			} else if (filename.endsWith("xlsx")) {
				// xlsx
				workbook = new XSSFWorkbook(inputStream);
			}

			if (!file.exists()) {
				file.mkdirs();
			}
			String newFileNameString = UUID.randomUUID().toString().replace("-", "") + ".xlsx";
			path = path + "/" + newFileNameString;

			FileOutputStream fos = new FileOutputStream(path);
			workbook.write(fos);
//			byte[] b = new byte[1024];
//			while ((inputStream.read(b)) != -1) {
//				fos.write(b);
//			}
			fos.close();
			inputStream.close();

			// 保存信息
			SysFileImpInfo sysFileImpInfo = new SysFileImpInfo();
			sysFileImpInfo.setFilePath("/" + simpleDateFormat.format(new Date()) + "/" + URLEncoder.encode(newFileNameString, "utf-8"));
			sysFileImpInfo.setFileName(filename);
			sysFileImpInfo.setCreateUser(username);
			sysFileImpInfo.setUpdateUser(username);
			sysFileImpInfo.setDeleteFlag(0);
			sysFileImpInfo.setFileSize(multipartFile.getSize());
			sysFileImpInfo.setImpType(0);
			save(sysFileImpInfo);
			
			// 执行异步倒入数据
			daoruAsyncService.execAsync();
		}
		
	}

}
