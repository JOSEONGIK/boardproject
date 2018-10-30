package org.jj.service;

import java.util.List;

import org.jj.domain.Board;
import org.jj.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	
	@Override
	public List<Board> getList() {
		// TODO Auto-generated method stub
		return mapper.getList();
	}

	@Override
	public int remove(int bno) {
		// TODO Auto-generated method stub
		return mapper.delete(bno);
	}

	@Override
	public int modify(Board board) {
		// TODO Auto-generated method stub
		return mapper.modify(board);
	}

	@Override
	public Board read(int bno) {
		// TODO Auto-generated method stub
		return mapper.get(bno);
	}

	@Override
	public int write(Board board) {
		// TODO Auto-generated method stub
		return mapper.insert(board);
	}

}
