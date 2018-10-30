package org.jj.domain;

import lombok.Data;

@Data
public class PageParam {
	
	private int pageNum;
	private int amount;
	
	public PageParam() {

		this.pageNum = 1;
		this.amount = 10;
	}
	
	

}
