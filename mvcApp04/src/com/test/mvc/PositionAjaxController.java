/* ==================================================
 * #60. PositionAjaxController.java.java
 * - 사용자 정의 컨트롤러 클래스
 * - 직위 리스트의 직위명 중복검사 결과 반환 액션.
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형 구성.
 *   → setter 메소드 정의.
 * ==================================================
 */

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PositionAjaxController implements Controller
{
	private IPositionDAO dao;
	
	public void setDao(IPositionDAO dao)
	{
		this.dao = dao;
	}
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
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
		
		String positionName = request.getParameter("positionName");
		
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		String str = "";
		
		try
		{
			positionList = dao.list();
			
			
			for(Position position : positionList)
			{
				if(position.getPositionName().equals(positionName))
				{
					str = "이미 사용중인 이름이 존재합니다.";
					break;
				}
				else
				{
					str="사용할 수 있는 이름입니다.";
				}
			}

			mav.addObject("result", str);
			mav.setViewName("PositionAjax");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
	
}
