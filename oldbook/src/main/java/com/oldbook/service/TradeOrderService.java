package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.TradeOrderDo;

public interface TradeOrderService {
	
	void insertTradeOrder(TradeOrderDo tradeOrder);

	void updateTradeOrder(TradeOrderDo tradeOrder) throws Exception;

	void deleteTradeOrder(TradeOrderDo tradeOrder);

	TradeOrderDo selectTradeOrderById(int tradeOrderId);
	
	public List<TradeOrderDo> listTradeOrder(TradeOrderDo tradeOrder) throws Exception;
}
