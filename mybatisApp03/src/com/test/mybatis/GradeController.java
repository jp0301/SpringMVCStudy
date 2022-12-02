package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GradeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/gradelist.action", method=RequestMethod.GET)
	public String gradeList(Model model)
	{
		String result = "";
		
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		
		result = "WEB-INF/view/GradeList.jsp";
				
		return result;
	}
	
	@RequestMapping(value="/gradeinsertform.action", method=RequestMethod.GET)
	public String gradeInsertForm(GradeDTO g)
	{
		
		String result = null;
		
		result = "WEB-INF/view/GradeInsertForm.jsp";
		
		return result;
		
	}
	
	@RequestMapping(value="/gradeinsert.action", method=RequestMethod.POST)
	public String gradeInsert(GradeDTO g)
	{
		String result = null;
		
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.add(g);
		
		result = "redirect:gradelist.action";
		
		
		return result;
	}
	
	
	
	
	
}
