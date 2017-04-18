package org.job.pager;

import java.io.Serializable;

public class Order implements Serializable {
	private String fieldName;
	private OrderDirect direct = OrderDirect.ASC;
	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public OrderDirect getDirect() {
		return direct;
	}
	public void setDirect(OrderDirect direct) {
		this.direct = direct;
	}
	public Order(String fieldName, OrderDirect direct) {
		super();
		this.fieldName = fieldName;
		this.direct = direct;
	}
	public Order() {
		super();
	}
	
	
}
