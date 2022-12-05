package com.test.mybatis;

import java.util.ArrayList;

public interface IGradeDAO
{
	public int add(GradeDTO g);
	public int count();
	public ArrayList<GradeDTO> list();
	
	public int remove(String sid);
	public int update(GradeDTO g);
	public GradeDTO search(String sid);
	
}
