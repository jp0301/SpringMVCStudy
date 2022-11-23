/* ==============================================
 * #24. EmployeeUpdateFormController.java
 * - 사용자 정의 컨트롤러 클래스
 * - 직원 데이터 수정 폼 요청에 대한 액션 처리.
 * - DAO 객체에 대한 의존성 주입(DI)을 위한 준비.
 *   → 인터페이스 자료형
 *   → setter 메소드 정의.
 * ==============================================
 */


package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class EmployeeUpdateFormController implements Controller
{
	// check~!!!
	// EmployeeInsertFormController 와는 다른 방식으로 처리~!!!
	// 완성이 된 이후에 비교할 것~!!!
	
	// 인터페이스 자료형을 기반으로 속성 구성
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;
	
	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}
	
	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}

	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}

	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		// 세션 처리과정추가(로그인에 대한 확인과정 추가
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name") == null) // 로그인 되어있지않은 상황
		{
			// 로그인이 되어있지 않은 상황에서의 처리
			//-- 로그인 폼 페이지를 다시 요청할 수 있도록 안내
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if(session.getAttribute("admin") == null) // 로그인은 되어있지만 관리자가 아닌 상황
		{
			// 관리자가 아닌 상황 즉, 일반 사원일 때의 처리
			mav.setViewName("redirect:logout.action");
			return mav;
		}
		
		// ----------------- 세션 처리 과정 추가(로그인에 대한 확인과정 추가)
		
		
		
		try
		{
			// 이전 페이지(EmployeeList.jsp)로부터 데이터 수신
			//-- employeeId
			String employeeId = request.getParameter("employeeId");

			Employee employee = new Employee();

			employee = employeeDAO.searchId(employeeId);

			regionList = regionDAO.list();
			departmentList = departmentDAO.list();
			positionList = positionDAO.list();
			
			mav.addObject("employee", employee);
			
			
			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", departmentList);
			mav.addObject("positionList", positionList);
			
			//mav.setViewName("/WEB-INF/view/EmployeeUpdateForm.jsp");
			mav.setViewName("EmployeeUpdateForm");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	

}
