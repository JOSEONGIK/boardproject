package org.jj.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jj.domain.PageParam;
import org.jj.domain.ReplyVO;

public interface ReplyMapper {

	public List<ReplyVO> getList(PageParam pageParam, Integer bno); 
	
	public int write(ReplyVO vo);
	
	public int delete(Integer rno);
	
	public int update(ReplyVO vo);
	
	public ReplyVO read(Integer rno);
	
	public List<ReplyVO> getListWithPaging(
			@Param("pageParam") PageParam pageParam,
			@Param("bno") Integer bno);
			
}
