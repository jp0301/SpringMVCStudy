/* ======================================
 * #09. EmployeeDAO.java
 * -
 * ======================================
 */

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public class EmployeeDAO implements IEmployeeDAO
{

	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		
		
		return result;
	}

	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		
		
		return result;
	}

	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		
		
		return result;
	}

	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		
		
		return result;
	}

	
	
	
	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		return 0;
	}

	
	
	
	
	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		return 0;
	}

	
	
	
	
	@Override
	public int remove(String EmployeeId) throws SQLException
	{
		return 0;
	}
	
	
	
	

	@Override
	public int modify(Employee employee) throws SQLException
	{
		return 0;
	}
	
	
	

	@Override
	public Employee searchId(String employeeId) throws SQLException
	{
		return null;
	}

	
	
	
	
	


	
}
