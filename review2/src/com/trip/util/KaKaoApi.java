package com.trip.util;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class KaKaoApi {

	public static String KaKaoRestKey = "a925c68fbb98e7d9a901a2ab01848b94";

	
	public static String searchPlace(String searchValue, String category) throws IOException {
		return searchPlace(searchValue, category,null);
	}
	
	public static String searchPlace(String searchValue, String category, String page) throws IOException {

		String encodeValue = URLEncoder.encode(searchValue,"UTF-8");
		String locationCode = null;
		if(category.equals("명소")) {
			locationCode = "AT4";
		} else if (category.equals("맛집")) {
			locationCode = "FD6";
		} else if (category.equals("숙소")) {
			locationCode = "AD5";
		}
		
		String requestURL = "https://dapi.kakao.com/v2/local/search/keyword.json?size=4&category_group_code="+ locationCode + "&query=" + encodeValue + "&page=" + ((page != null)? page : 1);
		URL url = new URL(requestURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.addRequestProperty("Authorization", "KakaoAK " + KaKaoRestKey);
		con.setRequestProperty("X-Requested-With", "curl");
		con.setRequestMethod("GET");
		
		InputStream in = con.getInputStream();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] buf = new byte[1024 * 8];
			int length = 0;
			while ((length = in.read(buf)) != -1) {
				out.write(buf, 0, length);
		}
		String searchJson = new String(out.toByteArray(), "UTF-8");	
		
		con.disconnect();

		return searchJson;
	}
	
	public static String search(String whereRest, String searchValue, int page, int size) throws IOException {
		String encodeValue = URLEncoder.encode(searchValue,"UTF-8");
		
		String requestURL = "https://dapi.kakao.com/v2/search/"+ whereRest +"?page="+page+"&size="+size+"&query=" + encodeValue;
		URL url = new URL(requestURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.addRequestProperty("Authorization", "KakaoAK " + KaKaoRestKey);
		con.setRequestProperty("X-Requested-With", "curl");
		con.setRequestMethod("GET");
		
		InputStream in = con.getInputStream();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] buf = new byte[1024 * 8];
			int length = 0;
			while ((length = in.read(buf)) != -1) {
				out.write(buf, 0, length);
		}
		String searchJson = new String(out.toByteArray(), "UTF-8");	
		
		con.disconnect();

		return searchJson;
	}
	
}
