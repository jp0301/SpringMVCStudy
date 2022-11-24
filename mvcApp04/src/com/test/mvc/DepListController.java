/* ======================================
 * #69. DepListController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 리스트 페이지 요청에 대한 액션 처리.(일반 직원)
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

public class DepListController implements Controller
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
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name") == null) // 로그인 되어있지않은 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		
		
		ArrayList<Department> deplist = new ArrayList<Department>();
		
		try
		{
			deplist = dao.depList();
			
			mav.addObject("deplist", deplist);
			mav.setViewName("DepList");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}
	
	
	
	
	
}

