package com.oldbook.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookItemDo;
import com.oldbook.domain.BookTypeDo;
import com.oldbook.domain.ShopDo;
import com.oldbook.service.BookItemService;
import com.oldbook.service.BookTypeService;
import com.oldbook.service.ShopService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class BookItemAction implements Action, ModelDriven<BookItemDo> {

	@Autowired
	private BookItemService bookItemService;
	@Autowired
	private BookTypeService bookTypeService;
	@Autowired
	private ShopService shopService;

	private BookItemDo bookItemData;
	private ShopDo shopData;
	private List<BookItemDo> rows;
	private int total;
	private String ids;
	private String path;
	private Integer parentTypeId;

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

	public String saveOrUpdateBookItem() {
		try {
			if(this.parentTypeId!=null) {
				BookTypeDo pBookTypeDo = bookTypeService.selectBookTypeById(this.parentTypeId);
				if(pBookTypeDo!=null) {
					this.bookItemData.setParentBookTypeName(pBookTypeDo.getTypeName());
				}
			}
			if(this.bookItemData.getBookTypeId()!=null) {
				BookTypeDo bookTypeDo = bookTypeService.selectBookTypeById(this.bookItemData.getBookTypeId());
				if(bookTypeDo!=null) {
					this.bookItemData.setBookTypeName(bookTypeDo.getTypeName());
				}
			}
			if (this.bookItemData.getId() != null) { // 存在主键 走编辑
				this.bookItemService.updateBookItem(this.bookItemData);
			} else { // 不存在主键 走新增
				ActionContext actionContext = ActionContext.getContext();
				ShopDo shop = (ShopDo) actionContext.getSession().get("shop");
				if(shop!=null) {
					this.bookItemData.setShopId(shop.getId());
					this.bookItemData.setShopName(shop.getShopName());
				}
				
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
	
	public String toViewBookItemPage() {
		try {
			if (this.bookItemData.getId() != null) {
				this.bookItemData = this.bookItemService.selectBookItemById(this.bookItemData.getId());
				if(this.bookItemData!=null&&this.bookItemData.getShopId()!=null) {
					this.shopData = shopService.selectShopById(this.bookItemData.getShopId());
				}
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	/**
	 * 去列表页面
	 * 
	 * @return
	 */
	public String toBookItemListPage() {
		try {
			ActionContext ac = ActionContext.getContext();
			ServletContext sc = (ServletContext) ac.get(ServletActionContext.SERVLET_CONTEXT);
			this.path = sc.getContextPath().concat("/ui/imgs/upload/");
			System.out.println(this.path);
			return SUCCESS;
		} catch (Exception e) {
			return ERROR;
		}
	}
	public String toAddBookItemPage() {
		return SUCCESS;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getParentTypeId() {
		return parentTypeId;
	}

	public void setParentTypeId(Integer parentTypeId) {
		this.parentTypeId = parentTypeId;
	}

	public ShopDo getShopData() {
		return shopData;
	}

	public void setShopData(ShopDo shopData) {
		this.shopData = shopData;
	}

}