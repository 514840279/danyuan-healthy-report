/**
 *
 */
package org.danyuan.application.healthy.upload.service;

import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.healthy.upload.dao.SysFileImgInfoDao;
import org.danyuan.application.healthy.upload.po.SysFileImgInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author wth
 */
@Service
public class SysFileImgInfoService extends BaseServiceImpl<SysFileImgInfo> implements BaseService<SysFileImgInfo> {
	
	@Autowired
	SysFileImgInfoDao sysFileImgInfoDao;
	
}
