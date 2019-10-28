package org.danyuan.application.healthy.daoru.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.danyuan.application.common.utils.excel.ImportExeclMain;
import org.danyuan.application.healthy.daoru.dao.SysFileImpInfoDao;
import org.danyuan.application.healthy.daoru.po.SysFileImpInfo;
import org.danyuan.application.healthy.report.dao.SysHealthyBaseInfoDao;
import org.danyuan.application.healthy.report.po.SysHealthyBaseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class DaoruAsyncService {

	@Autowired
	SysFileImpInfoDao		sysFileImpInfoDao;
	@Autowired
	SysHealthyBaseInfoDao	sysHealthyBaseInfoDao;
	
	@Async
	public void execAsync() {
		try {
			for (;;) {
				List<SysFileImpInfo> list = sysFileImpInfoDao.findAllByImpType();
				if (list != null && list.size() > 0) {
					for (SysFileImpInfo sysFileImpInfo : list) {
						importDataIn(sysFileImpInfo);
					}
				} else {
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @方法名 importDataIn
	 * @功能 TODO(这里用一句话描述这个方法的作用)
	 * @参数 @param sysFileImpInfo
	 * @返回 void
	 * @author Administrator
	 * @throws
	 */
	private void importDataIn(SysFileImpInfo sysFileImpInfo) {
		ImportExeclMain exceldata = new ImportExeclMain();
		List<List<List<String>>> list = exceldata.readExcel(System.getProperty("user.dir") + "/fileupload/" + sysFileImpInfo.getFilePath());
		for (List<List<String>> row : list) {
			List<SysHealthyBaseInfo> listbaseBaseInfos = new ArrayList<>();
			for (int i = 1; i < row.size(); i++) {
				SysHealthyBaseInfo info = new SysHealthyBaseInfo();
				info.setUuid(UUID.randomUUID().toString());
				info.setCreateUser(sysFileImpInfo.getCreateUser());
				info.setUpdateUser(sysFileImpInfo.getUpdateUser());
				info.setDeleteFlag(0);
				info.setIdcard(row.get(i).get(2).length() > 18 ? row.get(i).get(2).substring(0, 18) : row.get(i).get(2));
				info.setDisableCard(row.get(i).get(2).length() > 18 ? row.get(i).get(2).substring(18) : row.get(i).get(2));
				info.setName(row.get(i).get(0));
				info.setGender(row.get(i).get(1));
				info.setContactName(row.get(i).get(3));
				info.setContactTelphone(row.get(i).get(4));
				info.setHomeAddress(row.get(i).get(5));
				info.setProvince(row.get(i).get(6));
				info.setCity(row.get(i).get(7));
				info.setArea(row.get(i).get(8));
				info.setStreet(row.get(i).get(9));
				info.setGarden(row.get(i).get(10));
				listbaseBaseInfos.add(info);
				System.out.println(row.get(i));
			}
			sysHealthyBaseInfoDao.saveAll(listbaseBaseInfos);
		}
		sysFileImpInfo.setImpType(1);
		sysFileImpInfoDao.save(sysFileImpInfo);
	}
	
}
