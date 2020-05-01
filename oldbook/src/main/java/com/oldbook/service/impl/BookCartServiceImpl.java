package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.BookCartDao;
import com.oldbook.domain.BookCartDo;
import com.oldbook.service.BookCartService;

@Transactional
@Service("BookCartService")
public class BookCartServiceImpl implements BookCartService {

	@Autowired
	private BookCartDao BookCartDao;

	@Override
	public void insertBookCart(BookCartDo bookCart) {
		BookCartDao.insertBookCart(bookCart);
	}

	@Override
	public void updateBookCart(BookCartDo bookCart) throws Exception {
		BookCartDao.updateBookCart(bookCart);
	}

	@Override
	public void deleteBookCart(BookCartDo bookCart) {
		BookCartDao.deleteBookCart(bookCart);
	}

	@Override
	public BookCartDo selectBookCartById(int bookCartId) {
		return BookCartDao.selectBookCartById(bookCartId);
	}

	@Override
	public List<BookCartDo> listBookCart(BookCartDo bookCart) throws Exception {
		return BookCartDao.listBookCart(bookCart);
	}

}
