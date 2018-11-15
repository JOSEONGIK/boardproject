package org.jj.service;

import java.util.List;

import org.jj.domain.PageParam;
import org.jj.domain.ReplyVO;
import org.jj.domain.ReplypageDTO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(Integer rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(Integer rno);
	
	public List<ReplyVO> getList(PageParam pageParam, Integer bno);
	
	public ReplypageDTO  getListPage(PageParam pageParam);
}
