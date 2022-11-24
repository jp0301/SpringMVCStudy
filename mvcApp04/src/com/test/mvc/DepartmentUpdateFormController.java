/* ==============================================
 * #53. RegionUpdateFormController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 부서 데이터 수정 폼 요청에 대한 액션 처리.
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

public class DepartmentUpdateFormController implements Controller
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
		
		String departmentId = request.getParameter("departmentId");
		
		try
		{
			Department department = new Department();
			
			department = dao.searchId(departmentId);
			
			mav.addObject("department", department);
			mav.setViewName("DepartmentUpdateForm");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		return mav;
	}

}
