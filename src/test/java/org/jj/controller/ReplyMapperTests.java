package org.jj.controller;

import java.util.List;

import org.jj.domain.PageParam;
import org.jj.domain.ReplyVO;
import org.jj.mapper.ReplyMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class ReplyMapperTests extends AbstractTests{

	@Setter(onMethod_= @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
	}
	
	@Test
	public void testgetList() {
		
		PageParam pageParam = new PageParam();
		
			}
	
	@Test
	public void testWrite() {
		
		ReplyVO vo = new ReplyVO();
		
		
		vo.setBno(5);
		vo.setReply("댓글테스트12345");
		vo.setReplyer("댓글작성자12345");
		
		mapper.write(vo);
		
	}
	
	@Test
	public void testList2() {
		
		PageParam param = new PageParam();
		
//		List<ReplyVO> replies = mapper.getListPage(param, 150);
//		replies.forEach(reply -> log.info(reply));
	}
}
