package org.jj.service;

import java.util.List;

import org.jj.domain.Board;
import org.jj.domain.PageParam;

public interface BoardService {
	
	public List<Board> getList(PageParam pageParam);
	
	public int remove(PageParam pageParam);
	
	public int modify(Board board);
	
	public Board read(PageParam pageParam);
	
	public int write(Board board);
		
	public int getTotalCount(PageParam pageParam);

}
