package org.jj.controller;

import java.util.List;

import org.jj.domain.Board;
import org.jj.domain.PageParam;
import org.jj.service.BoardService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void getList(@ModelAttribute("pageObj") PageParam pageParam, Model model){
		
		pageParam.setTotal(service.getTotalCount(pageParam));
		model.addAttribute("list", service.getList(pageParam));
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("pageObj") PageParam pageParam) {
	}
	
	@PostMapping("/register")
	public String registerPost(PageParam pageParam, Board board, RedirectAttributes rttr) {
		
		int result=service.write(board);
		rttr.addFlashAttribute("result",result==1?"SUCCESS":"FAILED");
		return pageParam.getLink("redirect:/board/list");
	}
	
	@GetMapping({"/read","/modify"})
	public void get(@ModelAttribute("pageObj") PageParam pageParam, Model model) {
		
		model.addAttribute("board", service.read(pageParam));
	}
	
	@PostMapping("/modify")
	public String modifyPost(PageParam pageParam, Board board, RedirectAttributes rttr) {
		int result = service.modify(board);
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAILED");
		return pageParam.getLink("redirect:/board/read");
		
	}
	
	@PostMapping("/remove")
	public String removePost(@ModelAttribute("pageObj") PageParam pageParam, RedirectAttributes rttr) {
		
		int result = service.remove(pageParam);
		rttr.addFlashAttribute("result",result==1?"SUCCESS":"FAILED"); //모달창을 띄우기 위한 코드
		
		return pageParam.getLink("redirect:/board/list");
	}

	

}
