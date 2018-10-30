package org.jj.mapper;

import java.util.List;

import org.jj.domain.Board;
import org.jj.domain.PageParam;

public interface BoardMapper {

	public List<Board> getList();
	
	public Board get(int bno); 
	
	public int insert(Board board);
	
	public int delete(int bno);
	
	public int modify(Board board);
	
	public List<Board> getlistPage(PageParam param);
	
	
}
