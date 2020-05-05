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
 * 用户实体类
 */
@Entity
@Table(name = "user") // 对应数据库的表名
public class UserDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;

	/**
	 * 姓名
	 */
	@Column(name = "USERNAME")
	private String userName;

	/**
	 * 用户性别 0：男 1：女
	 */
	@Column(name = "GENDER")
	private Integer gender;

	/**
	 * 角色类型文本值
	 */
	@Column(name = "roleTypeX")
	private String roleTypeX;

	/**
	 * 用户名（登录账户）
	 */
	@Column(name = "ACCOUNT")
	private String account;

	/**
	 * 用户登录密码
	 */
	@Column(name = "PASSWORD")
	private String password;

	/**
	 * 联系方式
	 */
	@Column(name = "PHONENUM")
	private String phoneNum;

	/**
	 * 邮箱地址
	 */
	@Column(name = "EMAIL")
	private String email;

	/**
	 * 收货地址
	 */
	@Column(name = "ADDRESS")
	private String address;

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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getRoleTypeX() {
		return roleTypeX;
	}

	public void setRoleTypeX(String roleTypeX) {
		this.roleTypeX = roleTypeX;
	}
	
}
