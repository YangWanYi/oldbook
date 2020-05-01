package com.oldbook.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.oldbook.domain.TradeOrderDo;
import com.oldbook.service.TradeOrderService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ModelDriven;

public class TradeOrderAction implements Action, ModelDriven<TradeOrderDo> {

	@Autowired
	private TradeOrderService tradeOrderService;

	private TradeOrderDo tradeOrderData;
	private List<TradeOrderDo> rows;
	private int total;
	private String ids;

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

	public String saveOrUpdate() {
		try {
			if (this.tradeOrderData.getId() != null) { // 存在主键 走编辑
				this.tradeOrderService.updateTradeOrder(this.tradeOrderData);
			} else { // 不存在主键 走新增
				this.tradeOrderService.insertTradeOrder(this.tradeOrderData);
			}
			return NONE;
		} catch (Exception e) {
			return ERROR;
		}
	}

	public String deleteTradeOrder() {
		try {
			if (StringUtils.isNoneEmpty(ids)) {
				String[] idsArray = ids.split(",");
				TradeOrderDo TradeOrder = new TradeOrderDo();
				for (int i = 0; i < idsArray.length; i++) {
					if (StringUtils.isNoneEmpty(idsArray[i])) {
						TradeOrder.setId(Integer.parseInt(idsArray[i]));
						this.tradeOrderService.deleteTradeOrder(TradeOrder);
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

}