package org.job.pager;

public class LinkCondition {
	/**属性名*/
	private String propertyName;
	/**别名*/
	private String propertyAlias;
	public String getPropertyName() {
		return propertyName;
	}
	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}
	public String getPropertyAlias() {
		return propertyAlias;
	}
	public void setPropertyAlias(String propertyAlias) {
		this.propertyAlias = propertyAlias;
	}
	public LinkCondition(String propertyName, String propertyAlias) {
		super();
		this.propertyName = propertyName;
		this.propertyAlias = propertyAlias;
	}
	public LinkCondition() {
		super();
	}
	
	
}
