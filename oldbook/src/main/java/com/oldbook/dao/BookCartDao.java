package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.BookCartDo;

public interface BookCartDao {

	void insertBookCart(BookCartDo bookCart);
	
	void updateBookCart(BookCartDo bookCart);

	void deleteBookCart(BookCartDo bookCart);

	BookCartDo selectBookCartById(int bookCartId);

	List<BookCartDo> listBookCart(BookCartDo bookCart);
}
