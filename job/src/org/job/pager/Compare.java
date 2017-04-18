package org.job.pager;

/**查询方式*/
public enum Compare {
	/**等于*/
	EQ,
	
	/**不等于*/
	NE,
	
	/**小于*/
	LT,
	
	/**大于*/
	GT,
	
	/**小于等于*/
	LE,
	
	/**大于等于*/
	GE,
	
	/**像*/
	LIKE,
	
	IN,
	
	/**在...范围之内*/
	BETWEEN,
	
	/**并且*/
	AND,
	
	/**或者*/
	OR;
	
	
}
