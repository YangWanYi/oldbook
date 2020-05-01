package com.oldbook.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookCartDo;
import com.oldbook.service.BookCartService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class BookCartAction implements Action, ModelDriven<BookCartDo> {

	@Autowired
	private BookCartService bookCartService;

	private BookCartDo bookCartData;
	private List<BookCartDo> rows;
	private int total;
	private String ids;

	@Override
	public BookCartDo getModel() {
		this.bookCartData = new BookCartDo();
		return this.bookCartData;
	}

	@Override
	public String execute() {
		try {
			List<BookCartDo> BookCartList = this.bookCartService.listBookCart(this.bookCartData);
			this.rows = BookCartList;
			this.total = BookCartList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String saveOrUpdate() {
		try {
			if (this.bookCartData.getId() != null) { // 存在主键 走编辑
				this.bookCartService.updateBookCart(this.bookCartData);
			} else { // 不存在主键 走新增
				this.bookCartService.insertBookCart(this.bookCartData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteBookCart() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				BookCartDo BookCart = new BookCartDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						BookCart.setId(Integer.parseInt(idsArray[i]));
						this.bookCartService.deleteBookCart(BookCart);
					}
				}
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String toUpdateBookCartPage() {
		try {
			if (this.bookCartData.getId() != null) {
				this.bookCartData = this.bookCartService.selectBookCartById(this.bookCartData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public List<BookCartDo> getRows() {
		return rows;
	}

	public void setRows(List<BookCartDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public BookCartDo getBookCartData() {
		return bookCartData;
	}

	public void setBookCartData(BookCartDo bookCartData) {
		this.bookCartData = bookCartData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}