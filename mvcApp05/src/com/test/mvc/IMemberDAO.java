/* ======================================
 * #03. IMemberDAO.java
 * - 인터페이스
 * ======================================
 */
package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IMemberDAO
{
	public ArrayList<Member> list() throws SQLException;	// 리스트
	public int add(Member member) throws SQLException;	// 입력
	public int remove(String id) throws SQLException;	// 삭제
	public int modify(Member member) throws SQLException;	// 수정
	
	public Member searchId(String id) throws SQLException;
	
	
	public String login(String id, String pw) throws SQLException; 		// 학생 로그인 메소드
	public String loginAdmin(String id, String pw) throws SQLException; // 관리자 로그인 메소드
	
	// 학생이 조회하는 리스트 추가
	public ArrayList<Member> memList() throws SQLException;
	
}
