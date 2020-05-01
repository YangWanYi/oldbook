package com.oldbook.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 订单实体类
 */
@Entity
@Table(name = "TRADEORDER") // 对应数据库的表名
public class TradeOrderDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;

	/**
	 * 姓名ID
	 */
	@Column(name = "USERID")
	private Integer userId;

	/**
	 * 姓名
	 */
	@Column(name = "USERNAME")
	private String userName;
	
	/**
	 * 订单状态
	 */
	@Column(name = "ORDERSTATE")
	private Integer orderState;
	
	/**
	 * 订单状态文本值
	 */
	@Column(name = "ORDERSTATEX")
	private Integer orderStateX;

	/**
	 * 总额
	 */
	@Column(name = "TOTALPRICE")
	private Double totalPrice;
	
	/**
	 * 邮费
	 */
	@Column(name = "POSTAGE")
	private Integer postage;

	/**
	 * 预计送达时间
	 */
	@Column(name = "PLANDELIVERYTIME")
	private Date planDeliveryTime;
	
	/**
	 * 下单时间
	 */
	@Column(name = "CREATETIME")
	private Date createTime;
	
	/**
	 * 付款时间
	 */
	@Column(name = "PAYTIME")
	private Date payTime;
	
	/**
	 * 修改人
	 */
	@Column(name = "updateId")
	private Integer updateId;

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getOrderState() {
		return orderState;
	}

	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}

	public Integer getOrderStateX() {
		return orderStateX;
	}

	public void setOrderStateX(Integer orderStateX) {
		this.orderStateX = orderStateX;
	}

	public Double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Integer getPostage() {
		return postage;
	}

	public void setPostage(Integer postage) {
		this.postage = postage;
	}

	public Date getPlanDeliveryTime() {
		return planDeliveryTime;
	}

	public void setPlanDeliveryTime(Date planDeliveryTime) {
		this.planDeliveryTime = planDeliveryTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public Integer getUpdateId() {
		return updateId;
	}

	public void setUpdateId(Integer updateId) {
		this.updateId = updateId;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
