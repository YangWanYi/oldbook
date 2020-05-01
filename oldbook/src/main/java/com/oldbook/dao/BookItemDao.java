package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.BookItemDo;

public interface BookItemDao {

	void insertBookItem(BookItemDo bookItem);
	
	void updateBookItem(BookItemDo bookItem);

	void deleteBookItem(BookItemDo bookItem);

	BookItemDo selectBookItemById(int bookItemId);

	List<BookItemDo> listBookItem(BookItemDo bookItem);
}
