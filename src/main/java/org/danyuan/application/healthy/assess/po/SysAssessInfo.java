package org.danyuan.application.healthy.assess.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

import org.danyuan.application.common.base.BaseEntity;

/**
 * @文件名 SysAssessInfo.java
 * @包名 org.danyuan.application.healthy.assess.po
 * @描述 sys_assess_info的实体类
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Entity
@Table(name = "sys_assess_info")
@NamedQuery(name = "SysAssessInfo.findAll", query = "SELECT s FROM SysAssessInfo s")
public class SysAssessInfo extends BaseEntity implements Serializable {
	private static final long	serialVersionUID	= 1L;


	// 意识状态
	@Column(name = "yisizhuangtai")
	private  String 	yisizhuangtai;

	// FIM评分
	@Column(name = "fim")
	private  Integer 	fim;

	// 过敏药物或食物
	@Column(name = "guomin")
	private  String 	guomin;

	// 评估外键
	@Column(name = "base_uuid")
	private  String 	baseUuid;

	// 大小便
	@Column(name = "daxiaobian")
	private  String 	daxiaobian;

	// 生命体征平稳
	@Column(name = "tizheng")
	private  String 	tizheng;

	// 手术外伤史
	@Column(name = "waishang")
	private  String 	waishang;

	// ASIA分级
	@Column(name = "asia")
	private  Integer 	asia;

	// 家族遗传病及传染病史
	@Column(name = "yichuan")
	private  String 	yichuan;

	// ADL评分
	@Column(name = "adl")
	private  Integer 	adl;

	// 自主能力
	@Column(name = "zizhunengli")
	private  String 	zizhunengli;

	// Burnnstrom分级
	@Column(name = "burnnstrom")
	private  Integer 	burnnstrom;

	// Ashworth评级
	@Column(name = "ashworth")
	private  Integer 	ashworth;

	/**  
	*  构造方法： 
	*  描    述： 默认构造函数  
	*  参    数： 
	*  作    者 ： test  
	*  @throws  
	*/
	public SysAssessInfo() {
		super();
	}


	/**
	 * 方法名 ： getYisizhuangtai
	 * 功 能 ： 返回变量 yisizhuangtai 意识状态 的值
	 *
	 * @return: String 
	 */
	public  String  getYisizhuangtai() {
		return yisizhuangtai;
	}

	/**
	 * 方法名 ： setYisizhuangtai
	 * 功 能 ： 设置变量 yisizhuangtai 意识状态 的值
	 */
	public void setYisizhuangtai( String  yisizhuangtai) {
		this.yisizhuangtai = yisizhuangtai;
	}

	/**
	 * 方法名 ： getFim
	 * 功 能 ： 返回变量 fim FIM评分 的值
	 *
	 * @return: String 
	 */
	public  Integer  getFim() {
		return fim;
	}

	/**
	 * 方法名 ： setFim
	 * 功 能 ： 设置变量 fim FIM评分 的值
	 */
	public void setFim( Integer  fim) {
		this.fim = fim;
	}

	/**
	 * 方法名 ： getGuomin
	 * 功 能 ： 返回变量 guomin 过敏药物或食物 的值
	 *
	 * @return: String 
	 */
	public  String  getGuomin() {
		return guomin;
	}

	/**
	 * 方法名 ： setGuomin
	 * 功 能 ： 设置变量 guomin 过敏药物或食物 的值
	 */
	public void setGuomin( String  guomin) {
		this.guomin = guomin;
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
	 * 方法名 ： getDaxiaobian
	 * 功 能 ： 返回变量 daxiaobian 大小便 的值
	 *
	 * @return: String 
	 */
	public  String  getDaxiaobian() {
		return daxiaobian;
	}

	/**
	 * 方法名 ： setDaxiaobian
	 * 功 能 ： 设置变量 daxiaobian 大小便 的值
	 */
	public void setDaxiaobian( String  daxiaobian) {
		this.daxiaobian = daxiaobian;
	}

	/**
	 * 方法名 ： getTizheng
	 * 功 能 ： 返回变量 tizheng 生命体征平稳 的值
	 *
	 * @return: String 
	 */
	public  String  getTizheng() {
		return tizheng;
	}

	/**
	 * 方法名 ： setTizheng
	 * 功 能 ： 设置变量 tizheng 生命体征平稳 的值
	 */
	public void setTizheng( String  tizheng) {
		this.tizheng = tizheng;
	}

	/**
	 * 方法名 ： getWaishang
	 * 功 能 ： 返回变量 waishang 手术外伤史 的值
	 *
	 * @return: String 
	 */
	public  String  getWaishang() {
		return waishang;
	}

	/**
	 * 方法名 ： setWaishang
	 * 功 能 ： 设置变量 waishang 手术外伤史 的值
	 */
	public void setWaishang( String  waishang) {
		this.waishang = waishang;
	}

	/**
	 * 方法名 ： getAsia
	 * 功 能 ： 返回变量 asia ASIA分级 的值
	 *
	 * @return: String 
	 */
	public  Integer  getAsia() {
		return asia;
	}

	/**
	 * 方法名 ： setAsia
	 * 功 能 ： 设置变量 asia ASIA分级 的值
	 */
	public void setAsia( Integer  asia) {
		this.asia = asia;
	}

	/**
	 * 方法名 ： getYichuan
	 * 功 能 ： 返回变量 yichuan 家族遗传病及传染病史 的值
	 *
	 * @return: String 
	 */
	public  String  getYichuan() {
		return yichuan;
	}

	/**
	 * 方法名 ： setYichuan
	 * 功 能 ： 设置变量 yichuan 家族遗传病及传染病史 的值
	 */
	public void setYichuan( String  yichuan) {
		this.yichuan = yichuan;
	}

	/**
	 * 方法名 ： getAdl
	 * 功 能 ： 返回变量 adl ADL评分 的值
	 *
	 * @return: String 
	 */
	public  Integer  getAdl() {
		return adl;
	}

	/**
	 * 方法名 ： setAdl
	 * 功 能 ： 设置变量 adl ADL评分 的值
	 */
	public void setAdl( Integer  adl) {
		this.adl = adl;
	}

	/**
	 * 方法名 ： getZizhunengli
	 * 功 能 ： 返回变量 zizhunengli 自主能力 的值
	 *
	 * @return: String 
	 */
	public  String  getZizhunengli() {
		return zizhunengli;
	}

	/**
	 * 方法名 ： setZizhunengli
	 * 功 能 ： 设置变量 zizhunengli 自主能力 的值
	 */
	public void setZizhunengli( String  zizhunengli) {
		this.zizhunengli = zizhunengli;
	}

	/**
	 * 方法名 ： getBurnnstrom
	 * 功 能 ： 返回变量 burnnstrom Burnnstrom分级 的值
	 *
	 * @return: String 
	 */
	public  Integer  getBurnnstrom() {
		return burnnstrom;
	}

	/**
	 * 方法名 ： setBurnnstrom
	 * 功 能 ： 设置变量 burnnstrom Burnnstrom分级 的值
	 */
	public void setBurnnstrom( Integer  burnnstrom) {
		this.burnnstrom = burnnstrom;
	}

	/**
	 * 方法名 ： getAshworth
	 * 功 能 ： 返回变量 ashworth Ashworth评级 的值
	 *
	 * @return: String 
	 */
	public  Integer  getAshworth() {
		return ashworth;
	}

	/**
	 * 方法名 ： setAshworth
	 * 功 能 ： 设置变量 ashworth Ashworth评级 的值
	 */
	public void setAshworth( Integer  ashworth) {
		this.ashworth = ashworth;
	}


}
