/* ==========================
 * FileManager.java
 * ==========================
 */


package com.test.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;


public class FileManager
{
	// 파일 다운로드 메소드 정의
	// - saveFileName : 서버에 저장된 파일 이름
	// - originalFileName : 클라이언트가 업로드한 파일 이름
	// - path : 서버에 저장된 경로
	// - response : HTTP 프로토콜을 기반으로 응답하는 객체
	public static boolean doFileDownload(String saveFileName
									   , String originalFileName
									   , String path
									   , HttpServletResponse response)
	{
		// 파일 이름 포함된 경로 구성
		String loadDir = path + File.separator + saveFileName;
		
		// 확인(테스트)
		System.out.println(loadDir);
		
		
		try
		{	
			if (originalFileName == null || originalFileName.equals(""))
			{
				originalFileName = saveFileName;
			}
			originalFileName = new String(originalFileName.getBytes("EUC-KR"), "8859_1");
			
		}
		catch (UnsupportedEncodingException e)
		{
			System.out.println(e.toString());
		}
			
			
			
		try
		{
			File file = new File(loadDir);
			
			// 파일 객체가 존재하면
			if(file.exists())
			{
				byte[] readByte = new byte[4096];
				
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition", "attachment;filename=" + originalFileName);
				
				// 읽어오기 위해 만들었고
				BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file));
				
				// 내보낼때 쓰기 위해서 가져옴
				OutputStream os = response.getOutputStream();
				
				int read;
				//                    readByte, 0, readByte.length
				while( (read=fis.read(readByte, 0, 4096)) != -1)
				{
					os.write(readByte, 0, read);
				}
				
				os.flush();
				os.close();
				fis.close();
				
				return true;
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return false;
	} // doFileDownload
	
	
	
	
	// 실제 파일 삭제(제거)
	// - fileName : 파일 이름
	// - path : 경로
	public static void doFileDelete(String fileName, String path)
	{
		try
		{
			File file = null;
			String fullFileName = path + File.separator + fileName;
			file = new File(fullFileName);
			
			if (file.exists())
			{
				file.delete();
			}
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}

	}
	
	
}
