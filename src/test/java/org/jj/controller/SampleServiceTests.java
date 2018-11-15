package org.jj.controller;

import org.jj.service.SampleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class SampleServiceTests extends AbstractTests{

	
	@Setter(onMethod_= @Autowired)
	private SampleService service;
	
	@Test
	public void testClass() {
		
		log.info(service);
		log.info(service.getClass().getName());
	}
	
	@Test
	public void testAdd() throws Exception{
		
		log.info(service.doAdd("123", "456"));
	}
}
