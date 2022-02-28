package com.shop.db;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;

import javax.json.JsonObject;
import javax.net.ssl.HttpsURLConnection;

import org.json.JSONObject;

import com.google.gson.Gson;

public class VerifyCaptcha {
	 
	public static final String url = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secret = "6Lf5oCgeAAAAAM-RVoXrx-wAaYzBo0_-dmUyJ_Zf";
	private final static String USER_AGENT = "Mozilla/5.0";

	public static boolean verify(String gRecaptchaResponse) throws IOException {
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}
		
		try{

		URL obj = new URL(url);

		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

		// add request header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		String postParams = "secret=" + secret + "&response="
				+ gRecaptchaResponse;

		// Send post request
		con.setDoOutput(true);
		
		//DoOutput ==> can get output or response as well as get OutputStream
		//DoInput=> can send input or get InputStream 
		//DataOutputStream(OutputStream os);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush(); //send request
		wr.close(); //close stream

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + postParams);
		System.out.println("Response Code : " + responseCode);

		//Read Response from URL
		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		System.out.println(response.toString()); //JSON Response
		//Convert StringBuffer to String class object using toString
		
		//parse JSON response and return 'success' value
		//Gson jobj=new Gson();
		//boolean val=jobj.newJsonReader(new StringReader(response.toString())).nextBoolean();
		JSONObject jobj=new JSONObject(response.toString());
		boolean val=jobj.getBoolean("success");		
		return val;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
