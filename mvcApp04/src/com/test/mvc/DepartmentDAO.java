/* ======================================
 * #10. DepartmentDAO.java
 * - 데이터베이스 액션 처리 클래스.
 * - 부서 데이터 입력, 출력, 수정, 삭제
 * - Connection 객체에 대한 의존성 주입을 위한 준비
 *   (인터페이스 자료형 / setter 구성)
 * ======================================
 */

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class DepartmentDAO implements IDepartmentDAO
{
	
	private DataSource dataSource;
	
	public void getConnection(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	@Override
	public ArrayList<Department> list() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				   + " FROM DEPARTMENTVIEW"
				   + " ORDER BY DEPARTMENTID";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Department department = new Department();
			
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(department);
		}
		
		conn.close();
		rs.close();
		pstmt.close();
		
		return result;
	}

	@Override
	public int add(Department department) throws SQLException
	{
		int result = 0;
		
		String sql = "INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME)"
				   + " VALUES(DEPARTMENTSEQ.NEXTVAL, ?)";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, department.getDepartmentName());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int remove(String departmentId) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE"
				   + " FROM DEPARTMENT"
				   + " WHERE DEPARTEMNTID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, departmentId);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int modify(Department department) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE DEPARTMENT"
				   + " SET DEPARTMENTNAME = ?"
				   + " WHERE DEPARTEMNTID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, department.getDepartmentName());
		pstmt.setInt(2, Integer.parseInt(department.getDepartmentId()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}

	
	
	
}
