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
 * 旧书实体类
 */
@Entity
@Table(name = "BOOKITEM") // 对应数据库的表名
public class BookItemDo implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // strategy=GenerationType.IDENTITY 自增长
	@Column(name = "ID") // 加上这个注解，这个id的含义就是告诉Hibernate，我这个id字段和数据库里面的字段是对应的，另外一个含义就是在正向工程当中，我有个user，表里面有个id字段。
	private Integer id;
	
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
	 * 书名
	 */
	@Column(name = "BOOKNAME")
	private String bookName;
	
	/**
	 * 类型id
	 */
	@Column(name = "BOOKTYPEID")
	private Integer bookTypeId;
	
	/**
	 * 父类型名称
	 */
	@Column(name = "PARENTBOOKTYPENAME")
	private String parentBookTypeName;
	
	/**
	 * 类型名称
	 */
	@Column(name = "BOOKTYPENAME")
	private String bookTypeName;
	
	/**
	 * 书本封面
	 */
	@Column(name = "COVER")
	private String cover;
	
	/**
	 * 售价
	 */
	@Column(name = "SALEPRICE")
	private Double salePrice;
	
	/**
	 * 库存
	 */
	@Column(name = "AMOUNT")
	private Integer amount;
	
	/**
	 * 作者
	 */
	@Column(name = "AUTHOR")
	private String author;
	
	/**
	 * 版次
	 */
	@Column(name = "EDITION")
	private String edition;
	
	/**
	 * 纸张
	 */
	@Column(name = "PAPER")
	private String paper;
	
	/**
	 * 出版社
	 */
	@Column(name = "PUBLISHER")
	private String publisher;
	
	/**
	 * 装帧
	 */
	@Column(name = "GRAPHIC")
	private String graphic;
	
	/**
	 * 页数
	 */
	@Column(name = "PAGINATION")
	private String pagination;
	
	/**
	 * ISBN
	 */
	@Column(name = "ISBN")
	private String isbn;
	
	/**
	 * 开本
	 */
	@Column(name = "BOOKSIZE")
	private String bookSize;
	
	/**
	 * 字数
	 */
	@Column(name = "WORDCOUNT")
	private String wordCount;
	
	/**
	 * 出版时间
	 */
	@Column(name = "PUBTIME")
	private Date pubtime;
	
	/**
	 * 上架时间
	 */
	@Column(name = "UPLOADTIME")
	private Date uploadTime;
	
	/**
	 * 简介
	 */
	@Column(name = "INTRODUCE")
	private String introduce;

	public Integer getId() {
		return id;
	}

	public Integer getShopId() {
		return shopId;
	}

	public String getShopName() {
		return shopName;
	}

	public String getBookName() {
		return bookName;
	}

	public String getCover() {
		return cover;
	}

	public Double getSalePrice() {
		return salePrice;
	}

	public Integer getAmount() {
		return amount;
	}

	public String getAuthor() {
		return author;
	}

	public String getEdition() {
		return edition;
	}

	public String getPaper() {
		return paper;
	}

	public String getPublisher() {
		return publisher;
	}

	public String getGraphic() {
		return graphic;
	}

	public String getPagination() {
		return pagination;
	}

	public String getIsbn() {
		return isbn;
	}

	public String getBookSize() {
		return bookSize;
	}

	public String getWordCount() {
		return wordCount;
	}

	public Date getPubtime() {
		return pubtime;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public void setPaper(String paper) {
		this.paper = paper;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public void setGraphic(String graphic) {
		this.graphic = graphic;
	}

	public void setPagination(String pagination) {
		this.pagination = pagination;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public void setBookSize(String bookSize) {
		this.bookSize = bookSize;
	}

	public void setWordCount(String wordCount) {
		this.wordCount = wordCount;
	}

	public void setPubtime(Date pubtime) {
		this.pubtime = pubtime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getBookTypeId() {
		return bookTypeId;
	}

	public String getBookTypeName() {
		return bookTypeName;
	}

	public void setBookTypeId(Integer bookTypeId) {
		this.bookTypeId = bookTypeId;
	}

	public void setBookTypeName(String bookTypeName) {
		this.bookTypeName = bookTypeName;
	}

	public String getParentBookTypeName() {
		return parentBookTypeName;
	}

	public void setParentBookTypeName(String parentBookTypeName) {
		this.parentBookTypeName = parentBookTypeName;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
}
