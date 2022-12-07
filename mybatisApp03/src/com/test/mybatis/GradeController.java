package com.test.mybatis;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GradeController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/gradelist.action", method=RequestMethod.GET)
	public String gradeList(ModelMap model)
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
	
	
	@RequestMapping(value="/gradeupdateform.action", method=RequestMethod.GET)
	public String gradeUpdateForm(HttpServletRequest request, Model model)
	{
		String result = null;
		
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		String sid = request.getParameter("sid");
		
		model.addAttribute("grade", dao.search(sid));
		
		result = "/WEB-INF/view/GradeUpdateForm.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/gradeupdate.action", method=RequestMethod.POST)
	public String gradeUpdate(GradeDTO grade)
	{
		String result = null;
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.update(grade);
		
		result = "redirect:gradelist.action";
		
		return result;
	}
	
	
	@RequestMapping(value="/gradedelete.action", method=RequestMethod.GET)
	public String gradeRemove(String sid)
	{
		String result = null;
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		
		dao.remove(sid);
		
		result = "redirect:gradelist.action";
		
		return result;
	}
	
	
	@RequestMapping(value="/gradesidcheck.action", method=RequestMethod.POST)
	@ResponseBody
	public String gradeInsertFormSidCheck(@RequestParam("sid") String sid)
	{
		IGradeDAO dao = sqlSession.getMapper(IGradeDAO.class);
		IStudentDAO dao2 = sqlSession.getMapper(IStudentDAO.class);
		
		String result = null;
		int ea, ea2 = 0;
		
		ea = dao.ajaxcount(sid);
		
		ea2 = dao2.ajaxcount(sid);
		
		if(ea > 0)
		{
			result = "yes"; 
		}
		else
		{
			if(ea2 > 0)
				result = "no";
			else
				result = "error";
		}
		
		return result;
	}
	
	
	
	@RequestMapping(value="/ajax.action", method=RequestMethod.POST)
	@ResponseBody
	public String gradeUpdateFormCheckSub(@RequestParam("sub1") String sub1)
	{
		return sub1;
	}
	
	@RequestMapping(value="/ajax2.action", method=RequestMethod.POST)
	@ResponseBody
	public String gradeUpdateFormCheckSub2(@RequestParam("sub2") String sub2)
	{
		return sub2;
	}
	
	@RequestMapping(value="/ajax3.action", method=RequestMethod.POST)
	@ResponseBody
	public String gradeUpdateFormCheckSub3(@RequestParam("sub3") String sub3)
	{
		return sub3;
	}
	

	
}
