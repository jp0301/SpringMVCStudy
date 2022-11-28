package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberAjaxController2 implements Controller
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
		
		// 세션 ----------------------------------------------
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
		// ---------------------------------------------- 세션
		
		
		String id = request.getParameter("id");
		
		String email  = request.getParameter("email");
		String address = request.getParameter("address");
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		
		String emailcom = email.trim() + "@" + address.trim();
		
		String str = null;
		
		try
		{
			memberList = dao.list();
			
			for(Member member : memberList)
			{
				if(member.getId().equals(id) && member.getEmail().equals(emailcom))
				{
					str="현재 사용중인 이메일입니다.";
					break;
				}
				else if(member.getEmail().equals(emailcom))
				{
					str="이미 사용중인 이메일입니다.";
					break;
				}
			}
			
			mav.addObject("result", str);
			mav.setViewName("MemberAjax2");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

	
	
	
	
	
}
