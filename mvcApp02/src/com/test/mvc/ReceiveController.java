/* 
 ======================================
 ReceiveController.java
 - 사용자 정의 컨트롤러 클래스
 ======================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class ReceiveController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");

		// 이전 페이지(Send.jsp)로부터 데이터 수신
		String userName = request.getParameter("userName");
		
		// 수신한 데이터 처리 (추가 연산이나 가공 → 업무 로직)
		//-- 지금은 간단한 가공 처리 업무이기 때문에 컨트롤러에서 수행하고 있지만
		//   이 내용은 컨트롤러에서 직접 수행할 내용이 아니다.
		userName += "님, 환영합니다~!!!";
		
		mav.addObject("userName", userName);
		mav.setViewName("/WEB-INF/view/Receive.jsp");
		
		return mav;
	}
	
}
