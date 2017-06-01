package com.zkingsoft;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zkingsoft.model.sys.SysFunction;
import com.zkingsoft.services.sys.SysFunctionService;

/**
 * VipInfoService测试类
* @ClassName: VipInfoServiceTest 
* @Description: TODO 
* @author 肖崇高  xiaochonggao@zkingsoft.com 
* @date 2016年8月3日 上午10:22:58 
*
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:applicationContext-test.xml" })
public class SysFunctionTest {

	@Resource(name="sysFunctionService")
	SysFunctionService sysFunctionService;
	
	@Test
	public void testAdd() {
		List<SysFunction> list=new ArrayList<>();
		
		SysFunction fn=new SysFunction();
		fn.setFnGrade(1);
		fn.setFnIcon("123");
		fn.setFnIsDisable("45");
		fn.setFnName("测试");
		fn.setFnParentId(1L);
		fn.setFnPath("123");
		fn.setFnSequence(1);
		list.add(fn);
		
		
		SysFunction fn1=new SysFunction();
		fn1.setFnGrade(1);
		fn1.setFnIcon("123");
		fn1.setFnIsDisable("45");
		fn1.setFnName("测试1");
		fn1.setFnParentId(1L);
		fn1.setFnPath("123");
		fn1.setFnSequence(1);
		list.add(fn1);
		
		SysFunction fn2=new SysFunction();
		fn2.setFnGrade(1);
		fn2.setFnIcon("123");
		fn2.setFnIsDisable("45");
		fn2.setFnName("测试2");
		fn2.setFnParentId(1L);
		fn2.setFnPath("123");
		fn2.setFnSequence(1);
		list.add(fn2);
		
//		int i=sysFunctionService.add(fn);	
		int i=sysFunctionService.batchAdd(list);
		
		System.out.println(i);
	}
	
	

	@Test
	public void testRemove() {
		SysFunction fn2=new SysFunction();
		fn2.setFnGrade(1);
		fn2.setFnIcon("123");
//		sysFunctionService.remove(Arrays.asList(27L,28L));
		sysFunctionService.removeByModel(fn2);
		
	}
	
	@Test
	public void testUpdate() {
		SysFunction old=new SysFunction();
		old.setFnId(33L);
		old.setFnGrade(1);
		old.setFnIcon("12--------3");
		
		SysFunction newobj=new SysFunction();
		newobj.setFnId(33L);
		newobj.setFnGrade(1);
		newobj.setFnIcon("1212212121");
		sysFunctionService.modifyByMap(newobj, old);
	
	}
	
	
	@Test
	public void testSelect() {
		SysFunction newobj=new SysFunction();
		newobj.setFnId(33L);
//		System.out.println(sysFunctionService.findById(33L));
//		System.out.println(sysFunctionService.findByModel(newobj));
		
//		System.out.println(sysFunctionService.findInPage(newobj, null));
	}
		
	
	

}
