package org.danyuan.application.healthy.assess.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysAssessAsiaInfo.java
 * @包名 org.danyuan.application.healthy.assess.po
 * @描述 sys_assess_asia_info的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_assess_asia_info")
@NamedQuery(name = "SysAssessAsiaInfo.findAll", query = "SELECT s FROM SysAssessAsiaInfo s")
public class SysAssessAsiaInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;


	// 级别
	@Column(name = "jibie")
	private  String 	jibie;

	// 一般外键
	@Column(name = "assess_uuid")
	private  String 	assessUuid;

	// 临床表现
	@Column(name = "biaoxian")
	private  String 	biaoxian;

	/**  
	*  构造方法： 
	*  描    述： 默认构造函数  
	*  参    数： 
	*  作    者 ： test  
	*  @throws  
	*/
	public SysAssessAsiaInfo() {
		super();
	}


	/**
	 * 方法名 ： getJibie
	 * 功 能 ： 返回变量 jibie 级别 的值
	 *
	 * @return: String 
	 */
	public  String  getJibie() {
		return jibie;
	}

	/**
	 * 方法名 ： setJibie
	 * 功 能 ： 设置变量 jibie 级别 的值
	 */
	public void setJibie( String  jibie) {
		this.jibie = jibie;
	}

	/**
	 * 方法名 ： getAssessUuid
	 * 功 能 ： 返回变量 assessUuid 一般外键 的值
	 *
	 * @return: String 
	 */
	public  String  getAssessUuid() {
		return assessUuid;
	}

	/**
	 * 方法名 ： setAssessUuid
	 * 功 能 ： 设置变量 assessUuid 一般外键 的值
	 */
	public void setAssessUuid( String  assessUuid) {
		this.assessUuid = assessUuid;
	}

	/**
	 * 方法名 ： getBiaoxian
	 * 功 能 ： 返回变量 biaoxian 临床表现 的值
	 *
	 * @return: String 
	 */
	public  String  getBiaoxian() {
		return biaoxian;
	}

	/**
	 * 方法名 ： setBiaoxian
	 * 功 能 ： 设置变量 biaoxian 临床表现 的值
	 */
	public void setBiaoxian( String  biaoxian) {
		this.biaoxian = biaoxian;
	}


}
