/*================================================
	MemberListController.java
	- 사용자 정의 컨트롤러
	- 회원 데이터 추가 액션 처리 클래스.
	- DAO 객체에 대한 의존성 주입을 위한 준비.
	  → setter injection
	     ① 인터페이스 형태의 자료형 구성
	     ② setter 구성
================================================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// 『implements Controller』 또는 『extends AbstractController』
//-- 서블릿에서 『HttpServlet』을 상속받은 서블릿 객체 역할
public class MemberInsertController implements Controller
{
	//인터페이스 자료형
	
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
		
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		
		try
		{
			MemberDTO member = new MemberDTO();
			
			member.setName(name);
			member.setTelephone(telephone);
			
			dao.add(member);
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// sendRedirect() → Memberlist.action
		//mav.setViewName("WEB/INF/view/MemberList.jsp"); // (X)"
		// → MemberListController 가 일을 할 수 있도록 처리
		//    → 이 컨트롤러에 의해 MemberList.jsp 가 클라이언트 만남
		//       → 데이터가 갱신된 내용으로 다시 요청할 수 있도록 처리
		//mav.setViewName("memberlist.action");
		
		mav.setViewName("redirect:memberlist.action");
		// 스프링컨테이너한테 안내를 해줘.
		return mav;
	}
	
	
	
}
