package org.danyuan.application.healthy.assess.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysAssessRiskInfo.java
 * @包名 org.danyuan.application.healthy.assess.po
 * @描述 sys_assess_risk_info的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_assess_risk_info")
@NamedQuery(name = "SysAssessRiskInfo.findAll", query = "SELECT s FROM SysAssessRiskInfo s")
public class SysAssessRiskInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;


	// 神经系统病史
	@Column(name = "shenjing")
	private  String 	shenjing;

	// 是否服用抗凝药物
	@Column(name = "yongguokangneng")
	private  String 	yongguokangneng;

	// 服用β受体阻滞剂
	@Column(name = "zuzhiji")
	private  String 	zuzhiji;

	// 心脑血管病史
	@Column(name = "xueguanbingshi")
	private  String 	xueguanbingshi;

	// 深静脉血栓/肺栓塞风险
	@Column(name = "xueshuan")
	private  String 	xueshuan;

	// 呼吸系统病史
	@Column(name = "huxi")
	private  String 	huxi;

	// 消化系统病史
	@Column(name = "xiaohua")
	private  String 	xiaohua;

	// 评估外键
	@Column(name = "base_uuid")
	private  String 	baseUuid;

	// 其他
	@Column(name = "qita")
	private  String 	qita;

	/**  
	*  构造方法： 
	*  描    述： 默认构造函数  
	*  参    数： 
	*  作    者 ： test  
	*  @throws  
	*/
	public SysAssessRiskInfo() {
		super();
	}


	/**
	 * 方法名 ： getShenjing
	 * 功 能 ： 返回变量 shenjing 神经系统病史 的值
	 *
	 * @return: String 
	 */
	public  String  getShenjing() {
		return shenjing;
	}

	/**
	 * 方法名 ： setShenjing
	 * 功 能 ： 设置变量 shenjing 神经系统病史 的值
	 */
	public void setShenjing( String  shenjing) {
		this.shenjing = shenjing;
	}

	/**
	 * 方法名 ： getYongguokangneng
	 * 功 能 ： 返回变量 yongguokangneng 是否服用抗凝药物 的值
	 *
	 * @return: String 
	 */
	public  String  getYongguokangneng() {
		return yongguokangneng;
	}

	/**
	 * 方法名 ： setYongguokangneng
	 * 功 能 ： 设置变量 yongguokangneng 是否服用抗凝药物 的值
	 */
	public void setYongguokangneng( String  yongguokangneng) {
		this.yongguokangneng = yongguokangneng;
	}

	/**
	 * 方法名 ： getZuzhiji
	 * 功 能 ： 返回变量 zuzhiji 服用β受体阻滞剂 的值
	 *
	 * @return: String 
	 */
	public  String  getZuzhiji() {
		return zuzhiji;
	}

	/**
	 * 方法名 ： setZuzhiji
	 * 功 能 ： 设置变量 zuzhiji 服用β受体阻滞剂 的值
	 */
	public void setZuzhiji( String  zuzhiji) {
		this.zuzhiji = zuzhiji;
	}

	/**
	 * 方法名 ： getXueguanbingshi
	 * 功 能 ： 返回变量 xueguanbingshi 心脑血管病史 的值
	 *
	 * @return: String 
	 */
	public  String  getXueguanbingshi() {
		return xueguanbingshi;
	}

	/**
	 * 方法名 ： setXueguanbingshi
	 * 功 能 ： 设置变量 xueguanbingshi 心脑血管病史 的值
	 */
	public void setXueguanbingshi( String  xueguanbingshi) {
		this.xueguanbingshi = xueguanbingshi;
	}

	/**
	 * 方法名 ： getXueshuan
	 * 功 能 ： 返回变量 xueshuan 深静脉血栓/肺栓塞风险 的值
	 *
	 * @return: String 
	 */
	public  String  getXueshuan() {
		return xueshuan;
	}

	/**
	 * 方法名 ： setXueshuan
	 * 功 能 ： 设置变量 xueshuan 深静脉血栓/肺栓塞风险 的值
	 */
	public void setXueshuan( String  xueshuan) {
		this.xueshuan = xueshuan;
	}

	/**
	 * 方法名 ： getHuxi
	 * 功 能 ： 返回变量 huxi 呼吸系统病史 的值
	 *
	 * @return: String 
	 */
	public  String  getHuxi() {
		return huxi;
	}

	/**
	 * 方法名 ： setHuxi
	 * 功 能 ： 设置变量 huxi 呼吸系统病史 的值
	 */
	public void setHuxi( String  huxi) {
		this.huxi = huxi;
	}

	/**
	 * 方法名 ： getXiaohua
	 * 功 能 ： 返回变量 xiaohua 消化系统病史 的值
	 *
	 * @return: String 
	 */
	public  String  getXiaohua() {
		return xiaohua;
	}

	/**
	 * 方法名 ： setXiaohua
	 * 功 能 ： 设置变量 xiaohua 消化系统病史 的值
	 */
	public void setXiaohua( String  xiaohua) {
		this.xiaohua = xiaohua;
	}

	/**
	 * 方法名 ： getBaseUuid
	 * 功 能 ： 返回变量 baseUuid 评估外键 的值
	 *
	 * @return: String 
	 */
	public  String  getBaseUuid() {
		return baseUuid;
	}

	/**
	 * 方法名 ： setBaseUuid
	 * 功 能 ： 设置变量 baseUuid 评估外键 的值
	 */
	public void setBaseUuid( String  baseUuid) {
		this.baseUuid = baseUuid;
	}

	/**
	 * 方法名 ： getQita
	 * 功 能 ： 返回变量 qita 其他 的值
	 *
	 * @return: String 
	 */
	public  String  getQita() {
		return qita;
	}

	/**
	 * 方法名 ： setQita
	 * 功 能 ： 设置变量 qita 其他 的值
	 */
	public void setQita( String  qita) {
		this.qita = qita;
	}


}
