package org.job.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ResumeDelivery entity. @author MyEclipse Persistence Tools
 */
@Entity
//@Table(name = "resumeDelivery", schema = "dbo", catalog = "job")
@Table(name = "resumeDelivery", catalog = "job")
public class ResumeDelivery implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer workId;
	private Date createDate;
	private Integer status;

	// Constructors

	/** default constructor */
	public ResumeDelivery() {
	}

	/** full constructor */
	public ResumeDelivery(Integer userId, Integer workId, Date createDate, Integer status) {
		this.userId = userId;
		this.workId = workId;
		this.createDate = createDate;
		this.status = status;
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
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	

	@Column(name = "workId")
	public Integer getWorkId() {
		return this.workId;
	}


	public void setWorkId(Integer workId) {
		this.workId = workId;
	}

	@Column(name = "createDate", length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Column(name = "status")
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}