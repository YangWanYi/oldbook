package com.oldbook.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 购物车实体类
 */
@Entity
@Table(name = "BOOKCART") // 对应数据库的表名
public class BookCartDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;
	
	/**
	 * 客户ID
	 */
	@Column(name = "userId")
	private Integer userId;
	
	/**
	 * 客户姓名
	 */
	@Column(name = "USERNAME")
	private String userName;

	/**
	 * 店铺ID
	 */
	@Column(name = "SHOPID")
	private Integer shopId;
	
	/**
	 * 店铺名称
	 */
	@Column(name = "SHOPNAME")
	private String shopName;
	
	/**
	 * 书本id
	 */
	@Column(name = "BOOKID")
	private Integer bookId;
	
	/**
	 * 书本名称
	 */
	@Column(name = "BOOKNAME")
	private String bookName;
	
	/**
	 * 单价
	 */
	@Column(name = "UNITPRICE")
	private Double unitPrice;
	
	/**
	 * 采购数量
	 */
	@Column(name = "AMOUNT")
	private Integer amount;
	
	/**
	 * 是否提交订单
	 */
	@Column(name = "SUBMITORDER")
	private String submitOrder;

	public Integer getId() {
		return id;
	}

	public Integer getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public Integer getShopId() {
		return shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public Integer getBookId() {
		return bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getSubmitOrder() {
		return submitOrder;
	}

	public void setSubmitOrder(String submitOrder) {
		this.submitOrder = submitOrder;
	}
	
}
