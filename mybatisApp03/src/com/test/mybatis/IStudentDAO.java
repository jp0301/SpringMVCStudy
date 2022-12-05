package com.test.mybatis;

import java.util.ArrayList;

public interface IStudentDAO
{
	public int add(StudentDTO s);
	public int count();
	public ArrayList<StudentDTO> list();
	
	public int remove(String sid);
	public int update(StudentDTO s);
	public StudentDTO search(String sid);

}
