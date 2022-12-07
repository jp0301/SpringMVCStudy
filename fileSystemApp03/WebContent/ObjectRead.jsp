<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%

	/*
		key1 의 값은 적재데이터1 입니다.
		key2 의 값은 적재데이터2 입니다.
	*/

	/* ObjectWrite.jsp */
	
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 경로 확인
	System.out.println(appRoot);
	
	// 파일 객체 생성
	File newFile = new File(appRoot, "objdata/data.ser");
	
	// 파일이 존재할 디렉터리가 존재하지 않을 경우는
	// 파일이 위치할 경로까지의 디렉터리를 생성해준다.
	if(newFile.exists())
	{
		FileInputStream fis = new FileInputStream(newFile);

		// File 에서 Object 를 읽어오기 위해
		// ObjectInputStream 을 생성하여 FileInputStream 을 감싼다.
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		// ObjectInputStrema 을 이용하여 파일로부터 Object를 읽어온다.
		//-- 읽어온 Object 는 Hashtable 형태
		Hashtable<String, String> h = (Hashtable)ois.readObject();
			
		// 리소스 반납
		ois.close();
		fis.close();

		// ------- 여기까지 수행하면 파일에서 객체 읽어오는 작업은 끝~!
		
/* 		Set<String> keys = h.keySet();
		Iterator<String> i = keys.iterator();

		while(i.hasNext())
		{
			String key = i.next();
			
			String value = h.get(key);
			
			out.println(key + "의 값은" + value + "입니다.<br>");

		}
 */	
 
 		Enumeration e = h.keys();
 
 		while(e.hasMoreElements())
 		{
 			String key = (String)e.nextElement();	// 키 얻어내기
 			String value = (String)h.get(key);		// 얻어낸 키를 활용하여 값 얻기
 			
%>

<%=key %> 의 값은 <%=value %> 입니다. <br>

<%
 		}
	}
	else
	{
		out.println("해당 파일이 존재하지 않습니다.");
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ObjectRead.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

</body>
</html>