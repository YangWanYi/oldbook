package com.oldbook.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookTypeDo;
import com.oldbook.service.BookTypeService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class BookTypeAction implements Action, ModelDriven<BookTypeDo> {

	@Autowired
	private BookTypeService bookTypeService;

	private BookTypeDo bookTypeData;
	private List<BookTypeDo> rows;
	private int total;
	private String ids;

	@Override
	public BookTypeDo getModel() {
		this.bookTypeData = new BookTypeDo();
		return this.bookTypeData;
	}

	@Override
	public String execute() {
		try {
			List<BookTypeDo> bookTypeList = this.bookTypeService.listBookType(this.bookTypeData);
			this.rows = bookTypeList;
			this.total = bookTypeList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	public String saveOrUpdateBookType() {
		try {
			if (this.bookTypeData.getId() != null) { // 存在主键 走编辑
				this.bookTypeData.setUpdateTime(new Date());
				this.bookTypeService.updateBookType(this.bookTypeData);
			} else { // 不存在主键 走新增
				this.bookTypeData.setCreateTime(new Date());
				if(this.bookTypeData.getParentTypeId()!=null) {
					BookTypeDo bookTypeDo = this.bookTypeService.selectBookTypeById(this.bookTypeData.getParentTypeId());
					if(bookTypeDo!=null) {
						this.bookTypeData.setParentTypeName(bookTypeDo.getTypeName());
					}
				}
				this.bookTypeService.insertBookType(this.bookTypeData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteBookType() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				BookTypeDo BookType = new BookTypeDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						BookType.setId(Integer.parseInt(idsArray[i]));
						this.bookTypeService.deleteBookType(BookType);
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

	public String toUpdateBookTypePage() {
		try {
			if (this.bookTypeData.getId() != null) {
				this.bookTypeData = this.bookTypeService.selectBookTypeById(this.bookTypeData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public List<BookTypeDo> getRows() {
		return rows;
	}

	public void setRows(List<BookTypeDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public BookTypeDo getBookTypeData() {
		return bookTypeData;
	}

	public void setBookTypeData(BookTypeDo bookTypeData) {
		this.bookTypeData = bookTypeData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}