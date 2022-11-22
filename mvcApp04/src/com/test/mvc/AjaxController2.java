/* ======================================
 * #21. AjaxController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 직위에 따른 최소 기본급 반환 액션.
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형 구성.
 *   → setter 메소드 정의.
 * ======================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class AjaxController2 implements Controller
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
		
		//이전 페이지(EmployeeInsertForm.jsp)로부터 데이터 수신
		//-- positionId
		String employeeId = request.getParameter("employeeId");
		String ssn2 = request.getParameter("ssn2");
		
		String result = "";
		
		try
		{
			result = dao.searchSsn2(employeeId, ssn2);
			

			mav.addObject("result", result);
			/* mav.setViewName("WEB-INF/view/Ajax.jsp"); */
			mav.setViewName("Ajax2");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
	
}
