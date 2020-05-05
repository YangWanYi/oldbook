package com.oldbook.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 图书类型实体类
 */
@Entity
@Table(name = "BOOKTYPE") // 对应数据库的表名
public class BookTypeDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;
	
	/**
	 * 父类型id
	 */
	@Column(name = "PARENTTYPEID")
	private Integer parentTypeId;
	
	/**
	 * 父类型名称
	 */
	@Column(name = "PARENTTYPENAME")
	private String parentTypeName;
	
	/**
	 * 类型名称
	 */
	@Column(name = "TYPENAME")
	private String typeName;
	
	/**
	 * 创建时间
	 */
	@Column(name = "CREATETIME")
	private Date createTime;
	
	/**
	 * 修改时间
	 */
	@Column(name = "UPDATETIME")
	private Date updateTime;
	
	@Transient
	private String pNameForSearch;

	public Integer getId() {
		return id;
	}

	public String getTypeName() {
		return typeName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getParentTypeId() {
		return parentTypeId;
	}

	public void setParentTypeId(Integer parentTypeId) {
		this.parentTypeId = parentTypeId;
	}

	public String getParentTypeName() {
		return parentTypeName;
	}

	public void setParentTypeName(String parentTypeName) {
		this.parentTypeName = parentTypeName;
	}

	public String getpNameForSearch() {
		return pNameForSearch;
	}

	public void setpNameForSearch(String pNameForSearch) {
		this.pNameForSearch = pNameForSearch;
	}
	

}
