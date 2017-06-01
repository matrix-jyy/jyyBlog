<%@page import="com.zkingsoft.constance.SystemConstance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="javax.script.*"%>

<%
	//文件保存目录路径
	//String savePath = "/Users/jiangyouyao/java/webresources/uploadeFile/";
	//String savePath = "d:/webresources/uploadeFile/";
	//文件保存目录URL
	//String saveUrl  = "http://127.0.0.1:1088/uploadeFile/";

	//文件保存目录路径
	//String savePath = "/Users/jiangyouyao/java/webresources/uploadeFile/";
	String savePath = session.getServletContext().getAttribute(SystemConstance.FILE_STORAGE_PATH).toString();
	;
	//文件保存目录URL
	String saveUrl = session.getServletContext().getAttribute(SystemConstance.NGINX_URL).toString();

	System.out.println("savePath---------" + savePath);
	System.out.println("saveUrl---------" + saveUrl);
	//定义允许上传的文件扩展名
	HashMap<String, String> extMap = new HashMap<String, String>();
	extMap.put("image", "gif,jpg,jpeg,png,bmp");
	extMap.put("flash", "swf,flv");
	extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
	extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

	//最大文件大小
	long maxSize = 1024 * 1000 * 10;

	response.setContentType("text/html; charset=UTF-8");

	if (!ServletFileUpload.isMultipartContent(request)) {
		out.println(getError("请选择文件。"));
		return;
	}
	//检查目录
	File uploadDir = new File(savePath);
	if (!uploadDir.isDirectory()) {
		uploadDir.mkdir();
		out.println(getError("上传目录不存创建一个公司目录。"));
	}
	//检查目录写权限
	if (!uploadDir.canWrite()) {
		out.println(getError("上传目录没有写权限。"));
		return;
	}

	String dirName = request.getParameter("dir");

	String flag = request.getParameter("flag");
	String hiddenImg = request.getParameter("hiddenImg");

	if (dirName == null) {
		dirName = "image";
	}
	if (!extMap.containsKey(dirName)) {
		out.println(getError("目录名不正确。"));
		return;
	}
	//创建文件夹
	savePath += dirName + "/";
	saveUrl += dirName + "/";
	File saveDirFile = new File(savePath);
	if (!saveDirFile.exists()) {
		saveDirFile.mkdirs();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String ymd = sdf.format(new Date());
	savePath += ymd + "/";
	saveUrl += ymd + "/";
	File dirFile = new File(savePath);
	if (!dirFile.exists()) {
		dirFile.mkdirs();
	}

	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setHeaderEncoding("UTF-8");
	List items = upload.parseRequest(request);
	Iterator itr = items.iterator();
	while (itr.hasNext()) {
		FileItem item = (FileItem) itr.next();
		String fileName = item.getName();
		long fileSize = item.getSize();
		if (!item.isFormField()) {
			//检查文件大小
			if (item.getSize() > maxSize) {
				out.println(getError("上传文件大小超过限制。"));
				return;
			}
			//检查扩展名
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
				out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
				return;
			}

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			try {
				//System.out.println(savePath);
				File uploadedFile = new File(savePath, newFileName);
				item.write(uploadedFile);
			} catch (Exception e) {
				out.println(getError("上传文件失败。"));
				return;
			}

			String visitPath = saveUrl + newFileName;
			System.out.println("上传一个文件：" + newFileName);

			out.print("<script type='text/javascript'>" + "		window.parent.document.getElementById('" + flag
					+ "').setAttribute('src', '" + visitPath + "');"
					+ "		window.parent.document.getElementById('" + hiddenImg + "').value='" + visitPath
					+ "';" + "</script>");
		}
	}
%>

<%!private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}%>


