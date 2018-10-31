package org.jj.service;

import java.util.List;

import org.jj.domain.Board;
import org.jj.domain.PageParam;
import org.jj.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	


	@Override
	public int remove(PageParam pageParam) {
		// TODO Auto-generated method stub
		return mapper.delete(pageParam);
	}

	@Override
	public int modify(Board board) {
		// TODO Auto-generated method stub
		return mapper.modify(board);
	}

	@Override
	public Board read(PageParam pageParam) {
		// TODO Auto-generated method stub
		return mapper.get(pageParam);
	}

	@Override
	public int write(Board board) {
		// TODO Auto-generated method stub
		return mapper.insert(board);
	}

	@Override
	public int getTotalCount(PageParam pageParam) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(pageParam);
	}

	@Override
	public List<Board> getList(PageParam pageParam) {
		// TODO Auto-generated method stub
		return mapper.getList(pageParam);
	}

}
