package org.job.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "news", schema = "dbo", catalog = "job")
@Table(name = "news", catalog = "job")
public class News implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String describe;
	private Date createDate;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** full constructor */
	public News(String name, String describe, Date createDate) {
		this.name = name;
		this.describe = describe;
		this.createDate = createDate;
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

	@Column(name = "name", length = 200)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "describeString", length = 5000)
	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

    @Temporal(TemporalType.DATE) 
	//@Column(name = "createDate", length = 23)
    @Column(name = "createDate")
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}