package com.oldbook.domain;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 店铺实体类
 */
/**
 * @author 13917
 *
 */
@Entity
@Table(name = "SHOP") // 对应数据库的表名
public class ShopDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;

	/**
	 * 店主ID
	 */
	@Column(name = "userId")
	private Integer userId;
	
	/**
	 * 店主姓名
	 */
	@Column(name = "USERNAME")
	private String userName;
	
	/**
	 * 店铺名称
	 */
	@Column(name = "SHOPNAME")
	private String shopName;

	/**
	 * 店铺状态
	 */
	@Column(name = "SHOPSTATE")
	private String shopState;
	
	/**
	 * 邮费
	 */
	@Column(name = "POSTAGE")
	private Integer postage;
	
	/**
	 * 申请开店时间
	 */
	@Column(name = "APPLYTIME")
	private Date applyTime;
	
	/**
	 * 店铺联系方式
	 */
	@Column(name = "CONTACTNUM")
	private String contactNum;
	
	/**
	 * 店铺地址
	 */
	@Column(name = "ADDRESS")
	private String address;
	
	/**
	 * 店铺公告
	 */
	@Column(name = "NOTICE")
	private String notice;

	/**
	 * 修改时间
	 */
	@Column(name = "UPDATETIME")
	private Date updateTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getShopState() {
		return shopState;
	}

	public void setShopState(String shopState) {
		this.shopState = shopState;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public String getContactNum() {
		return contactNum;
	}

	public void setContactNum(String contactNum) {
		this.contactNum = contactNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getPostage() {
		return postage;
	}

	public void setPostage(Integer postage) {
		this.postage = postage;
	}
	
}
