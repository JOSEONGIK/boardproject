package org.jj.service;

import java.util.List;

import org.jj.domain.PageParam;
import org.jj.domain.ReplyVO;
import org.jj.domain.ReplypageDTO;
import org.jj.mapper.BoardMapper;
import org.jj.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_= @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
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

	@Transactional
	@Override
	public int remove(Integer rno) {
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(PageParam pageParam, Integer bno) {
		// TODO Auto-generated method stub
		return mapper.getList(pageParam, bno);
	}

	@Override
	public ReplypageDTO getListPage(PageParam pageParam) {
		// TODO Auto-generated method stub
		
		return new ReplypageDTO(mapper.getCountByBno(pageParam.getBno()),mapper.getListPage(pageParam));
	}

}
