/* ==============================================
 * #27. EmployeeUpdateController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 직원 데이터 삭제 액션 수행 및 해당 액션 처리 이후 
 *   『employeelist.action 을 요청할 수 있도록 안내』
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형
 *   → setter 메소드 정의.
 * ==============================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class EmployeeDeleteController implements Controller
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
		
		// 세션 처리과정추가(로그인에 대한 확인과정 추가
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name") == null) // 로그인 되어있지않은 상황
		{
			// 로그인이 되어있지 않은 상황에서의 처리
			//-- 로그인 폼 페이지를 다시 요청할 수 있도록 안내
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if(session.getAttribute("admin") == null) // 로그인은 되어있지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황 즉, 일반 사원일 때의 처리
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		// ----------------- 세션 처리 과정 추가(로그인에 대한 확인과정 추가)
		
		
		try
		{
			String employeeId = request.getParameter("employeeId");
			
			dao.remove(employeeId);
			
			mav.setViewName("redirect:employeelist.action");
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	

}
