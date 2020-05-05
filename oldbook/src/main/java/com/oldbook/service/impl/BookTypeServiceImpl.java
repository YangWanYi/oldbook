package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.BookTypeDao;
import com.oldbook.domain.BookTypeDo;
import com.oldbook.service.BookTypeService;

@Transactional
@Service("BookTypeService")
public class BookTypeServiceImpl implements BookTypeService {
	@Autowired
	private BookTypeDao bookTypeDao;

	@Override
	public void insertBookType(BookTypeDo bookType) {
		bookTypeDao.insertBookType(bookType);
	}

	@Override
	public void updateBookType(BookTypeDo bookType) throws Exception {
		bookTypeDao.updateBookType(bookType);
	}

	@Override
	public void deleteBookType(BookTypeDo bookType) {
		bookTypeDao.deleteBookType(bookType);
	}

	@Override
	public BookTypeDo selectBookTypeById(int bookTypeId) {
		return bookTypeDao.selectBookTypeById(bookTypeId);
	}

	@Override
	public List<BookTypeDo> listBookType(BookTypeDo bookType) throws Exception {
		return bookTypeDao.listBookType(bookType);
	}

}
