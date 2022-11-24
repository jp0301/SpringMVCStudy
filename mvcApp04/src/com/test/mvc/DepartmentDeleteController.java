/* ==============================================
 * #55. DepartmentDeleteController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 부서 데이터 삭제 액션 수행 및 해당 액션 처리 이후 
 *   『departmentdelete.action 을 요청할 수 있도록 안내』
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

public class DepartmentDeleteController implements Controller
{
	
	private IDepartmentDAO dao;
	
	public void setDao(IDepartmentDAO dao)
	{
		this.dao = dao;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		
		ModelAndView mav = new ModelAndView();
		
		// 세션 start
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name") == null)
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if(session.getAttribute("admin") == null) 
		{
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		// 세션 end
		
		
		try
		{
			String departmentId = request.getParameter("departmentId");
			
			dao.remove(departmentId);
			
			mav.setViewName("redirect:departmentlist.action");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

	
	
	
}
