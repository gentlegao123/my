package com.st.mall.util;

	import java.io.UnsupportedEncodingException;
	import java.security.MessageDigest;
	import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Encoder;

	public class MD5 {

	    public static String encode(String str) {
	        if (FmtEmpty.isEmpty(str)) {
	            return null;
	        }
	        // 确定计算方法
	        try {
	            MessageDigest md5 = MessageDigest.getInstance("MD5");
	            BASE64Encoder base64en = new BASE64Encoder();
	            return base64en.encode(md5.digest(str.getBytes("utf-8")));
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }

	}