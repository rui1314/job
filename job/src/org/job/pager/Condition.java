package org.job.pager;

import java.io.Serializable;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Restrictions;

/**查询条件 */
public class Condition implements Serializable {
	/**查询参数名*/
	private String propertyName;
	
	/**查询条件*/
	private Compare compare = Compare.EQ;
	
	/**查询参数值*/
	private Object propertyValue;
	
	/**连接条件*/
	private LinkCondition[] linkCondition;
	
	/**between值*/
	private Object[] betweenValue;
	
	/**分页条件*/
	private Pager pager;
	/**and_or条件1[Restrictions.eq(propertyName,propertyValue]*/
	private Criterion lhs;
	/**and_or条件2[Restrictions.eq(propertyName,propertyValue]*/
	private Criterion rhs;//and条件2
	
	/**排序条件*/
	private Order order;
	
	/**须要分组的属性*/
	private String groupProperty;
	private String groupAlia;
	
	private FunctionDemand[] functionDemands;
	
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public Compare getCompare() {
		return compare;
	}
	public void setCompare(Compare compare) {
		this.compare = compare;
	}
	public Object getPropertyValue() {
		return propertyValue;
	}
	public void setPropertyValue(Object propertyValue) {
		this.propertyValue = propertyValue;
	}
	public LinkCondition[] getLinkCondition() {
		return linkCondition;
	}
	public void setLinkCondition(LinkCondition[] linkCondition) {
		this.linkCondition = linkCondition;
	}
	public Object[] getBetweenValue() {
		return betweenValue;
	}
	public void setBetweenValue(Object[] betweenValue) {
		this.betweenValue = betweenValue;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public Criterion getLhs() {
		return lhs;
	}
	public void setLhs(Criterion lhs) {
		this.lhs = lhs;
	}
	public Criterion getRhs() {
		return rhs;
	}
	public void setRhs(Criterion rhs) {
		this.rhs = rhs;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
	public String getGroupAlia() {
		return groupAlia;
	}
	public void setGroupAlia(String groupAlia) {
		this.groupAlia = groupAlia;
	}
	public String getGroupProperty() {
		return groupProperty;
	}
	public void setGroupProperty(String groupProperty) {
		this.groupProperty = groupProperty;
	}
	public FunctionDemand[] getFunctionDemands() {
		return functionDemands;
	}
	public void setFunctionDemands(FunctionDemand[] functionDemands) {
		this.functionDemands = functionDemands;
	}
	/**
	 * 设置查询
	 * */
	public Condition(String propertyName, Compare compare, Object propertyValue) {
		super();
		this.propertyName = propertyName;
		this.compare = compare;
		this.propertyValue = propertyValue;
	}
	
	
	/**
	 * 设置and或or条件
	 * */
	public Condition(Criterion lhs, Criterion rhs) {
		super();
		this.lhs = lhs;
		this.rhs = rhs;
	}
	public Condition(Pager pager) {
		super();
		this.pager = pager;
	}
	
	public Condition(Order order) {
		super();
		this.order = order;
	}
	public Condition(LinkCondition[] linkCondition) {
		super();
		this.linkCondition = linkCondition;
	}
	public Condition() {
		super();
	}
	public Condition(String groupProperty, String groupAlia) {
		super();
		this.groupProperty = groupProperty;
		this.groupAlia = groupAlia;
	}
	
}