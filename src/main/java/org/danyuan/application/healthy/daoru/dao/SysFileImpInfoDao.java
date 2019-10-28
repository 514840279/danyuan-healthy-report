package org.danyuan.application.healthy.daoru.dao;

import java.util.List;

import org.danyuan.application.common.base.BaseDao;
import org.danyuan.application.healthy.daoru.po.SysFileImpInfo;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 * @文件名 SysFileImpInfoDao.java
 * @包名 org.danyuan.application.healthy.daoru.dao
 * @描述 dao层
 * @时间 2019年10月28日 10:53:12
 * @author test
 * @版本 V1.0
 */
@Repository
public interface SysFileImpInfoDao extends BaseDao<SysFileImpInfo> {
	
	/**
	 * @方法名 findAllByImpType
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @return
	 * @返回 List<SysFileImpInfo>
	 * @author Administrator
	 * @throws
	 */
	@Query("select t from SysFileImpInfo t where t.impType=0 ")
	List<SysFileImpInfo> findAllByImpType();

}
