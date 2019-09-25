package org.danyuan.application.healthy.report.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.danyuan.application.common.base.BaseService;
import org.danyuan.application.common.base.BaseServiceImpl;
import org.danyuan.application.common.base.Pagination;
import org.danyuan.application.healthy.report.dao.SysHealthyBaseInfoDao;
import org.danyuan.application.healthy.report.po.SysHealthyBaseInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

/**
 * @文件名 SysHealthyBaseInfoService.java
 * @包名 org.danyuan.application.healthy.report.service
 * @描述 service层
 * @时间 2019年09月24日 17:46:51
 * @author test
 * @版本 V1.0
 */
@Service
public class SysHealthyBaseInfoService extends BaseServiceImpl<SysHealthyBaseInfo> implements BaseService<SysHealthyBaseInfo> {

	@Autowired
	SysHealthyBaseInfoDao sysHealthyBaseInfoDao;

	@Override
	public Page<SysHealthyBaseInfo> page(Pagination<SysHealthyBaseInfo> vo) {

		Order order = Order.desc("createTime");
		Sort sort = Sort.by(order);
		PageRequest request = PageRequest.of(vo.getPageNumber() - 1, vo.getPageSize(), sort);
		return sysHealthyBaseInfoDao.findAll(new Specification<SysHealthyBaseInfo>() {
			private static final long serialVersionUID = 1L;
			
			@Override
			public Predicate toPredicate(Root<SysHealthyBaseInfo> root, CriteriaQuery<?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				// idcard
				if (StringUtils.isNotBlank(vo.getInfo().getIdcard())) {
					predicates.add(criteriaBuilder.like(root.<String> get("idcard"), "%" + vo.getInfo().getIdcard() + "%"));
				}
				// name
				if (StringUtils.isNotBlank(vo.getInfo().getName())) {
					predicates.add(criteriaBuilder.like(root.<String> get("name"), "%" + vo.getInfo().getName() + "%"));
				}
				// disableCard
				if (StringUtils.isNotBlank(vo.getInfo().getDisableCard())) {
					predicates.add(criteriaBuilder.like(root.<String> get("disableCard"), "%" + vo.getInfo().getDisableCard() + "%"));
				}
				query.where(predicates.toArray(new Predicate[predicates.size()]));
				return query.getRestriction();
			}
		}, request);
	}
}
