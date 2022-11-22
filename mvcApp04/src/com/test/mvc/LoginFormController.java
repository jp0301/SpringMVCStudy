/* ==============================================
 * #28. EmployeeUpdateController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 로그인 폼 요청에 대한 해당 액션 처리. 
 * ==============================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginFormController implements Controller
{
	

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		mav.setViewName("LoginForm");
		
		return mav;
	}

	
	
}
