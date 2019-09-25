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
 * @文件名 SysHealthyBaseInfo.java
 * @包名 org.danyuan.application.healthy.report.po
 * @描述 sys_healthy_base_info的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_healthy_base_info")
@NamedQuery(name = "SysHealthyBaseInfo.findAll", query = "SELECT s FROM SysHealthyBaseInfo s")
public class SysHealthyBaseInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;
	
	// 联系人
	@Column(name = "contact_name")
	private String				contactName;
	
	// 残疾证号
	@Column(name = "disable_card")
	private String				disableCard;
	
	// 肢体残疾
	@Column(name = "disable_type_name")
	private String				disableTypeName;
	
	// 环境评估
	@Column(name = "path_assess")
	private String				pathAssess;
	
	// 身体功能评估
	@Column(name = "body_assess")
	private String				bodyAssess;
	
	// 主评人签字
	@Column(name = "main_assess_person")
	private String				mainAssessPerson;
	
	// 性别
	@Column(name = "gender")
	private String				gender;
	
	// 残疾类别
	@Column(name = "disable_type")
	private String				disableType;
	
	// 家庭地址
	@Column(name = "home_address")
	private String				homeAddress;
	
	// 联系电话
	@Column(name = "contact_telphone")
	private String				contactTelphone;
	
	// 姓名
	@Column(name = "name")
	private String				name;
	
	// 专职委员签字
	@Column(name = "full_time_member")
	private String				fullTimeMember;
	
	// 评估时间
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(style = "yyyy-MM-dd") // json格式化
	@JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd") // 调用时格式化
	@Column(name = "assess_time")
	private Date				assessTime;
	
	// 身份证
	@Column(name = "idcard")
	private String				idcard;
	
	// 副评人签字
	@Column(name = "second_assess_person")
	private String				secondAssessPerson;
	
	/**
	 * 构造方法：
	 * 描 述： 默认构造函数
	 * 参 数：
	 * 作 者 ： test
	 * @throws
	 */
	public SysHealthyBaseInfo() {
		super();
	}
	
	/**
	 * 方法名 ： getContactName
	 * 功 能 ： 返回变量 contactName 联系人 的值
	 *
	 * @return: String
	 */
	public String getContactName() {
		return contactName;
	}
	
	/**
	 * 方法名 ： setContactName
	 * 功 能 ： 设置变量 contactName 联系人 的值
	 */
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	
	/**
	 * 方法名 ： getDisableCard
	 * 功 能 ： 返回变量 disableCard 残疾证号 的值
	 *
	 * @return: String
	 */
	public String getDisableCard() {
		return disableCard;
	}
	
	/**
	 * 方法名 ： setDisableCard
	 * 功 能 ： 设置变量 disableCard 残疾证号 的值
	 */
	public void setDisableCard(String disableCard) {
		this.disableCard = disableCard;
	}
	
	/**
	 * 方法名 ： getDisableTypeName
	 * 功 能 ： 返回变量 disableTypeName 肢体残疾 的值
	 *
	 * @return: String
	 */
	public String getDisableTypeName() {
		return disableTypeName;
	}
	
	/**
	 * 方法名 ： setDisableTypeName
	 * 功 能 ： 设置变量 disableTypeName 肢体残疾 的值
	 */
	public void setDisableTypeName(String disableTypeName) {
		this.disableTypeName = disableTypeName;
	}
	
	/**
	 * 方法名 ： getPathAssess
	 * 功 能 ： 返回变量 pathAssess 环境评估 的值
	 *
	 * @return: String
	 */
	public String getPathAssess() {
		return pathAssess;
	}
	
	/**
	 * 方法名 ： setPathAssess
	 * 功 能 ： 设置变量 pathAssess 环境评估 的值
	 */
	public void setPathAssess(String pathAssess) {
		this.pathAssess = pathAssess;
	}
	
	/**
	 * 方法名 ： getBodyAssess
	 * 功 能 ： 返回变量 bodyAssess 身体功能评估 的值
	 *
	 * @return: String
	 */
	public String getBodyAssess() {
		return bodyAssess;
	}
	
	/**
	 * 方法名 ： setBodyAssess
	 * 功 能 ： 设置变量 bodyAssess 身体功能评估 的值
	 */
	public void setBodyAssess(String bodyAssess) {
		this.bodyAssess = bodyAssess;
	}
	
	/**
	 * 方法名 ： getMainAssessPerson
	 * 功 能 ： 返回变量 mainAssessPerson 主评人签字 的值
	 *
	 * @return: String
	 */
	public String getMainAssessPerson() {
		return mainAssessPerson;
	}
	
	/**
	 * 方法名 ： setMainAssessPerson
	 * 功 能 ： 设置变量 mainAssessPerson 主评人签字 的值
	 */
	public void setMainAssessPerson(String mainAssessPerson) {
		this.mainAssessPerson = mainAssessPerson;
	}
	
	/**
	 * 方法名 ： getGender
	 * 功 能 ： 返回变量 gender 性别 的值
	 *
	 * @return: String
	 */
	public String getGender() {
		return gender;
	}
	
	/**
	 * 方法名 ： setGender
	 * 功 能 ： 设置变量 gender 性别 的值
	 */
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	/**
	 * 方法名 ： getDisableType
	 * 功 能 ： 返回变量 disableType 残疾类别 的值
	 *
	 * @return: String
	 */
	public String getDisableType() {
		return disableType;
	}
	
	/**
	 * 方法名 ： setDisableType
	 * 功 能 ： 设置变量 disableType 残疾类别 的值
	 */
	public void setDisableType(String disableType) {
		this.disableType = disableType;
	}
	
	/**
	 * 方法名 ： getHomeAddress
	 * 功 能 ： 返回变量 homeAddress 家庭地址 的值
	 *
	 * @return: String
	 */
	public String getHomeAddress() {
		return homeAddress;
	}
	
	/**
	 * 方法名 ： setHomeAddress
	 * 功 能 ： 设置变量 homeAddress 家庭地址 的值
	 */
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	/**
	 * 方法名 ： getContactTelphone
	 * 功 能 ： 返回变量 contactTelphone 联系电话 的值
	 *
	 * @return: String
	 */
	public String getContactTelphone() {
		return contactTelphone;
	}
	
	/**
	 * 方法名 ： setContactTelphone
	 * 功 能 ： 设置变量 contactTelphone 联系电话 的值
	 */
	public void setContactTelphone(String contactTelphone) {
		this.contactTelphone = contactTelphone;
	}
	
	/**
	 * 方法名 ： getName
	 * 功 能 ： 返回变量 name 姓名 的值
	 *
	 * @return: String
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * 方法名 ： setName
	 * 功 能 ： 设置变量 name 姓名 的值
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 方法名 ： getFullTimeMember
	 * 功 能 ： 返回变量 fullTimeMember 专职委员签字 的值
	 *
	 * @return: String
	 */
	public String getFullTimeMember() {
		return fullTimeMember;
	}
	
	/**
	 * 方法名 ： setFullTimeMember
	 * 功 能 ： 设置变量 fullTimeMember 专职委员签字 的值
	 */
	public void setFullTimeMember(String fullTimeMember) {
		this.fullTimeMember = fullTimeMember;
	}
	
	/**
	 * 方法名 ： getAssessTime
	 * 功 能 ： 返回变量 assessTime 评估时间 的值
	 *
	 * @return: String
	 */
	public Date getAssessTime() {
		return assessTime;
	}
	
	/**
	 * 方法名 ： setAssessTime
	 * 功 能 ： 设置变量 assessTime 评估时间 的值
	 */
	public void setAssessTime(Date assessTime) {
		this.assessTime = assessTime;
	}
	
	/**
	 * 方法名 ： getIdcard
	 * 功 能 ： 返回变量 idcard 身份证 的值
	 *
	 * @return: String
	 */
	public String getIdcard() {
		return idcard;
	}
	
	/**
	 * 方法名 ： setIdcard
	 * 功 能 ： 设置变量 idcard 身份证 的值
	 */
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	
	/**
	 * 方法名 ： getSecondAssessPerson
	 * 功 能 ： 返回变量 secondAssessPerson 副评人签字 的值
	 *
	 * @return: String
	 */
	public String getSecondAssessPerson() {
		return secondAssessPerson;
	}
	
	/**
	 * 方法名 ： setSecondAssessPerson
	 * 功 能 ： 设置变量 secondAssessPerson 副评人签字 的值
	 */
	public void setSecondAssessPerson(String secondAssessPerson) {
		this.secondAssessPerson = secondAssessPerson;
	}
	
}
