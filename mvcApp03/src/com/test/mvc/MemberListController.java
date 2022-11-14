/*================================================
	MemberListController.java
	- 사용자 정의 컨트롤러
	- 리스트 출력 액션
	- DAO 객체에 대한 의존성 주입
================================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class MemberListController implements Controller
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
		
		request.setCharacterEncoding("UTF-8");
		
		int count = 0;
		ArrayList<MemberDTO> memberlist = new ArrayList<MemberDTO>();
		
		try
		{
			count = dao.count();
			memberlist = dao.list();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		

		mav.setViewName("/WEB-INF/view/MemberList.jsp");
		mav.addObject("count", count);
		mav.addObject("memberlist", memberlist);
		
		return mav;
	}
	
}
