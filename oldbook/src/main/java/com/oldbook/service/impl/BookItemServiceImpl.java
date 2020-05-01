package com.oldbook.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oldbook.dao.BookItemDao;
import com.oldbook.domain.BookItemDo;
import com.oldbook.service.BookItemService;

@Transactional
@Service("BookItemService")
public class BookItemServiceImpl implements BookItemService {

	@Autowired
	private BookItemDao BookItemDao;

	@Override
	public void insertBookItem(BookItemDo bookItem) {
		BookItemDao.insertBookItem(bookItem);
	}

	@Override
	public void updateBookItem(BookItemDo bookItem) throws Exception {
		BookItemDao.updateBookItem(bookItem);
	}

	@Override
	public void deleteBookItem(BookItemDo bookItem) {
		BookItemDao.deleteBookItem(bookItem);
	}

	@Override
	public BookItemDo selectBookItemById(int bookItemId) {
		return BookItemDao.selectBookItemById(bookItemId);
	}

	@Override
	public List<BookItemDo> listBookItem(BookItemDo bookItem) throws Exception {
		return BookItemDao.listBookItem(bookItem);
	}

}
