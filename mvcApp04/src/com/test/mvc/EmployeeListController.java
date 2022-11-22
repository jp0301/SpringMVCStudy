/* ======================================
 * #15. EmployeeListController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 리스트 페이지 요청에 대한 액션 처리.
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형
 *   → setter 메소드 정의
 * ======================================
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class EmployeeListController implements Controller
{
	// 인터페이스 형태의 자료형 멤버 구성
	private IEmployeeDAO dao;

	// setter 구성
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}
	
	// Controller 인터페이스의 handleRequest() 메소드 재정의
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 컨트롤러 내부 액션 처리
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
		
		
		
		
		
		
		
		ArrayList<Employee> employeeList = new ArrayList<Employee>();
		
		try
		{
			employeeList = dao.list();
			
			mav.addObject("employeeList", employeeList);
			//mav.setViewName("/WEB-INF/view/EmployeeList.jsp");
			mav.setViewName("EmployeeList");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	
	
}
