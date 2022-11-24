/* ======================================
 * #11. RegionDAO.java
 * - 데이터베이스 액션 처리 클래스.
 * - 지역 데이터 입력, 출력, 수정, 삭제
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

public class RegionDAO implements IRegionDAO
{
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Region> list() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		String sql = "SELECT REGIONID, REGIONNAME, DELCHECK"
				   + " FROM REGIONVIEW"
				   + " ORDER BY REGIONID";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Region region = new Region();
			
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
			region.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(region);
		}
		pstmt.close();
		rs.close();
		conn.close();
		
		return result;
	}

	@Override
	public int add(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql="INSERT INTO REGION(REGIONID, REGIONNAME)"
		 		 + " VALUES(REGIONSEQ.NEXTVAL, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, region.getRegionName());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int remove(String regionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql="DELETE"
				 + " FROM REGION"
				 + " WHERE REGIONID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(regionId));
		//pstmt.setInt(1, region.getRegionId());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int modify(Region region) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql="UPDATE REGION"
				+ " SET REGIONNAME = ?"
				+ " WHERE REGIONID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, region.getRegionName());
		pstmt.setInt(2, Integer.parseInt(region.getRegionId()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	@Override
	public String searchRegionName(String regionName) throws SQLException
	{
		String result = null;
		
		
		Connection conn = dataSource.getConnection();
		
		String sql="SELECT REGIONNAME"
				+ " FROM REGION"
				+ " WHERE REGIONNAME = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, regionName);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result = rs.getString("REGIONNAME");
		}
		
		pstmt.close();
		conn.close();
		rs.close();
		
		return result;
		
	}
	

	@Override
	public Region searchId(String regionId) throws SQLException
	{
		Region result = new Region();
		
		String sql = "SELECT REGIONID, REGIONNAME"
				   + " FROM REGION"
				   + " WHERE REGIONID = ?";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(regionId));
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setRegionId(rs.getString("REGIONID"));
			result.setRegionName(rs.getString("REGIONNAME"));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<Region> regList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		
		String sql ="SELECT REGIONID, REGIONNAME, DELCHECK"
				   + " FROM REGIONVIEW"
				   + " ORDER BY REGIONID";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			Region reg = new Region();
			
			reg.setRegionId(rs.getString("REGIONID"));
			reg.setRegionName(rs.getString("REGIONNAME"));
			reg.setDelCheck(rs.getInt("DELCHECK"));

			result.add(reg);
		}
		conn.close();
		pstmt.close();
		rs.close();
		
		
		
		return result;
	}
	
	
	
	
	
}
