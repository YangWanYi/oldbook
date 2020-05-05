package com.oldbook.dao;

import java.util.List;

import com.oldbook.domain.BookTypeDo;

public interface BookTypeDao {

	void insertBookType(BookTypeDo bookType);
	
	void updateBookType(BookTypeDo bookType);

	void deleteBookType(BookTypeDo bookType);

	BookTypeDo selectBookTypeById(int bookTypeId);

	List<BookTypeDo> listBookType(BookTypeDo bookType);
}
