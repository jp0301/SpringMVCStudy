package com.test.mvc;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// ①
@Controller
public class MemberRecordController
{
	
	// ② 데이터베이스로부터 멤버 리스트를 읽어오는 과정
	@RequestMapping("/memberlist.action")
	public String memberList(Model model)
	{
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connect();
			list = dao.list();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.disConnect();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		model.addAttribute("list", list);
		
		return "/WEB-INF/view/MemberList.jsp";
	}
	
	
	
	// ③ 데이터 입력 폼 요청에 대한 처리 과정
	@RequestMapping("/memberinsertform.action")
	public String memberInsertForm()
	{
		String result = "/WEB-INF/view/MemberInsertForm.jsp";
		
		return result;
	}
	
	// ④ 데이터 입력 액션 요청에 대한 처리 과정
	@RequestMapping("/memberinsert.action")
	public String memberInsert(MemberDTO dto)
	{
		MemberDAO dao = new MemberDAO();
		
		try
		{
			dao.connect();
			
			dao.insertQuery(dto);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				dao.disConnect();
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		
		return "/WEB-INF/view/MemberInsert.jsp";
	}
	
	
	
}
