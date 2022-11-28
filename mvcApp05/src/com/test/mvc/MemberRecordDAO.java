/* ======================================
 * #06. IMemberRecordDAO.java
 * - 데이터베이스 액션 처리 클래스.
 * - 성적 데이터 입력, 출력, 수정, 삭제
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

public class MemberRecordDAO implements IMemberRecordDAO
{

	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	
	@Override
	public ArrayList<MemberRecord> list() throws SQLException
	{
		ArrayList<MemberRecord> result = new ArrayList<MemberRecord>();
		
		String sql = "SELECT SCOREID, KOR, ENG, MAT, ID"
				   + " FROM MEMBERRECORD"
				   + " ORDER BY SCOREID";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberRecord memberrecord = new MemberRecord();
			
			memberrecord.setScoreId(rs.getInt("SCOREID"));
			memberrecord.setKor(rs.getInt("KOR"));
			memberrecord.setEng(rs.getInt("ENG"));
			memberrecord.setMat(rs.getInt("MAT"));
			memberrecord.setId(rs.getString("ID"));
			
			result.add(memberrecord);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int add(MemberRecord memberRecord) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		String sql = "INSERT INTO MEMBERRECORD(SCOREID, KOR, ENG, MAT, ID)"
				   + " VALUES(MEMBERRECORDSEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, memberRecord.getKor());
		pstmt.setInt(2, memberRecord.getEng());
		pstmt.setInt(3, memberRecord.getMat());
		pstmt.setString(4, memberRecord.getId());

		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int remove(int scoreId) throws SQLException
	{
		int result = 0;
		
		String sql = "DELETE"
				   + " FROM MEMBERRECORD"
				   + " WHERE SCOREID=?"; 
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, scoreId);
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public int modify(MemberRecord memberRecord) throws SQLException
	{
		int result = 0;
		
		String sql = "UPDATE MEMBERRECORD"
				   + " SET KOR=?, ENG=?, MAT=?"
				   + " WHERE SCOREID=?"; 
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, memberRecord.getKor());
		pstmt.setInt(2, memberRecord.getEng());
		pstmt.setInt(3, memberRecord.getMat());
		pstmt.setInt(4, memberRecord.getScoreId());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public MemberRecord searchId(int scoreId) throws SQLException
	{
		MemberRecord result = new MemberRecord();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT SCOREID, KOR, ENG, MAT, ID"
				   + " FROM MEMBERRECORD"
				   + " WHERE SCOREID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, scoreId);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			result.setScoreId(rs.getInt("SCOREID"));
			result.setKor(rs.getInt("KOR"));
			result.setEng(rs.getInt("ENG"));
			result.setMat(rs.getInt("MAT"));
			result.setId(rs.getString("ID"));			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}


	@Override
	public ArrayList<MemberRecord> memrecList() throws SQLException
	{
		ArrayList<MemberRecord> result = new ArrayList<MemberRecord>();
		
		String sql = "SELECT SCOREID, KOR, ENG, MAT, ID"
				   + " FROM MEMBERRECORD"
				   + " ORDER BY SCOREID";
		
		Connection conn = dataSource.getConnection();
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberRecord memberrecord = new MemberRecord();
			
			memberrecord.setScoreId(rs.getInt("SCOREID"));
			memberrecord.setKor(rs.getInt("KOR"));
			memberrecord.setEng(rs.getInt("ENG"));
			memberrecord.setMat(rs.getInt("MAT"));
			memberrecord.setId(rs.getString("ID"));
			
			result.add(memberrecord);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
