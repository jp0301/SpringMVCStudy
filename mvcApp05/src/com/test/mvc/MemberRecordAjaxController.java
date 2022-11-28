package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberRecordAjaxController implements Controller
{
	private IMemberDAO memberDAO;
	
	public void setMemberDAO(IMemberDAO memberDAO)
	{
		this.memberDAO = memberDAO;
	}
	
	private IMemberRecordDAO memberRecordDAO;
	
	public void setMemberRecordDAO(IMemberRecordDAO memberRecordDAO)
	{
		this.memberRecordDAO = memberRecordDAO;
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
		
		
		String id  = request.getParameter("id");
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		ArrayList<MemberRecord> memberrecordList = new ArrayList<MemberRecord>();
		
		String str = "";
		
		try
		{
			memberList = memberDAO.list();
			memberrecordList = memberRecordDAO.list();
			
			for(Member member : memberList)
			{
				if(member.getId().equals(id))
				{
					str="존재하는 학생입니다.";
					break;
				}
				else
				{
					str="존재하지 않는 학생입니다.";
				}
			}
			
			if(str == "존재하는 학생입니다.")
			{
				for(MemberRecord memberrecord : memberrecordList)
				{
					if(memberrecord.getId().equals(id))
					{
						str="이미 성적이 있는 학생입니다.";
						break;
					}
					else
					{
						str="성적 입력이 가능한 학생입니다.";
					}
				}
			}
			
			mav.addObject("result", str);
			mav.setViewName("MemberAjax");
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return mav;
	}

	
	
	
	
	
}
