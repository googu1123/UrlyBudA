package egovframework.rte.cmmn.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HttpConnection {
	public static String GetData(String strUrl) {
    	StringBuilder strResult = new StringBuilder("");
    	
        try {
            URL url = new URL(strUrl) ;
            HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
            urlConnection.setRequestMethod("GET");
            urlConnection.connect();
            
            if(urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
            	BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
            	
            	String inputLine;
            	while((inputLine = in.readLine()) != null) {
            		strResult.append(inputLine);
            	}
            } else {
            	strResult.append(urlConnection.getResponseCode());
            }
        } catch (MalformedURLException e) {
        	strResult.append(e.toString());
            e.printStackTrace();
        } catch (IOException e) {
        	strResult.append(e.toString());
            e.printStackTrace();
        }
        
        return strResult.toString();
    }
	
	public static String PostData(String strUrl, String strData) {
		StringBuilder strResult = new StringBuilder("");
		
		try {
			URL url = new URL(strUrl);
			HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
			
			urlConnection.setDefaultUseCaches(false);                                           
			urlConnection.setDoInput(true);
			urlConnection.setDoOutput(true);
			urlConnection.setRequestMethod("POST");
			
			urlConnection.setRequestProperty("content-type", "application/x-www-form-urlencoded");
           
			OutputStreamWriter outStream = new OutputStreamWriter(urlConnection.getOutputStream(), "UTF-8");
			PrintWriter writer = new PrintWriter(outStream);
			writer.write(strData.toString());
			writer.flush();
			
            if(urlConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
             
				BufferedReader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
				
				String inputLine;
	        	while((inputLine = in.readLine()) != null) {
	        		strResult.append(inputLine);
	        	}
            } else {
            	strResult.append(urlConnection.getResponseCode());
            }
		} catch (MalformedURLException e) {
			strResult.append(e.toString());
			e.printStackTrace();
        } catch (IOException e) {
        	strResult.append(e.toString());
        	e.printStackTrace();
        }
        
        return strResult.toString();
	}
}
