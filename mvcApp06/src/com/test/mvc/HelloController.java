/* =======================================
 * HelloController.java
 * - 사용자 정의 컨트롤러 클래스
 * =======================================
 * */

package com.test.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
*/



@Controller
public class HelloController //implements Controller
{
	/*
	 * @Override
	 * public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception 
	 * {
	 *     ModelAndView mav = new
	 *     ModelAndView();
	 * 
	 *     String message = "Hello, Spring MVC World~!!!";
	 * 
	 *     return mav;
	 * }
	 */
	
	
	// ※ 액션 처리를 위해 사용하는 메소드는 사용자가 알아서 정의 / 지정
	/*
	@RequestMapping("/URL매핑주소")
	public String 메소드이름(매개변수)
	{
		// ※ 비즈니스 로직 처리(모델 활용)
		// ...
		
		return "뷰이름.jsp";
	}
	 */
	
	@RequestMapping("/hello.action")
	public String helloAct(Model model)
	{
		// ※ 비즈니스 로직 처리(모델 활용)		
		// ...
		
		model.addAttribute("hello", "Hello, SpringMVCAnnotation World~!!!");
		
		return "/WEB-INF/view/Hello.jsp";
	}
	
}
