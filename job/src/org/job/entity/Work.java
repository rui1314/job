package org.job.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Work entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "work", schema = "dbo", catalog = "job")
@Table(name = "work", catalog = "job")
public class Work implements java.io.Serializable {

	// Fields

	private Integer id;
	private String type;
	private String name;
	private String department;
	private String nature;
	private String salary;
	private String city;
	private String workExp;
	private String education;
	private String advantage;
	private String describe;
	private Date createDate;
	private String address;
	private Integer userId;

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** full constructor */
	public Work(String type, String name, String department, String nature, String salary, String city, String workExp, String education, String advantage, String describe, Date createDate, String address) {
		this.type = type;
		this.name = name;
		this.department = department;
		this.nature = nature;
		this.salary = salary;
		this.city = city;
		this.workExp = workExp;
		this.education = education;
		this.advantage = advantage;
		this.describe = describe;
		this.createDate = createDate;
		this.address = address;
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

	@Column(name = "type", length = 200)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "department", length = 50)
	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Column(name = "nature", length = 10)
	public String getNature() {
		return this.nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	@Column(name = "salary", length = 100)
	public String getSalary() {
		return this.salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	@Column(name = "city", length = 50)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "workExp",length=50)
	public String getWorkExp() {
		return this.workExp;
	}

	public void setWorkExp(String workExp) {
		this.workExp = workExp;
	}

	@Column(name = "education",length=10)
	public String getEducation() {
		return this.education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	@Column(name = "advantage", length = 200)
	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	@Column(name = "describeString", length = 5000)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	@Column(name = "createDate", length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "address", length = 300)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name="userId")
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	
}