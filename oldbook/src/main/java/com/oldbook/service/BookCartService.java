package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.BookCartDo;

public interface BookCartService {
	
	void insertBookCart(BookCartDo bookCart);

	void updateBookCart(BookCartDo bookCart) throws Exception;

	void deleteBookCart(BookCartDo bookCart);

	BookCartDo selectBookCartById(int bookCartId);
	
	public List<BookCartDo> listBookCart(BookCartDo bookCart) throws Exception;
}
