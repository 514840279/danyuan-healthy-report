package org.danyuan.application.healthy.assess.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysAssessBrunnstrom.java
 * @包名 org.danyuan.application.healthy.assess.po
 * @描述 sys_assess_brunnstrom的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_assess_brunnstrom")
@NamedQuery(name = "SysAssessBrunnstrom.findAll", query = "SELECT s FROM SysAssessBrunnstrom s")
public class SysAssessBrunnstrom extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;


	// 排序
	@Column(name = "order_num")
	private  Integer 	orderNum;

	// 评分
	@Column(name = "score")
	private  String 	score;

	// 一般外键
	@Column(name = "assess_uuid")
	private  String 	assessUuid;

	// 列名
	@Column(name = "name")
	private  String 	name;

	/**  
	*  构造方法： 
	*  描    述： 默认构造函数  
	*  参    数： 
	*  作    者 ： test  
	*  @throws  
	*/
	public SysAssessBrunnstrom() {
		super();
	}


	/**
	 * 方法名 ： getOrderNum
	 * 功 能 ： 返回变量 orderNum 排序 的值
	 *
	 * @return: String 
	 */
	public  Integer  getOrderNum() {
		return orderNum;
	}

	/**
	 * 方法名 ： setOrderNum
	 * 功 能 ： 设置变量 orderNum 排序 的值
	 */
	public void setOrderNum( Integer  orderNum) {
		this.orderNum = orderNum;
	}

	/**
	 * 方法名 ： getScore
	 * 功 能 ： 返回变量 score 评分 的值
	 *
	 * @return: String 
	 */
	public  String  getScore() {
		return score;
	}

	/**
	 * 方法名 ： setScore
	 * 功 能 ： 设置变量 score 评分 的值
	 */
	public void setScore( String  score) {
		this.score = score;
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
	 * 方法名 ： getName
	 * 功 能 ： 返回变量 name 列名 的值
	 *
	 * @return: String 
	 */
	public  String  getName() {
		return name;
	}

	/**
	 * 方法名 ： setName
	 * 功 能 ： 设置变量 name 列名 的值
	 */
	public void setName( String  name) {
		this.name = name;
	}


}
