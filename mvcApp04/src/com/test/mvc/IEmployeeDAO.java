/* ======================================
 * #05. IEmployeeDAO.java
 * - 인터페이스
 * ======================================
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO
{
	// 추후 EmployeeDAO 에서 정의할 것으로 예상되는 메소드에 대한 선언
	public ArrayList<Employee> list() throws SQLException;
	public ArrayList<Region> regionList() throws SQLException;
	public ArrayList<Department> departmentList() throws SQLException;
	public ArrayList<Position> positionList() throws SQLException;
	
	// 왜 지역, 부서, 직위 목록 조회 리스트가 필요한가?
	/*
	 * 직원을 등록하려는 페이지
	 * 직원의 사는지역, 직책, 소속부서를 설정해서 등록하게끔 하기 위함.
	 */
	
	// 최소 기본급 얻어오기
	// 직위 선택했을 때 해당 직위의 기본급 보다 높게 설정시키기 위해
	// 만약 대리를 선택하면 최소 200만원이상은 입력시켜야한다.는 방식을 위함.
	public int getMinBasicPay(String positionId) throws SQLException;
	
	public int employeeAdd(Employee employee) throws SQLException;
	
	public int remove(String EmployeeId) throws SQLException;
	
	public int modify(Employee employee) throws SQLException;
	
	public Employee searchId(String employeeId) throws SQLException;

	
}
