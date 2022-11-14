/*
================================================
	MemberDTO.java
	- 사용자 정의 자료형 클래스 활용
================================================
*/

package com.test.mvc;


public class MemberDTO
{

	
	private int mid;
	private String name, telephone;
	
	// getter / setter 구성
	public int getMid()
	{
		return mid;
	}
	public void setMid(int mid)
	{
		this.mid = mid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getTelephone()
	{
		return telephone;
	}
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}
	
	
}