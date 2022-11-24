/* ==============================================
 * #58. PositionInsertFormController.java
 * - 직위 데이터 입력폼 요청에 대한 액션 처리.
 * ==============================================
 */

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class PositionInsertFormController implements Controller
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
		
		if(session.getAttribute("name") == null)
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
			mav.setViewName("PositionInsertForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return mav;
	}

	
}
