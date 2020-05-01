package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.TradeOrderDao;
import com.oldbook.domain.TradeOrderDo;
import com.oldbook.service.TradeOrderService;

@Transactional
@Service("TradeOrderService")
public class TradeOrderServiceImpl implements TradeOrderService {

	@Autowired
	private TradeOrderDao TradeOrderDao;

	@Override
	public void insertTradeOrder(TradeOrderDo tradeOrder) {
		TradeOrderDao.insertTradeOrder(tradeOrder);
	}

	@Override
	public void updateTradeOrder(TradeOrderDo tradeOrder) throws Exception {
		TradeOrderDao.updateTradeOrder(tradeOrder);
	}

	@Override
	public void deleteTradeOrder(TradeOrderDo tradeOrder) {
		TradeOrderDao.deleteTradeOrder(tradeOrder);
	}

	@Override
	public TradeOrderDo selectTradeOrderById(int tradeOrderId) {
		return TradeOrderDao.selectTradeOrderById(tradeOrderId);
	}

	@Override
	public List<TradeOrderDo> listTradeOrder(TradeOrderDo tradeOrder) throws Exception {
		return TradeOrderDao.listTradeOrder(tradeOrder);
	}

}
