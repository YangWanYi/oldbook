package com.oldbook.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookCartDo;
import com.oldbook.domain.BookItemDo;
import com.oldbook.domain.ShopDo;
import com.oldbook.domain.TradeOrderDo;
import com.oldbook.domain.UserDo;
import com.oldbook.service.BookCartService;
import com.oldbook.service.BookItemService;
import com.oldbook.service.ShopService;
import com.oldbook.service.TradeOrderService;
import com.oldbook.utils.CommonConstants;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class BookCartAction implements Action, ModelDriven<BookCartDo> {

	@Autowired
	private BookCartService bookCartService;
	@Autowired
	private BookItemService bookItemService;
	@Autowired
	private TradeOrderService tradeOrderService;
	@Autowired
	private ShopService shopService;

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

	public String saveOrUpdateBookCart() {
		try {
			if (this.bookCartData.getId() != null) { // 存在主键 走编辑
				this.bookCartService.updateBookCart(this.bookCartData);
			} else { // 不存在主键 走新增
				this.bookCartData.setSubmitOrder(CommonConstants.SubmitOrderType.NO.value());
				ActionContext actionContext = ActionContext.getContext();
				UserDo user = (UserDo) actionContext.getSession().get("user");
				if(user!=null) {
					this.bookCartData.setUserId(user.getId());
					this.bookCartData.setUserName(user.getUserName()==null?user.getAccount():user.getUserName());
				}
				// 减库存
				if(this.bookCartData.getBookId()!=null) {
					BookItemDo bookItemDo = this.bookItemService.selectBookItemById(this.bookCartData.getBookId());
					if(bookItemDo!=null) {
						bookItemDo.setAmount(bookItemDo.getAmount()-1);
						this.bookItemService.updateBookItem(bookItemDo);
						this.bookCartData.setShopId(bookItemDo.getShopId());
						this.bookCartData.setShopName(bookItemDo.getShopName());
						this.bookCartData.setBookName(bookItemDo.getBookName());
						this.bookCartData.setUnitPrice(bookItemDo.getSalePrice());
						this.bookCartData.setAmount(1);
					}
				}
				this.bookCartService.insertBookCart(this.bookCartData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteBookCart() {
		try {
			if (this.bookCartData.getId() != null) { 
				// 恢复库存
				BookCartDo bookCartDo = this.bookCartService.selectBookCartById(this.bookCartData.getId());
				if(bookCartDo!=null&&bookCartDo.getBookId()!=null) {
					BookItemDo bookItemDo = this.bookItemService.selectBookItemById(bookCartDo.getBookId());
					if(bookItemDo!=null) {
						bookItemDo.setAmount(bookItemDo.getAmount()+1);
						this.bookItemService.updateBookItem(bookItemDo);
					}
				}
				// 删除购物车
				this.bookCartService.deleteBookCart(this.bookCartData);
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	/**
	 * 提交订单
	 * @return
	 */
	public String submitOrder() {
		try {
			if (this.bookCartData.getId() != null) { 
				this.bookCartData = this.bookCartService.selectBookCartById(this.bookCartData.getId());
				if(this.bookCartData!=null) {
					this.bookCartData.setSubmitOrder(CommonConstants.SubmitOrderType.YES.value());
					this.bookCartService.updateBookCart(this.bookCartData);// 更改购物车状态
					// 增加订单信息
					TradeOrderDo tradeOrderDo = new TradeOrderDo();
					ActionContext actionContext = ActionContext.getContext();
					UserDo user = (UserDo) actionContext.getSession().get("user");
					if(user!=null) {
						tradeOrderDo.setUserId(user.getId());
						tradeOrderDo.setUserName(user.getUserName()==null?user.getAccount():user.getUserName());
					}
					tradeOrderDo.setBookName(this.bookCartData.getBookName());
					tradeOrderDo.setOrderState(CommonConstants.OrderStateType.NONPAYMENT.value()); // 未支付
					tradeOrderDo.setTotalPrice(this.bookCartData.getUnitPrice());
					if(this.bookCartData.getBookId()!=null) {
						ShopDo shopDo = this.shopService.selectShopById(this.bookCartData.getShopId());
						if(shopDo!=null) {
							tradeOrderDo.setPostage(shopDo.getPostage());
						}
					}
					tradeOrderDo.setCartId(this.bookCartData.getId());
					tradeOrderDo.setCreateTime(new Date());
					tradeOrderService.insertTradeOrder(tradeOrderDo);
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
	
	public String toCustomerBookCartPage() {
		return SUCCESS;
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