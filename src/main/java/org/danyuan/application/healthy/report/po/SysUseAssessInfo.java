package org.danyuan.application.healthy.report.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.danyuan.application.common.base.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @文件名 SysUseAssessInfo.java
 * @包名 org.danyuan.application.healthy.report.po
 * @描述 sys_use_assess_info的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_use_assess_info")
@NamedQuery(name = "SysUseAssessInfo.findAll", query = "SELECT s FROM SysUseAssessInfo s")
public class SysUseAssessInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;

	// 已发放辅具名称
	@Column(name = "assistive_devices_name")
	private String				assistiveDevicesName;

	// 评估外键
	@Column(name = "base_uuid")
	private String				baseUuid;

	// 发放时间
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(style = "yyyy-MM-dd")
	@Column(name = "grant_time")
	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
	private Date				grantTime;

	// 现使用状况
	@Column(name = "use_state")
	private String				useState;

	/**
	 * 构造方法：
	 * 描 述： 默认构造函数
	 * 参 数：
	 * 作 者 ： test
	 * @throws
	 */
	public SysUseAssessInfo() {
		super();
	}

	/**
	 * 方法名 ： getAssistiveDevicesName
	 * 功 能 ： 返回变量 assistiveDevicesName 已发放辅具名称 的值
	 *
	 * @return: String
	 */
	public String getAssistiveDevicesName() {
		return assistiveDevicesName;
	}

	/**
	 * 方法名 ： setAssistiveDevicesName
	 * 功 能 ： 设置变量 assistiveDevicesName 已发放辅具名称 的值
	 */
	public void setAssistiveDevicesName(String assistiveDevicesName) {
		this.assistiveDevicesName = assistiveDevicesName;
	}

	/**
	 * 方法名 ： getBaseUuid
	 * 功 能 ： 返回变量 baseUuid 评估外键 的值
	 *
	 * @return: String
	 */
	public String getBaseUuid() {
		return baseUuid;
	}

	/**
	 * 方法名 ： setBaseUuid
	 * 功 能 ： 设置变量 baseUuid 评估外键 的值
	 */
	public void setBaseUuid(String baseUuid) {
		this.baseUuid = baseUuid;
	}

	/**
	 * 方法名 ： getGrantTime
	 * 功 能 ： 返回变量 grantTime 发放时间 的值
	 *
	 * @return: String
	 */
	public Date getGrantTime() {
		return grantTime;
	}

	/**
	 * 方法名 ： setGrantTime
	 * 功 能 ： 设置变量 grantTime 发放时间 的值
	 */
	public void setGrantTime(Date grantTime) {
		this.grantTime = grantTime;
	}

	/**
	 * 方法名 ： getUseState
	 * 功 能 ： 返回变量 useState 现使用状况 的值
	 *
	 * @return: String
	 */
	public String getUseState() {
		return useState;
	}

	/**
	 * 方法名 ： setUseState
	 * 功 能 ： 设置变量 useState 现使用状况 的值
	 */
	public void setUseState(String useState) {
		this.useState = useState;
	}

}
