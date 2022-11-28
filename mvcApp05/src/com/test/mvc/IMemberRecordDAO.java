/* ======================================
 * #04. IMemberRecordDAO.java
 * - 인터페이스
 * ======================================
 */
package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMemberRecordDAO
{
	public ArrayList<MemberRecord> list() throws SQLException;	// 리스트
	public int add(MemberRecord memberRecord) throws SQLException;	// 입력
	public int remove(int scoreId) throws SQLException;	// 삭제
	public int modify(MemberRecord memberRecord) throws SQLException;	// 수정
	
	public MemberRecord searchId(int scoreId) throws SQLException;
	
	public ArrayList<MemberRecord> memrecList() throws SQLException;
	
}
