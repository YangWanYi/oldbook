package com.oldbook.service;

import java.util.List;

import com.oldbook.domain.BookTypeDo;

public interface BookTypeService {
	
	void insertBookType(BookTypeDo bookType);

	void updateBookType(BookTypeDo bookType) throws Exception;

	void deleteBookType(BookTypeDo bookType);

	BookTypeDo selectBookTypeById(int bookTypeId);
	
	public List<BookTypeDo> listBookType(BookTypeDo bookType) throws Exception;
}
