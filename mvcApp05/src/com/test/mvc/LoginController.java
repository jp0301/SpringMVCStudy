package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class LoginController implements Controller
{

	private IMemberDAO dao;
	
	
	public void setDao(IMemberDAO dao)
	{
		this.dao = dao;
	}
	
	
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String admin = request.getParameter("admin");
		
		String name = null;
		
		try
		{
			if(admin == null)
			{
				name = dao.login(id, pw);
			}
			else
			{
				name = dao.loginAdmin(id, pw);
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		if(name == null) // 로그인 실패
		{
			mav.setViewName("redirect:loginform.action");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			
			if(admin == null) // 일반 직원으로 로그인한 상황
			{
				mav.setViewName("redirect:memlist.action");
			}
			else // 관리자로 로그인을 성공한 상황
			{
				session.setAttribute("admin", "");
				
				mav.setViewName("redirect:memberlist.action");
			}
		}
		
		
		return mav;
	}

	
}
