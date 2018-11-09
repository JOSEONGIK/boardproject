package org.jj.service;

import java.util.List;

import org.jj.domain.PageParam;
import org.jj.domain.ReplyVO;
import org.jj.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;

public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public ReplyVO get(Integer rno) {
		// TODO Auto-generated method stub
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.update(vo);
	}

	@Override
	public int remove(Integer rno) {
		// TODO Auto-generated method stub
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(PageParam pageParam, Integer bno) {
		// TODO Auto-generated method stub
		return mapper.getListWithPaging(pageParam, bno);
	}

}
