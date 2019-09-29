package org.danyuan.application.healthy.assess.dao;

import javax.transaction.Transactional;

import org.danyuan.application.common.base.BaseDao;
import org.danyuan.application.healthy.assess.po.SysAssessInfo;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * @文件名 SysAssessInfoDao.java
 * @包名 org.danyuan.application.healthy.assess.dao
 * @描述 dao层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Repository
public interface SysAssessInfoDao extends BaseDao<SysAssessInfo> {

	/**
	 * @方法名 updateAdl
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param totle
	 * @参数 @param assessUuid
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	@Transactional
	@Modifying
	@Query("update SysAssessInfo t set t.adl=:totle where uuid=:uuid")
	void updateAdl(@Param("totle") int totle, @Param("uuid") String uuid);

	@Transactional
	@Modifying
	@Query("update SysAssessInfo t set t.ashworth=:totle where uuid=:uuid")
	void updateAshworth(@Param("totle") String totle, @Param("uuid") String uuid);

	/**
	 * @方法名 updateAsia
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param jibie
	 * @参数 @param assessUuid
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	@Transactional
	@Modifying
	@Query("update SysAssessInfo t set t.asia=:totle where uuid=:uuid")
	void updateAsia(@Param("totle") String jibie, @Param("uuid") String assessUuid);

	/**
	 * @方法名 updateBrunnstrom
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param totle
	 * @参数 @param assessUuid
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	@Transactional
	@Modifying
	@Query("update SysAssessInfo t set t.burnnstrom=:totle where uuid=:uuid")
	void updateBrunnstrom(@Param("totle") String totle, @Param("uuid") String assessUuid);
	
}
