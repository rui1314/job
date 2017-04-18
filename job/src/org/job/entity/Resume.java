package org.job.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Resume entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "resume", schema = "dbo", catalog = "job")
@Table(name = "resume", catalog = "job")
public class Resume implements java.io.Serializable {

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 2162730074572987944L;
	
	// Fields
	private Integer id;
	private Integer userId;
	private String expectCity;
	private String type;
	private String expectPosition;
	private String expectSalary;
	private String describe;
	private String name;
	private Date updateTime;

	// Constructors

	/** default constructor */
	public Resume() {
	}

	/** full constructor */
	public Resume(Integer userId, String expectCity, String type, String expectPosition, String expectSalary, String describe, String name, Date updateTime) {
		this.userId = userId;
		this.expectCity = expectCity;
		this.type = type;
		this.expectPosition = expectPosition;
		this.expectSalary = expectSalary;
		this.describe = describe;
		this.name = name;
		this.updateTime = updateTime;
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

	@Column(name = "userId")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "expectCity", length = 10)
	public String getExpectCity() {
		return this.expectCity;
	}

	public void setExpectCity(String expectCity) {
		this.expectCity = expectCity;
	}

	@Column(name = "type", length = 10)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "expectPosition", length = 20)
	public String getExpectPosition() {
		return this.expectPosition;
	}

	public void setExpectPosition(String expectPosition) {
		this.expectPosition = expectPosition;
	}

	@Column(name = "expectSalary", length = 20)
	public String getExpectSalary() {
		return this.expectSalary;
	}

	public void setExpectSalary(String expectSalary) {
		this.expectSalary = expectSalary;
	}

	@Column(name = "describeString", length = 8000)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "updateTime")
	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}