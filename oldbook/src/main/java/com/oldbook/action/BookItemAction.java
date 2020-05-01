package com.oldbook.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookItemDo;
import com.oldbook.service.BookItemService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class BookItemAction implements Action, ModelDriven<BookItemDo> {

	@Autowired
	private BookItemService bookItemService;

	private BookItemDo bookItemData;
	private List<BookItemDo> rows;
	private int total;
	private String ids;

	@Override
	public BookItemDo getModel() {
		this.bookItemData = new BookItemDo();
		return this.bookItemData;
	}

	@Override
	public String execute() {
		try {
			List<BookItemDo> BookItemList = this.bookItemService.listBookItem(this.bookItemData);
			this.rows = BookItemList;
			this.total = BookItemList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String saveOrUpdate() {
		try {
			if (this.bookItemData.getId() != null) { // 存在主键 走编辑
				this.bookItemService.updateBookItem(this.bookItemData);
			} else { // 不存在主键 走新增
				this.bookItemService.insertBookItem(this.bookItemData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteBookItem() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				BookItemDo BookItem = new BookItemDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						BookItem.setId(Integer.parseInt(idsArray[i]));
						this.bookItemService.deleteBookItem(BookItem);
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

	public String toUpdateBookItemPage() {
		try {
			if (this.bookItemData.getId() != null) {
				this.bookItemData = this.bookItemService.selectBookItemById(this.bookItemData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public List<BookItemDo> getRows() {
		return rows;
	}

	public void setRows(List<BookItemDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public BookItemDo getBookItemData() {
		return bookItemData;
	}

	public void setBookItemData(BookItemDo bookItemData) {
		this.bookItemData = bookItemData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}