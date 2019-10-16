package com.st.mall.util;

public class FmtEmpty {

public static boolean isEmpty(String str) {
	if(str==null || str.trim().isEmpty()) {
		return true;
	}
	
	return false;
	
	
}
}