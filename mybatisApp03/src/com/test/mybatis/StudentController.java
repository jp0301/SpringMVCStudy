package com.test.mybatis;


import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentController
{

	@Autowired
	private SqlSession sqlSession;
	
	
	// 매개변수를 등록하는 과정에서 매개변수 목록(인자리스트)에 적혀있는
	// 클래스의 객체 정보는 스프링이 제공한다.
	
	// 사용자의 요청 주소와 메소드를 매핑하는 과정 필요
	// @RequestMapping(value="요청주소", method="전송방식")
	// 이 때, 전송 방식은 폼을 이용한 submit 액션인 경우만 POST
	// 나머지 모든 전송 방식은 GET 으로 처리한다.
	@RequestMapping(value="/studentlist.action", method=RequestMethod.GET)
	public String studentList(Model model)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/view/StudentList.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value="/studentinsertform.action", method=RequestMethod.GET)
	public String studentInsertForm()
	{
		String result = null;

		result = "/WEB-INF/view/StudentInsertForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/studentinsert.action", method=RequestMethod.POST)
	public String studentInsert(StudentDTO student)
	{
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.add(student);
		
		return "redirect:studentlist.action";
	}
	
	@RequestMapping(value="/studentupdateform.action", method=RequestMethod.GET)
	public String studentUpdateForm(HttpServletRequest request, Model model)
	{
		String result = null;
		
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		String sid = request.getParameter("sid");
		
		model.addAttribute("student", dao.search(sid));
		
		result = "/WEB-INF/view/StudentUpdateForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/studentupdate.action", method=RequestMethod.POST)
	public String studentUpdate(StudentDTO student)
	{
		String result = null;
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.update(student);
		
		result = "redirect:studentlist.action";
		
		return result;
	}
	
	
	@RequestMapping(value="/studentdelete.action", method=RequestMethod.GET)
	public String studentRemove(String sid)
	{
		String result = null;
		IStudentDAO dao = sqlSession.getMapper(IStudentDAO.class);
		
		dao.remove(sid);
		
		result = "redirect:studentlist.action";
		
		return result;
	}
	
	
	
	
	
}
