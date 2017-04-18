package org.job.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * WorkExp entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "workExp", schema = "dbo", catalog = "job")
@Table(name = "workExp", catalog = "job")
public class WorkExp implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Date beginDate;
	private Date endDate;
	private String industry;
	private String department;
	private String position;
	private String describe;
	private Integer userId;

	// Constructors

	/** default constructor */
	public WorkExp() {
	}

	/** full constructor */
	public WorkExp(String name, Date beginDate, Date endDate, String industry, String department, String position, String describe, Integer userId) {
		this.name = name;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.industry = industry;
		this.department = department;
		this.position = position;
		this.describe = describe;
		this.userId = userId;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "beginDate", length = 23)
	public Date getBeginDate() {
		return this.beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	@Column(name = "endDate", length = 23)
	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	@Column(name = "industry", length = 200)
	public String getIndustry() {
		return this.industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	@Column(name = "department", length = 50)
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Column(name = "position", length = 50)
	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Column(name = "describeString", length = 2000)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Column(name = "userId")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}