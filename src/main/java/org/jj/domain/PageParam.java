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
	private String keyword, type;
	private String[] types;
	
	public void setType(String type) {
		this.type = type;
		
		this.types = this.type.split("");
		
		if(this.type.length() == 0 || this.type == null) {
			this.types = null;
		}
		
	}
	
	public PageParam() {
		this.page=1;
		this.display=10;
	}

	
	public void setTotal(int total) {
		this.total = total;
		
		this.end=(int)(Math.ceil(this.page/PER))*10;
		this.start =this.end-9;
		
		if(this.display * this.end >=total){
			this.end=(int)Math.ceil(this.total/(double)this.display);
			this.next=false;
		}else {
			this.next=true;
		}
		if(this.start ==1) {
		this.prev = false;
		}else {this.prev = true;}
	}
	public int getSkip() {
		
		if(this.page==-1) {
			this.page=1;
		}
		return (this.page-1)*10;
		
	}
	
	public String getLink(String path) {
//		UriComponentsBuilder builder=UriComponentsBuilder.fromPath(path).queryParam("bno",this.bno).queryParam("page",this.page);
//		return builder.toUriString();
		
		return UriComponentsBuilder.fromPath(path)
		.queryParam("bno", this.bno)		
		.queryParam("page", this.page)
		.queryParam("total", this.total)
		.queryParam("keyword", this.keyword)
		.queryParam("type", this.type)
		.queryParam("display", this.display)
		.toUriString();
	}
	
	public static void main(String[] args) {
		PageParam pageParam = new PageParam();
		pageParam.setKeyword("깨지게");
		pageParam.setType("tcw");
		System.out.println(pageParam.getLink("redirect/board/read"));
	}
}
