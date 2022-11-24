/* ==============================================
 * #41. RegionUpdateFormController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 지역 데이터 수정 폼 요청에 대한 액션 처리.
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형
 *   → setter 메소드 정의.
 * ==============================================
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class RegionUpdateFormController implements Controller
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
		
		
		// 세션 처리과정추가(로그인에 대한 확인과정 추가)
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
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		
		try
		{
			
			String regionId = request.getParameter("regionId");

			Region region = new Region();

			region = dao.searchId(regionId);
			
			regionList = dao.list();
			
			mav.addObject("region", region);
			mav.addObject("regionList", regionList);
			mav.setViewName("RegionUpdateForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	

}
