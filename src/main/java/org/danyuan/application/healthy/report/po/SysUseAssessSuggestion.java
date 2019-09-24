package org.danyuan.application.healthy.report.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysUseAssessSuggestion.java
 * @包名 org.danyuan.application.healthy.report.po
 * @描述 sys_use_assess_suggestion的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_use_assess_suggestion")
@NamedQuery(name = "SysUseAssessSuggestion.findAll", query = "SELECT s FROM SysUseAssessSuggestion s")
public class SysUseAssessSuggestion extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;


	// 备注
	@Column(name = "comments")
	private  String 	comments;

	// 评审外键
	@Column(name = "base_uuid")
	private  String 	baseUuid;

	// 辅具名称
	@Column(name = "assistive_devices_name")
	private  String 	assistiveDevicesName;

	/**  
	*  构造方法： 
	*  描    述： 默认构造函数  
	*  参    数： 
	*  作    者 ： test  
	*  @throws  
	*/
	public SysUseAssessSuggestion() {
		super();
	}


	/**
	 * 方法名 ： getComments
	 * 功 能 ： 返回变量 comments 备注 的值
	 *
	 * @return: String 
	 */
	public  String  getComments() {
		return comments;
	}

	/**
	 * 方法名 ： setComments
	 * 功 能 ： 设置变量 comments 备注 的值
	 */
	public void setComments( String  comments) {
		this.comments = comments;
	}

	/**
	 * 方法名 ： getBaseUuid
	 * 功 能 ： 返回变量 baseUuid 评审外键 的值
	 *
	 * @return: String 
	 */
	public  String  getBaseUuid() {
		return baseUuid;
	}

	/**
	 * 方法名 ： setBaseUuid
	 * 功 能 ： 设置变量 baseUuid 评审外键 的值
	 */
	public void setBaseUuid( String  baseUuid) {
		this.baseUuid = baseUuid;
	}

	/**
	 * 方法名 ： getAssistiveDevicesName
	 * 功 能 ： 返回变量 assistiveDevicesName 辅具名称 的值
	 *
	 * @return: String 
	 */
	public  String  getAssistiveDevicesName() {
		return assistiveDevicesName;
	}

	/**
	 * 方法名 ： setAssistiveDevicesName
	 * 功 能 ： 设置变量 assistiveDevicesName 辅具名称 的值
	 */
	public void setAssistiveDevicesName( String  assistiveDevicesName) {
		this.assistiveDevicesName = assistiveDevicesName;
	}


}
