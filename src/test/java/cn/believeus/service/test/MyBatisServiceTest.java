package cn.believeus.service.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.believeus.model.Tadmin;
import cn.believeus.service.MyBatisService;

@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration("/applicationContext.xml")  
public class MyBatisServiceTest {
	@Resource
	private MyBatisService myBatisService;
	/*mvn clean compile test -Dtest=cn.believeus.service.test.MyBatisServiceTest#testFindById*/
	@Test
	public void testFindById(){
		Tadmin admin = (Tadmin)myBatisService.findById(1);
		System.out.println(admin);
	}
}
