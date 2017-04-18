package org.job.dao;

import java.sql.SQLException;
import java.util.*;

import javax.annotation.Resource;

import org.hibernate.*;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.job.pager.*;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

@SuppressWarnings("unchecked")
@Repository("daoTemplate")
public class DaoTemplate {

	@Resource(name = "hibernateTemplate")
	protected HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	/**
	 * 查询最大ID
	 * */
	public Object getMaxId(final Class classzz, final String id) {
		return hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				// TODO Auto-generated method stub
				Criteria criteria = arg0.createCriteria(classzz);
				if (null != criteria.setProjection(Projections.max(id))
						.uniqueResult()) {
					return criteria.setProjection(Projections.max(id))
							.uniqueResult();
				} else {
					return null;
				}

			}
		});
	}

	/** 保存 */
	public boolean save(final Object entity) {

		return (Boolean) hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				try {
					arg0.save(entity);
					return true;
				} catch (HibernateException e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("hibernate数据保存异常：", e);
				}
			}
		});

	}

	/** 更新 */
	public boolean update(final Object entity) {

		return (Boolean) hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				try {
					arg0.update(entity);
					return true;
				} catch (HibernateException e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("hibernate数据更新异常：", e);
				}
			}
		});

	}

	/** 删除 */
	public boolean delete(final Object entity) {

		return (Boolean) hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				try {
					arg0.delete(entity);
					return true;
				} catch (HibernateException e) {
					// TODO Auto-generated catch block
					throw new RuntimeException("hibernate数据删除异常：", e);
				}
			}
		});

	}

	/** 多条件查询 */
	public <T> ResultList find(final Class classzz,
			final Condition... conditions) {
		return (ResultList) hibernateTemplate.execute(new HibernateCallback() {

			public Object doInHibernate(Session arg0)
					throws HibernateException, SQLException {
				Criteria criteria = arg0.createCriteria(classzz);

				// 多表连接
				linkJoin(criteria, conditions);

				// 查询条件
				prepareCondtion(criteria, conditions);

				// 设置分页得到分页结果
				Pager pager = pagerInfo(criteria, conditions);

				// 排序条件
				orderCondtion(criteria, conditions);

				// 得到查询结果
				List<T> list = criteria.list();

				// 返回结果集
				ResultList rl = new ResultList();
				rl.setList(list);
				rl.setPager(pager);
				return rl;
			}
		});
	}

	/**
	 * 分组查询
	 * */
	public List<Map<String,Object>> groupFind(final Class classzz,
			final Condition... conditions) {
		return (List<Map<String,Object>>) hibernateTemplate
				.execute(new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// TODO Auto-generated method stub
						Criteria criteria = session.createCriteria(classzz);

						// 多表连接
						linkJoin(criteria, conditions);

						// 分组
						List<String> alList = functionSetting(criteria, conditions);

						// 查询条件
						prepareCondtion(criteria, conditions);

						// 排序条件
						orderCondtion(criteria, conditions);
						
						List<Object[]> l = criteria.list();// 查询结果 object对象数组
						List list = new ArrayList(0);
						for (Object[] obj : l) {
							Map map = new HashMap(0);
							for(int i = 0;i<obj.length;i++){
								map.put(alList.get(i), obj[i]);
							}
							list.add(map);
						}
						return list;
					}
				});
	}

	/** 设置多表连接 */
	protected void linkJoin(Criteria qbc, Condition... conditions) {
		if (conditions != null) {
			for (Condition c : conditions) {
				if (c.getLinkCondition() != null) {
					for (int i = 0; i < c.getLinkCondition().length; i++) {
						qbc.createAlias(
								c.getLinkCondition()[i].getPropertyName(),
								c.getLinkCondition()[i].getPropertyAlias(),
								Criteria.LEFT_JOIN);
					}
				}
			}
		}
	}

	protected Pager pagerInfo(Criteria qbc, Condition... conditions) {
		Pager pager = new Pager();
		if (conditions != null) {
			for (Condition c : conditions) {
				/** 拼接分页查询 */
				if (c.getPager() != null) {
					// 得到总条数
					qbc.setProjection(Projections.rowCount());
					pager.setRecordCount((Integer) qbc.uniqueResult());

					qbc.setFirstResult((c.getPager().getPageIndex() - 1)
							* c.getPager().getPageSize());
					qbc.setMaxResults(c.getPager().getPageSize());

					// 清空投影查询的设置
					qbc.setProjection(null);
					qbc.setResultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY);

					// 计算总页数
					pager.setPageCount((pager.getRecordCount()
							% c.getPager().getPageSize() == 0) ? (pager
							.getRecordCount() / c.getPager().getPageSize())
							: (pager.getRecordCount()
									/ c.getPager().getPageSize() + 1));
					// 当前页数
					pager.setPageIndex(c.getPager().getPageIndex());
				}
			}
		}
		return pager;
	}

	/** 拼接查询条件 */
	protected void prepareCondtion(Criteria qbc, Condition... conditions) {
		if (conditions != null) {
			for (Condition c : conditions) {
				if (c.getBetweenValue() != null
						|| (c.getPropertyValue() != null)
						&& (c.getPropertyName() != null)
						|| (c.getLhs() != null) && (c.getRhs() != null)) {
					switch (c.getCompare()) {
					case EQ:
						qbc.add(Restrictions.eq(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case LT:
						qbc.add(Restrictions.lt(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case GT:
						qbc.add(Restrictions.gt(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case LE:
						qbc.add(Restrictions.le(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case GE:
						qbc.add(Restrictions.ge(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case NE:
						qbc.add(Restrictions.ne(c.getPropertyName(),
								c.getPropertyValue()));
						break;
					case LIKE:
						qbc.add(Restrictions.like(c.getPropertyName(), c
								.getPropertyValue() == null ? "" : c
								.getPropertyValue().toString(),
								MatchMode.ANYWHERE));
						break;
					case BETWEEN:
						qbc.add(Restrictions.between(c.getPropertyName(),
								c.getBetweenValue()[0], c.getBetweenValue()[1]));
						break;
					case IN:
						qbc.add(Restrictions.in(c.getPropertyName(),
								(Object[]) c.getPropertyValue()));
						break;
					case AND:
						qbc.add(Restrictions.and(c.getLhs(), c.getRhs()));
						break;
					default:
						break;
					}
				}
			}
		}
	}

	/** 拼接排序语句 */
	protected void orderCondtion(Criteria qbc, Condition... conditions) {
		if (conditions != null) {
			for (Condition c : conditions) {
				if (c.getOrder() != null) {
					switch (c.getOrder().getDirect()) {
					case ASC:
						qbc.addOrder(Order.asc(c.getOrder().getFieldName()));
						break;
					case DESC:
						qbc.addOrder(Order.desc(c.getOrder().getFieldName()));
						break;
					default:
						break;
					}
				}
			}
		}
	}

	protected List<String> functionSetting(Criteria qbc, Condition... conditions) {
		List<String> alList = null;
		if (conditions != null) {
			ProjectionList plist = Projections.projectionList();//聚合函数集合
			alList = new ArrayList<String>();//所用别名集合
			for (Condition c : conditions) {
				if (c.getGroupProperty() != null && null != c.getGroupAlia())
					plist.add(Projections.groupProperty(c.getGroupProperty()));//设置分组属性
					alList.add(c.getGroupAlia());//设置分组别名
				if (c.getFunctionDemands() != null) {
					for (FunctionDemand fd : c.getFunctionDemands()) {
						alList.add(fd.getAlia());
						switch (fd.getFun()) {
						case AVG:
							plist.add(Projections.alias(
									Projections.avg(fd.getPro()), fd.getAlia()));
							break;
						case COUNT:
							plist.add(Projections.alias(
									Projections.count(fd.getPro()),
									fd.getAlia()));
							break;
						case MAX:
							plist.add(Projections.alias(
									Projections.max(fd.getPro()), fd.getAlia()));
							break;
						case MIN:
							plist.add(Projections.alias(
									Projections.min(fd.getPro()), fd.getAlia()));
							break;
						case SUM:
							plist.add(Projections.alias(
									Projections.sum(fd.getPro()), fd.getAlia()));
							break;
						default:
							break;
						}

					}
				}
			}
			qbc.setProjection(plist);
		}
		return alList;
	}
}
