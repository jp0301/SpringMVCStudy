/* ======================================
 * #09. EmployeeDAO.java
 * - 데이터베이스 액션 처리 클래스.
 * - 직원 데이터 입력, 출력, 수정, 삭제
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

public class EmployeeDAO implements IEmployeeDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
	
	// 직원 리스트
	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR"
				 + ", LUNARNAME, TELEPHONE, DEPARTMENTID, DEPARTMENTNAME"
				 + ", POSITIONID, POSITIONNAME, REGIONID, REGIONNAME"
				 + ", BASICPAY, EXTRAPAY, PAY, GRADE"
				 + " FROM EMPLOYEEVIEW"
				 + " ORDER BY EMPLOYEEID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Employee dto = new Employee();
			
			dto.setEmployeeId(rs.getString("EMPLOYEEID"));
			dto.setName(rs.getString("NAME"));
			dto.setSsn(rs.getString("SSN"));
			dto.setBirthday(rs.getString("BIRTHDAY"));
			dto.setLunar(rs.getInt("LUNAR"));
			dto.setLunarName(rs.getString("LUNARNAME"));
			dto.setTelephone(rs.getString("TELEPHONE"));
			dto.setDepartmentId(rs.getString("DEPARTMENTID"));
			dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			dto.setPositionId(rs.getString("POSITIONID"));
			dto.setPositionName(rs.getString("POSITIONNAME"));
			dto.setRegionId(rs.getString("REGIONID"));
			dto.setRegionName(rs.getString("REGIONNAME"));
			dto.setBasicPay(rs.getInt("BASICPAY"));
			dto.setExtraPay(rs.getInt("EXTRAPAY"));
			dto.setPay(rs.getInt("PAY"));
			dto.setGrade(rs.getInt("GRADE"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 지역 리스트
	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK"
				   + " FROM REGIONVIEW"
				   + " ORDER BY REGIONID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Region dto = new Region();
			
			dto.setRegionId(rs.getString("REGIONID"));
			dto.setRegionName(rs.getString("REGIONNAME"));
			dto.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
	}

	// 부서 리스트
	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				   + " FROM DEPARTMENTVIEW"
				   + " ORDER BY DEPARTMENTID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Department dto = new Department();
			
			dto.setDepartmentId(rs.getString("DEPARTMENTID"));
			dto.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			dto.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
	}

	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK"
				   + " FROM POSITIONVIEW"
				   + " ORDER BY POSITIONID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Position dto = new Position();
			
			dto.setPositionId(rs.getString("POSITIONID"));
			dto.setPositionName(rs.getString("POSITIONNAME"));
			dto.setMinBasicPay(rs.getInt("MINBASICPAY"));
			dto.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}

	
	// 직위 아이디에 따른 최소 기본급 확인/검색
	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		int result = 0;
		
		String sql="SELECT MINBASICPAY"
				 + " FROM POSITION"
				 + " WHERE POSITIONID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(positionId));
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
			result = rs.getInt("MINBASICPAY");
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		int result = 0;
		
		String sql="INSERT INTO EMPLOYEE("
				 + " EMPLOYEEID, NAME, SSN1, SSN2"
				 + ", BIRTHDAY"
				 + ", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID , REGIONID, BASICPAY, EXTRAPAY)"
				 + " VALUES("
				 + " EMPLOYEESEQ.NEXTVAL, ?, ?"
				 + ", CRYPTPACK.ENCRYPT(?, ?)"
				 + ", TO_DATE(?, 'YYYY-MM-DD')"
				 + ", ?, ?, ?, ?, ?, ?, ?)";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getSsn1());
		
		pstmt.setString(3, employee.getSsn2());
		pstmt.setString(4, employee.getSsn2());
		
		pstmt.setString(5, employee.getBirthday());
		pstmt.setInt(6, employee.getLunar());
		pstmt.setString(7, employee.getTelephone());
		pstmt.setInt(8, Integer.parseInt(employee.getDepartmentId()));
		pstmt.setInt(9, Integer.parseInt(employee.getPositionId()));
		pstmt.setInt(10, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(11, employee.getBasicPay());
		pstmt.setInt(12, employee.getExtraPay());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
	
	
	@Override
	public int remove(String employeeId) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE"
				   + " FROM EMPLOYEE"
				   + " WHERE EMPLOYEEID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(employeeId));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}
	
	
	
	

	@Override
	public int modify(Employee employee) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE EMPLOYEE"
				   + " SET NAME = ?, BIRTHDAY = TO_DATE(?, 'YYYY-MM-DD')"
				   + " , LUNAR = ?, TELEPHONE = ?"
				   + " , DEPARTMENTID = ?, POSITIONID = ?, REGIONID = ?"
				   + " , BASICPAY = ?, EXTRAPAY = ?, SSN1 = ?, SSN2 = CRYPTPACK.ENCRYPT(?, ?)"
				   + " WHERE EMPLOYEEID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getBirthday());
		pstmt.setInt(3, employee.getLunar());
		pstmt.setString(4, employee.getTelephone());
		pstmt.setInt(5, Integer.parseInt(employee.getDepartmentId()));
		pstmt.setInt(6, Integer.parseInt(employee.getPositionId()));
		pstmt.setInt(7, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(8, employee.getBasicPay());
		pstmt.setInt(9, employee.getExtraPay());
		pstmt.setString(10, employee.getSsn1());
		pstmt.setString(11, employee.getSsn2());
		pstmt.setString(12, employee.getSsn2());
		pstmt.setInt(13, Integer.parseInt(employee.getEmployeeId()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		
		return result;
	}
	
	
	

	@Override
	public Employee searchId(String employeeId) throws SQLException
	{
		Employee result = new Employee();
		
		String sql = "SELECT EMPLOYEEID, NAME, SSN1"
				   + ", TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY"
				   + ", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID"
				   + ", REGIONID, BASICPAY, EXTRAPAY"
				   + " FROM EMPLOYEE"
				   + " WHERE EMPLOYEEID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(employeeId));
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setEmployeeId(rs.getString("EMPLOYEEID"));
			result.setName(rs.getString("NAME"));
			result.setSsn1(rs.getString("SSN1"));
			result.setBirthday(rs.getString("BIRTHDAY"));
			result.setLunar(rs.getInt("LUNAR"));
			result.setTelephone(rs.getString("TELEPHONE"));
			result.setDepartmentId(rs.getString("DEPARTMENTID"));
			result.setPositionId(rs.getString("POSITIONID"));
			result.setRegionId(rs.getString("REGIONID"));
			result.setBasicPay(rs.getInt("BASICPAY"));
			result.setExtraPay(rs.getInt("EXTRAPAY"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	
	
}
