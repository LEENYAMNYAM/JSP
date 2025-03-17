package com.utils;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;

public class JSFunction {
	// p155 참고
	public static void alertLocation(String msg, String url, HttpServletResponse response) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String script ="<script>"
					+ " alert('" + msg + "'); "
					+ "location.href='" + url + "';"
					+ "</script>";
			out.println(script);
		}catch(Exception e) {
			
		}
	}
	// 교재 14장 p496참고, p523도 참고
	public static void alertBack(HttpServletResponse response, String msg) {
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			String script ="<script>"
					+ " alert('" + msg + "'); "
					+ " history.back(); "  			//이전 페이지로 넘어간다는 의미
					+ "</script>";
			out.println(script);
		}catch(Exception e) {
			
		}
	}
	
	
}
