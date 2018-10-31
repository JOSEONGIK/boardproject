package org.jj.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageParam {
	
	private static final double PER = 10.0;
	private int page;
	private int display;
	private int bno;
	private int total,start,end;
	private boolean prev,next;
	
	public PageParam() {
		this.page=1;
		this.display=10;
	}

	
	public void setTotal(int total) {
		this.total = total;
		
		this.end=(int)(Math.ceil(this.page/PER))*10;
		this.start =this.end-9;
		
		if((this.end *10) >=total){
			this.end=(int)(Math.ceil(total/10.0));
			this.next=false;
		}else {
			this.next=true;
		}
		this.prev = this.start!=1;
	}
	public int getSkip() {
		return (this.page-1)*10;
		
	}
	
	public String getLink(String path) {
//		UriComponentsBuilder builder=UriComponentsBuilder.fromPath(path).queryParam("bno",this.bno).queryParam("page",this.page);
//		return builder.toUriString();
		
		return UriComponentsBuilder.fromPath(path)
		.queryParam("bno", this.bno)
		.queryParam("page", this.page)
		.toUriString();
	}
	
	public static void manin(String[] args) {
		PageParam obj = new PageParam();
		
		obj.setBno(123);
		obj.setPage(3);
		System.out.println(obj.getLink("redirect/board/read"));
	}
}
