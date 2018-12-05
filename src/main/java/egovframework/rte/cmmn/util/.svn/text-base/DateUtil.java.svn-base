package egovframework.rte.cmmn.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
* <p>Title: </p>
*
* <p>Description: </p>
*
* <p>Copyright: Copyright (c) 2006</p>
*
* @version 1.0
*/
public class DateUtil {
	
	/**
	* sDateNTimeForm 형식의 현재 시각 문자열을 얻는다.
	* @param sDateNTimeForm 현재시각 Formatting 문자열(년도:yyyy 월:MM 일:dd 시:HH 분:mm 초:ss)<br>
	* example - yyyyMMddHHmmss, yyyy년 MM월 dd일 HH시 mm분 ss초
	* @return 현재시간문자열
	*/
	public static String getDateNTimeByForm(String sDateNTimeForm) {
		Calendar Today = new GregorianCalendar();
		SimpleDateFormat sdf = new SimpleDateFormat(sDateNTimeForm);
		String sDateNTime = sdf.format(Today.getTime());
		
		return sDateNTime;
	}
	
	/**
	* sDateNTimeForm 형식의 문자열을 얻는다.
	* @param cDate 입력 날짜
	* @param sDateNTimeForm 현재시각 Formatting 문자열(년도:yyyy 월:MM 일:dd 시:HH 분:mm 초:ss)<br>
	* example - yyyyMMddHHmmss, yyyy년 MM월 dd일 HH시 mm분 ss초
	* @return 시간문자열
	*/
	public static String getDateNTimeByForm(java.util.Date cDate, String sDateNTimeForm) {
		SimpleDateFormat sdf = new SimpleDateFormat(sDateNTimeForm);
		String sDateNTime = sdf.format(cDate);
		
		return sDateNTime;
	}
	
	public static String getDateNTimeByForm(Calendar cal, String sDateNTimeForm) {
		SimpleDateFormat sdf = new SimpleDateFormat(sDateNTimeForm);
		String sDateNTime = sdf.format(cal.getTimeInMillis());
		
		return sDateNTime;
	}
}
