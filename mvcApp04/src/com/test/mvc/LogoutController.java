/* ==============================================
 * #30. LoginController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 로그인 액션 처리 전용 클래스.
 * - 로그인 액션 처리 이후
 *   employeelist.action , emplist.action 을 요청할 수 있도록 안내.
 *   일반사원이 로그인하면 emplist.action...
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   인터페이스자료형
 *   SETTER 메소드 정의
 *   
 * ==============================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LogoutController implements Controller
{
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		
		session.removeAttribute("name");
		session.removeAttribute("admin");
		
		
		mav.setViewName("redirect:loginform.action");

		
		return mav;
	}

	
	
}
