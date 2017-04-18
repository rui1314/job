package org.job.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Education entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "education", schema = "dbo", catalog = "job")
@Table(name = "education", catalog = "job")
public class Education implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String major;
	private Date beginDate;
	private Date endDate;
	private String describe;
	private Integer userId;
	private String education;

	// Constructors

	/** default constructor */
	public Education() {
	}

	/** full constructor */
	public Education(String name, String major, Date beginDate, Date endDate, String describe, Integer userId, String education) {
		this.name = name;
		this.major = major;
		this.beginDate = beginDate;
		this.endDate = endDate;
		this.describe = describe;
		this.userId = userId;
		this.education = education;
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

	@Column(name = "major", length = 50)
	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
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

	@Column(name = "describeString", length = 2000)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Column(name = "userId")
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "education", length = 20)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

}