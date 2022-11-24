/* ==================================================
 * #40. RegionInsertController.java.java
 * - 사용자 정의 컨트롤러 클래스
 * - 지역 데이터 입력 액션 수행 및 해당 액션 수행 이후
 * - regionlist.action을 다시 요청할 수 있도록 처리
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형 구성.
 *   → setter 메소드 정의.
 * ==================================================
 */


package com.test.mvc;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class RegionInsertController implements Controller
{
	private IRegionDAO dao;
	
	public void setDao(IRegionDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse reponse) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
		// 세션 ------------------------------------------------
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
		// ------------------------------------------------ 세션
		
		String regionName = request.getParameter("regionName");
		
		try
		{
			Region region = new Region();
			
			region.setRegionName(regionName);
			
			dao.add(region);
			
			mav.setViewName("redirect:regionlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	
	
}
