package org.danyuan.application.healthy.daoru.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysFileImpInfo.java
 * @包名 org.danyuan.application.healthy.daoru.po
 * @描述 sys_file_imp_info的实体类
 * @时间 2019年10月28日 10:53:12
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_file_imp_info")
@NamedQuery(name = "SysFileImpInfo.findAll", query = "SELECT s FROM SysFileImpInfo s")
public class SysFileImpInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;

	// 导入标记
	@Column(name = "imp_type", columnDefinition = " COMMENT '导入标记'")
	private Integer				impType;

	// 文件名称
	@Column(name = "file_name", columnDefinition = " COMMENT '文件名称'")
	private String				fileName;

	// 文件大小
	@Column(name = "file_size", columnDefinition = " COMMENT '文件大小'")
	private Long				fileSize;

	// 文件路径
	@Column(name = "file_path", columnDefinition = " COMMENT '文件路径'")
	private String				filePath;

	/**
	 * 构造方法：
	 * 描 述： 默认构造函数
	 * 参 数：
	 * 作 者 ： test
	 * @throws
	 */
	public SysFileImpInfo() {
		super();
	}

	/**
	 * 方法名 ： getImpType
	 * 功 能 ： 返回变量 impType 导入标记 的值
	 *
	 * @return: String
	 */
	public Integer getImpType() {
		return impType;
	}

	/**
	 * 方法名 ： setImpType
	 * 功 能 ： 设置变量 impType 导入标记 的值
	 */
	public void setImpType(Integer impType) {
		this.impType = impType;
	}

	/**
	 * 方法名 ： getFileName
	 * 功 能 ： 返回变量 fileName 文件名称 的值
	 *
	 * @return: String
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * 方法名 ： setFileName
	 * 功 能 ： 设置变量 fileName 文件名称 的值
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * 方法名 ： getFileSize
	 * 功 能 ： 返回变量 fileSize 文件大小 的值
	 *
	 * @return: String
	 */
	public Long getFileSize() {
		return fileSize;
	}

	/**
	 * 方法名 ： setFileSize
	 * 功 能 ： 设置变量 fileSize 文件大小 的值
	 */
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	/**
	 * 方法名 ： getFilePath
	 * 功 能 ： 返回变量 filePath 文件路径 的值
	 *
	 * @return: String
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * 方法名 ： setFilePath
	 * 功 能 ： 设置变量 filePath 文件路径 的值
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
