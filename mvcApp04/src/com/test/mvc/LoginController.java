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

public class LoginController implements Controller
{
	
	private IEmployeeDAO dao;
	
	
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String admin = request.getParameter("admin");
		
		String name = null;
		
		try
		{
			if(admin == null)
			{
				name = dao.login(id, pw);
			}
			else
			{
				name = dao.loginAdmin(id, pw);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// 로그인 수행에 따른 성공 여부 확인 및 구분 / 분기
		if(name == null) // 로그인 실패
		{
			mav.setViewName("redirect:loginform.action");
		}
		else // 로그인 성공 > 세션 구성
		{
			// 로그인 형태(일반사원, 관리자)에 따라 분기
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			
			if(admin == null) // 일반 직원으로 로그인한 상황
			{
				mav.setViewName("redirect:emplist.action");
			}
			else // 관리자로 로그인을 성공한 상황
			{
				session.setAttribute("admin", "");
				
				mav.setViewName("redirect:employeelist.action");
			}
		}
		
		return mav;
	}

	
	
}
