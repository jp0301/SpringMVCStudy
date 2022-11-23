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

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class RegionAjaxController implements Controller
{
	private IRegionDAO dao;
	
	public void setDao(IRegionDAO dao)
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
		
		
		
		
		//이전 페이지(EmployeeInsertForm.jsp)로부터 데이터 수신
		//-- positionId
		String regionName = request.getParameter("regionName");
		
		
		String result = "";
		
		
		try
		{
			
			result = dao.searchRegionName(regionName);
			

			mav.addObject("result", result);
			mav.setViewName("RegionAjax");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
	
}
