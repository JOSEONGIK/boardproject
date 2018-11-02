/*package org.jj.controller;

import java.util.List;

import org.jj.domain.ReplyVO;
import org.jj.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies")
@Log4j
public class ReplyController {

	@Setter(onMethod_=@Autowired)
	private ReplyService service;


	@PostMapping(value = "/new", consumes = "application/json", produces= { MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		log.info("ReplyVO:" + vo);
		int insertCount = service.write(vo);
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1
				? new ResponseEntity<>("sucess", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo) {
	    ResponseEntity<String> entity = null;
	    try {
	        service.insert(vo);
	        entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}

	
	
	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {
	    ResponseEntity<List<ReplyVO>> entity = null;
	    try {
	        entity = new ResponseEntity<>(service.getList(bno), HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}

	
	@RequestMapping(value = "/{rno}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {
	    ResponseEntity<String> entity = null;
	    try {
	        vo.setRno(rno);
	        service.modify(vo);
	        entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}

	
	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rno") Integer rno) {
	    ResponseEntity<String> entity = null;
	    try {
	        service.remove(rno);
	        entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
	    }
	    return entity;
	}

	
	}


*/