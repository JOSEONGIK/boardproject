package org.jj.controller;

import java.util.List;

import org.jj.domain.Board;
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

import com.mysql.cj.log.Log;

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
	public void getList(Model model){
		
		model.addAttribute("list",service.getList());	
	}
	
	@GetMapping("/register")
	public void register() {
	}
	
	@PostMapping("/register")
	public String registerPost(Board board, RedirectAttributes rttr) {
		
		int result=service.write(board);
		List<Board> list = service.getList();
		rttr.addFlashAttribute("board",list.get(0));
		rttr.addFlashAttribute("result",result==1?"SUCCESS":"FAILED");
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read","/modify"})
	public void get(@RequestParam("bno") Integer bno, Model model) {
		
		model.addAttribute("board", service.read(bno));
	}
	
	@PostMapping("/modify")
	public String modifyPost(Board board, RedirectAttributes rttr) {
		int result = service.modify(board);
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAILED");
		return "redirect:/board/read?bno="+ board.getBno();
		
	}
	
	@PostMapping("/remove")
	public String removePost(@RequestParam("bno") Integer bno, RedirectAttributes rttr) {
		
		int result = service.remove(bno);
		rttr.addFlashAttribute("result",result==1?"SUCCESS":"FAILED"); //모달창을 띄우기 위한 코드
		
		return "redirect:/board/list";
	}
		

}
