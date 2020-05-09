package com.oldbook.action;

import com.opensymphony.xwork2.Action;

public class CommonAction implements Action{
	
	@Override
	public String execute() {
		return NONE;
	}

	public String toTopPage() {
		return SUCCESS;
	}
	
	public String toBottomPage() {
		return SUCCESS;
	}


}