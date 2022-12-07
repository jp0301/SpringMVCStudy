<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<%
	/* Receive.jsp */
	
	String contentType = request.getContentType();
	
	// 순환적 반복자 Enumberation
	Enumeration e = request.getHeaderNames();
	
	out.println("contentType : " + contentType + "<br><br>");
	
	out.println("[[ 브라우저로부터 날아오는 헤더 정보들 ]]<br>");
	
	while(e.hasMoreElements())
	{
		String key = (String)e.nextElement();
		String value = request.getHeader(key);
		
		out.println(key + " : " + value + "<br>");
		
	}
	
	out.println("<br>[[ request로 넘어오는 데이터들 ]]<br><br>");

	DataInputStream di = new DataInputStream(request.getInputStream());
	String line = null;
	
	while( (line = di.readLine()) != null )
	{
		/*out.println(new String(line.getBytes("UTF-8"), "UTF-8") + "<br>");*/
		// 문자열 객체를 구성하겠다. > line.getBytes("ISO-8859-1") 바이트형식을 UTF-8 인코딩 입혀서 문자열만들어주기.
		// 지금은 바이트를 읽어들이고 있는데 읽어들이는 과정에서 EUC-KR, MS949가 ISO-8859-1이다.
		
		out.println(new String(line.getBytes("ISO-8859-1"), "UTF-8") + "<br>");
	}
	
	
%>