package org.jj.service;

import java.util.List;

import org.jj.domain.Board;

public interface BoardService {
	
	public List<Board> getList();
	
	public int remove(int bno);
	
	public int modify(Board board);
	
	public Board read(int bno);
	
	public int write(Board board);
	
	

}
