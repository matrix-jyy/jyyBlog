package com.zkingsoft.actions.api;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zkingsoft.constraint.BaseController;
import com.zkingsoft.exception.GlobleException;
import com.zkingsoft.model.sys.SysUsers;
import com.zkingsoft.pojo.AjaxResult;
import com.zkingsoft.util.DateUtils;
import com.zkingsoft.util.ExcelImport;
import com.zkingsoft.util.ExcelUtil;
import com.zkingsoft.util.ExcelUtil.ViewExcel;
import com.zkingsoft.util.FileDownload;
import com.zkingsoft.util.StringUtils;
import com.zkingsoft.util.WebUtil;

/**
 * 
* @Description: 不需要登录可以访问的action
* @author:姜友瑶 
* @date 2016年8月31日
 */
@RequestMapping(value = "/api")
@Controller
public class Api extends BaseController {

	/**
	 * 
	 * @Description: 页面定向方法，每个权限模块公用一个，每个模块共享一个一级路径，已便于进行权限过滤
	 * @author:姜友瑶
	 * @param page1
	 * @param page2
	 * @return 返回类型 String
	 * @date 2016年8月31日
	 */
	@RequestMapping(value = "/redirect/{page1}/{page2}")
	public String redirect(@PathVariable("page1") String page1, @PathVariable("page2") String page2) {
		return "api/" + page1 + "/" + page2;
	}

	@RequestMapping(value = "/redirect/{page1}")
	public String redirect(@PathVariable("page1") String page1) {
		return "api/" + page1;
	}
	
	@RequestMapping(value = "/findFruits")
	public @ResponseBody AjaxResult findFruits(String kinds) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		List<Fruits> fruits=getFruits();
		
		AjaxResult result = new AjaxResult(AjaxResult.STATUS_OK, null, null, fruits, fruits.size());
		result.putInMap("time", DateUtils.getTimeMark());
		return result;
	}
	
	/**根据水果名称查询水果列表
	 * @param name
	 * @return
	 */
	@RequestMapping(value = "/queryFruits")
	public @ResponseBody AjaxResult queryFruits(String name) {
		
		List<Fruits> fruits=new ArrayList<>();
		for(Fruits f:getFruits()){
			if(f.getName().contains(name)){
				fruits.add(f);
			}
		}
		AjaxResult result = new AjaxResult(AjaxResult.STATUS_OK, null, null, fruits, fruits.size());
		result.putInMap("time", DateUtils.getTimeMark());
		return result;
	}
	
	
	//mgrid demo
	//Arrays.asList()生成的List是只读的！！
	static List<MGDemo> MGDemos = new ArrayList<MGDemo>(Arrays.asList(
			new MGDemo(new Long(1), "苹果", "10000.qq.com", new Date()), 
			new MGDemo(new Long(2), "西瓜", "20000.qq.com", new Date()),
			new MGDemo(new Long(3), "梨子", "30000.qq.com", new Date()) 
	));
	@RequestMapping(value = "/showList")
	public @ResponseBody AjaxResult showList() {
		AjaxResult result = new AjaxResult(AjaxResult.STATUS_OK, null, null, MGDemos, MGDemos.size());
		return result;
	}
	@RequestMapping(value = "/del")
	public @ResponseBody AjaxResult del(String keys) {
		List<Long> ids = StringUtils.strToCollToLong(keys, ",");
		Iterator<MGDemo> ite = MGDemos.iterator();
		while(ite.hasNext()){
			MGDemo str = (MGDemo)ite.next();
			if(ids.contains(str.getId())){
			  ite.remove();//迭代对象删除 集合中对应数据也删除。。。
			}
		}
		return new AjaxResult(AjaxResult.STATUS_OK, null, "成功删除" + ids.size() + "条数据");
	}
	
	
	//MForm demo
	@RequestMapping(value = "/addOrModify")
	public @ResponseBody AjaxResult addOrModify(SysUsers admin) {
		return new AjaxResult(AjaxResult.STATUS_OK, null, "修改成功");
	}
	
	
	//MTools demo
	@RequestMapping(value = "/handleItem")
	public @ResponseBody AjaxResult handleItem() {
		return new AjaxResult(AjaxResult.STATUS_OK, null, "执行成功");
	}

	/**
	 * 下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/download")
	public void assemblyInputModle_zh( HttpServletResponse response)
			throws Exception {
		String path=WebUtil.getResourceRealPath( "WEB-INF/views/api/demoShow/import_demo.xlsx");
		FileDownload.fileDownload(response, path, "商机导入模板.xlsx");
	}
	
	/**导入数据
	 * @param response
	 * @param request
	 * @param file
	 * @return
	 */
	@RequestMapping(value="/importDemo")
	public @ResponseBody AjaxResult importChance(HttpServletResponse response,
		      HttpServletRequest request,
		      @RequestParam(value = "file", required = false) MultipartFile file){
	     //记录成功的导入多少条数据
		int count=0;
		//构造对象的集合
		List<Fruits> fruitsList=new ArrayList<Fruits>();
		response.setContentType("text/html;charset=UTF-8");
	    String fileName=file.getOriginalFilename();
		String extension = fileName.lastIndexOf(".") == -1 ? "" : fileName
	            .substring(fileName.lastIndexOf(".") + 1);
	        if (!extension.equals("xls") && !extension.equals("xlsx")) {
	    		return new AjaxResult(AjaxResult.STATUS_OK, null, "请选择excel文件！！！");

	        }
    try {
    	 String dirPath = request.getSession().getServletContext().getRealPath("/")
					+ "fileupload";
    	 File fileDir = new File(dirPath);
 		if (!fileDir.exists()) {
 			if (fileDir.mkdirs()) {
 			} 
 		}
 		File saveFile = new File(dirPath+"/"+fileName);
 		file.transferTo(saveFile);
		List<List<Object>> list=ExcelImport.readExcel(saveFile, fileName, null, 4);
		
		
		//由于读取excel的工具类会从标题行开始读取，因此，list=null或者size=1表示只有标题行说明没有数据可以导入
		if(list==null || list.size()<=1){
			throw new GlobleException("没有数据可导入");
		}
		for (int i=1;i<list.size();i++) {
			Fruits fruits=new Fruits();
			List<Object> objList=list.get(i);
			fruits.setName((String) objList.get(0));
			fruits.setPrice((String) objList.get(1));
			fruitsList.add(fruits);
		  }
		
		//实际应用中你可以调用service,作批量导入。这里做demo直接返回数据
		//count=currentService.importChances(chanceList);
		count=fruitsList.size();
	} catch (IOException e) {
	}
    if(count>0){
    	return new AjaxResult(AjaxResult.STATUS_OK, null, "成功导入"+count+"条数据!", fruitsList, fruitsList.size());
    }
    else{
 		return new AjaxResult(AjaxResult.STATUS_ERR, null, "导入失败!");
    }
	}
	
	/**导出数据
	 * @param model
	 * @param request
	 * @param response
	 * @param fruit
	 * @return
	 */
	@RequestMapping(value = "/exportExcel")
	public @ResponseBody ModelAndView report(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			Fruits fruit) {
		try {
			if (fruit.getName() != null && !(fruit.getName().equals(""))) {
				fruit.setName(java.net.URLDecoder.decode(fruit.getName(), "UTF-8"));
			}
			
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		// 这里查找符合条件的数据
		//List<Fruits> dataList = currentService.findByVo(Fruits, null);
		List<Fruits> dataList=new ArrayList<>();
		for(Fruits f:getFruits()){
			if(f.getName().contains(fruit.getName())){
				dataList.add(f);
			}
		}
		//把数据组装成我们要的数据，外面的list表示一行数据，也就是一个对象的信息，对应到excel的一行数据。里面的list表示对象的一个属性，对应excel的单元格
		List<List<Object>> list = new ArrayList<>();
			for (Fruits obj : dataList) {
				List<Object> temp = new ArrayList<>();
				temp.add(obj.getName());
				temp.add(obj.getPrice());
				temp.add(obj.getImg());
				list.add(temp);
			}
			
			//调用我们的excel工具类，导出数据
		HSSFWorkbook workbook = ExcelUtil.generateExcel("水果列表",
				new String[] {"名称","价格","图片地址"}, list);
		try {
			ViewExcel.buildExcel(null, workbook, request, response, "水果.xls");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new ViewExcel(), model);
	}
	
	/**初始化数据，在demo中使用
	 * @return
	 */
	public List<Fruits> getFruits(){
		List<Fruits> fruits=Arrays.asList(
				new Fruits("香蕉", "50","/matrix-web/resource/images/xj.jpg"), 
				new Fruits("苹果", "30","/matrix-web/resource/images/pg.jpg"),
				new Fruits("梨子", "20","/matrix-web/resource/images/lz.jpg") );
		return fruits;
		
	}

}




class Fruits{
	String name;
	String price;
	String img;
	
	
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Fruits() {
		
	}
	public Fruits(String name,String price,String img) {
		this.name=name;
		this.price=price;
		this.img=img;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
}

//mgrid demo class
class MGDemo {
	Long id;
	String name;
	String email;
	Date registerTime;
	
	public MGDemo(Long id, String name, String email, Date registerTime) {
		this.id=id;
		this.name=name;
		this.email=email;
		this.registerTime = registerTime;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
}
