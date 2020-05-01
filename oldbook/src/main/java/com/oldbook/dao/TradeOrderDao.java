package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.TradeOrderDo;

public interface TradeOrderDao {

	void insertTradeOrder(TradeOrderDo tradeOrder);
	
	void updateTradeOrder(TradeOrderDo tradeOrder);

	void deleteTradeOrder(TradeOrderDo tradeOrder);

	TradeOrderDo selectTradeOrderById(int tradeOrderId);

	List<TradeOrderDo> listTradeOrder(TradeOrderDo tradeOrder);
}
