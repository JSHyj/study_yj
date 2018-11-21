package study.login.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import study.login.mapper.LoginMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class testBoard {
	
	@Setter(onMethod_ = @Autowired)
	private LoginMapper mapper;
	
	@Test
	public void testGetList() {
		log.info("1");
		mapper.getList().forEach(board -> log.info(board));
	}

}

