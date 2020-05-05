package com.oldbook.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.BookCartDo;
import com.oldbook.domain.BookItemDo;
import com.oldbook.domain.TradeOrderDo;
import com.oldbook.domain.UserDo;
import com.oldbook.service.BookCartService;
import com.oldbook.service.BookItemService;
import com.oldbook.service.TradeOrderService;
import com.oldbook.utils.CommonConstants;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

public class TradeOrderAction implements Action, ModelDriven<TradeOrderDo> {

	@Autowired
	private TradeOrderService tradeOrderService;
	@Autowired
	private BookCartService bookCartService;
	@Autowired
	private BookItemService bookItemService;

	private TradeOrderDo tradeOrderData;
	private List<TradeOrderDo> rows;
	private int total;
	private String ids;
	private String cartId;

	@Override
	public TradeOrderDo getModel() {
		this.tradeOrderData = new TradeOrderDo();
		return this.tradeOrderData;
	}

	@Override
	public String execute() {
		try {
			List<TradeOrderDo> TradeOrderList = this.tradeOrderService.listTradeOrder(this.tradeOrderData);
			this.rows = TradeOrderList;
			this.total = TradeOrderList.size();
			return NONE;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}
	
	public String saveOrUpdateTradeOrder() {
		try {
			if (this.tradeOrderData.getId() != null) { // 存在主键 走编辑
				ActionContext actionContext = ActionContext.getContext();
				UserDo user = (UserDo) actionContext.getSession().get("user");
				if(user!=null) {
					this.tradeOrderData.setUpdateId(user.getId());
					this.tradeOrderData.setUpdateTime(new Date());;
				}
				this.tradeOrderService.updateTradeOrder(this.tradeOrderData);
			} else { // 不存在主键 走新增
				this.tradeOrderService.insertTradeOrder(this.tradeOrderData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	/**
	 * 支付订单
	 * @return
	 */
	public String payTradeOrder() {
		try {
			if (this.tradeOrderData.getId() != null) { 
				this.tradeOrderData = this.tradeOrderService.selectTradeOrderById(this.tradeOrderData.getId());
				if(this.tradeOrderData!=null) {
					this.tradeOrderData.setPayTime(new Date());
					this.tradeOrderData.setOrderState(CommonConstants.OrderStateType.PAID.value());// 已支付
					this.tradeOrderService.updateTradeOrder(this.tradeOrderData);
				}
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteTradeOrder() {
		try {
			if (this.tradeOrderData.getId() != null) {
				TradeOrderDo tradeOrderDo = this.tradeOrderService.selectTradeOrderById(this.tradeOrderData.getId());
				if(tradeOrderDo!=null) {
					if(tradeOrderDo.getCartId()!=null) {
						BookCartDo bookCartDo = this.bookCartService.selectBookCartById(tradeOrderDo.getCartId());
						if(bookCartDo!=null) {
							// 恢复库存
							if(bookCartDo.getBookId()!=null) {
								BookItemDo bookItemDo = this.bookItemService.selectBookItemById(bookCartDo.getBookId());
								if(bookItemDo!=null) {
									bookItemDo.setAmount(bookItemDo.getAmount()+1);
									this.bookItemService.updateBookItem(bookItemDo);
								}
							}
							// 删除购物车
							this.bookCartService.deleteBookCart(bookCartDo);
						}
					}
				}
				// 删除订单
				this.tradeOrderService.deleteTradeOrder(this.tradeOrderData);
				return NONE;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String toUpdateTradeOrderPage() {
		try {
			if (this.tradeOrderData.getId() != null) {
				this.tradeOrderData = this.tradeOrderService.selectTradeOrderById(this.tradeOrderData.getId());
				return SUCCESS;
			} else {
				return ERROR;
			}
		} catch (Exception e) {
			return ERROR;
		}
	}
	
	public String toCustomerTradeOrderPage() {
		return ERROR;
	}

	public List<TradeOrderDo> getRows() {
		return rows;
	}

	public void setRows(List<TradeOrderDo> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public TradeOrderDo getTradeOrderData() {
		return tradeOrderData;
	}

	public void setTradeOrderData(TradeOrderDo tradeOrderData) {
		this.tradeOrderData = tradeOrderData;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

}