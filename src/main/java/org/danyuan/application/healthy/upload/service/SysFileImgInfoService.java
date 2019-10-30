/**
 *
 */
package org.danyuan.application.healthy.upload.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.upload.dao.SysFileImgInfoDao;
import org.danyuan.application.healthy.upload.po.SysFileImgInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;

/**
 * @author wth
 */
@Service
public class SysFileImgInfoService extends BaseServiceImpl<SysFileImgInfo> implements BaseService<SysFileImgInfo> {

	@Autowired
	SysFileImgInfoDao sysFileImgInfoDao;

	/**
	 * @throws IOException
	 * @方法名 extracted
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param request
	 * @参数 @param username
	 * @参数 @param baseUuid
	 * @参数 @throws UnsupportedEncodingException
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	public void uploadImg(HttpServletRequest request, String username, String baseUuid) throws IOException {
		// 文件保存
		request.setCharacterEncoding("UTF-8");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("file");
		for (MultipartFile multipartFile : files) {
			String filename = multipartFile.getOriginalFilename().replace("(", "").replace(" ", "").replace(")", "");
			InputStream inputStream = null;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");
			
			String path = System.getProperty("user.dir") + "/fileupload/" + simpleDateFormat.format(new Date());
			
			File file = new File(path);
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
			String ext = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
			
			String[] imgtype = { "jpg", "webp", "bmp", "pcx", "tif", "gif", "jpeg", "tag", "exif", "fpx", "svg", "psd", "cdr", "pcd", "dxf", "ufo", "eps", "ai", "png", "hdri", "raw", "wmf", "flic", "emf", "ico" };
			if (Arrays.asList(imgtype).contains(ext)) {
				// 图片压缩
				Thumbnails.of(path).scale(1f).outputQuality(0.5f).toFile(path.replace(".png", ".small.jpg"));
			}

			// 保存信息

			SysFileImgInfo sysFileImgInfo = new SysFileImgInfo();
			sysFileImgInfo.setFileLocalPath("/" + simpleDateFormat.format(new Date()) + "/" + URLEncoder.encode(filename, "utf-8"));
			if (findAll(sysFileImgInfo).isEmpty()) {
				sysFileImgInfo.setBaseUuid(baseUuid);
				sysFileImgInfo.setFileName(filename);
				sysFileImgInfo.setCreateUser(username);
				sysFileImgInfo.setFileNameSmall("/" + simpleDateFormat.format(new Date()) + "/" + URLEncoder.encode(filename.replace(".png", ".small.jpg"), "utf-8"));
				sysFileImgInfo.setDeleteFlag(0);
				sysFileImgInfo.setFileSize(Long.toString(multipartFile.getSize()));
				sysFileImgInfo.setFileExt(ext);
				save(sysFileImgInfo);
			}
			
		}
	}

}
