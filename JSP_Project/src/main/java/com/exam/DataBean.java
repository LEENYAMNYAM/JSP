package com.exam;

import java.util.Calendar;

public class DataBean {

	Calendar ca = Calendar.getInstance();
	String[] arr = {"일", "월", "화", "수", "목", "금", "토"};
	
	public String getToday() {
		//년 월 일 요일 출력
		String str=ca.get(Calendar.YEAR) + "년 ";
		str += ca.get(Calendar.MONTH)+1 + "월 ";
		str += ca.get(Calendar.DATE) + "일 ";
		str += arr[ca.get(Calendar.DAY_OF_WEEK)-1] + "요일 ";
		
		return str;
	}
	
}
