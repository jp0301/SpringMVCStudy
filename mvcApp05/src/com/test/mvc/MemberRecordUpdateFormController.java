package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberRecordUpdateFormController implements Controller
{
	private IMemberRecordDAO dao;
	
	public void setDao(IMemberRecordDAO dao)
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
		
		
		try
		{
			int scoreId = Integer.parseInt(request.getParameter("scoreId"));
			MemberRecord memberrecord = new MemberRecord();
			
			memberrecord = dao.searchId(scoreId);
			
			mav.addObject("memberrecord", memberrecord);
			mav.setViewName("MemberRecordUpdateForm");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		
		
		return mav;
	}
	
}
