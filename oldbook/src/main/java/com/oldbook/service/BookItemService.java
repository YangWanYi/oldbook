package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.BookItemDo;

public interface BookItemService {
	
	void insertBookItem(BookItemDo bookItem);

	void updateBookItem(BookItemDo bookItem) throws Exception;

	void deleteBookItem(BookItemDo bookItem);

	BookItemDo selectBookItemById(int bookItemId);
	
	public List<BookItemDo> listBookItem(BookItemDo bookItem) throws Exception;
}
