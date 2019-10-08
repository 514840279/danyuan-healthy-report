/**
 *
 */
package org.danyuan.application.healthy.upload.po;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @author wth
 */
@Entity
@Table(name = "sys_file_img_info")
@NamedQuery(name = "SysFileImgInfo.findAll", query = "SELECT s FROM SysFileImgInfo s")
public class SysFileImgInfo extends BaseEntity {

	// 评估外键
	@Column(name = "base_uuid")
	private String	baseUuid;

	// 文件名
	@Column(name = "file_name")
	private String	fileName;

	// 文件本地路径
	@Column(name = "file_local_path")
	private String	fileLocalPath;
	
	// 文件本地路径
	@Column(name = "file_size")
	private String	fileSize;
	
	/**
	 * @return the baseUuid
	 */
	public String getBaseUuid() {
		return baseUuid;
	}
	
	/**
	 * @param baseUuid
	 *            the baseUuid to set
	 */
	public void setBaseUuid(String baseUuid) {
		this.baseUuid = baseUuid;
	}
	
	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}
	
	/**
	 * @param fileName
	 *            the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	/**
	 * @return the fileLocalPath
	 */
	public String getFileLocalPath() {
		return fileLocalPath;
	}
	
	/**
	 * @param fileLocalPath
	 *            the fileLocalPath to set
	 */
	public void setFileLocalPath(String fileLocalPath) {
		this.fileLocalPath = fileLocalPath;
	}
	
	/**
	 * @return the fileSize
	 */
	public String getFileSize() {
		return fileSize;
	}
	
	/**
	 * @param fileSize
	 *            the fileSize to set
	 */
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
}
