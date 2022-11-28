package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberRecordUpdateController implements Controller
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
		
		
		String id = request.getParameter("id");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int scoreId = Integer.parseInt(request.getParameter("scoreId"));
		
		
		try
		{
			
			MemberRecord memberrecord = new MemberRecord();
			
			memberrecord.setId(id);
			memberrecord.setKor(kor);
			memberrecord.setEng(eng);
			memberrecord.setMat(mat);
			memberrecord.setScoreId(scoreId);
			
			dao.modify(memberrecord);
			
			mav.setViewName("redirect:memberrecordlist.action");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
	
	
	
	
	
}
