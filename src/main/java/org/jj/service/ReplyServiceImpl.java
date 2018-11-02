//package org.jj.service;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.jj.domain.PageParam;
//import org.jj.domain.ReplyVO;
//import org.jj.mapper.ReplyMapper;
//import org.springframework.stereotype.Service;
//
//import lombok.AllArgsConstructor;
//
//@Service
//@AllArgsConstructor
//public class ReplyServiceImpl implements ReplyService{
//	
//	private ReplyMapper mapper;
//
//	@Override
//	public List<ReplyVO> getList(Integer bno) {
//		// TODO Auto-generated method stub
//		return mapper.getList(bno);
//	}
//
//	@Override
//	public int insert(ReplyVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.write(vo);
//	}
//
//	@Override
//	public int modify(ReplyVO vo) {
//		// TODO Auto-generated method stub
//		return mapper.update(vo);
//	}
//
//	@Override
//	public int remove(Integer rno) {
//		// TODO Auto-generated method stub
//		return mapper.delete(rno);
//	}
//
//	@Override
//	public ReplyVO get(Integer bno) {
//		// TODO Auto-generated method stub
//		return mapper.read(bno);
//	}
//
//	@Override
//	public List<ReplyVO> getlistPaging(Integer bno, PageParam pageParam) {
//
//		Map<String, Object> paramMap = new HashMap<>();
//		paramMap.put("bno", bno);
//		paramMap.put("pageParam", pageParam);
//		return mapper.listPaging(bno, pageParam);
//	}
//
//	@Override
//	public int getcount(Integer bno) {
//		// TODO Auto-generated method stub
//		return mapper.countReply(bno);
//	}
//	
//	
//
//}
