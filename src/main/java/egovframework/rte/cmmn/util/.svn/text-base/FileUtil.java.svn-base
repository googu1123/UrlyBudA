package egovframework.rte.cmmn.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import egovframework.rte.cms.service.TsmVO;

public class FileUtil 
{
	
	public static boolean SetFR(List<TsmVO> validList, String ing_path)
	{
		boolean r = false;
		
		String file_name = "";
		String fr_file_name = "";
		String btch_key = "";
		String link_field = "";
		String link_auth_type = "";
		String link_auth = "";
		String link_limit = "";
		String link_cnt = "";
		
		List<String> list = new ArrayList<String>();
		ArrayList<String> frList = new ArrayList<String>();
		
		for(int i=0 ; i<validList.size(); i++)
		{
			btch_key = validList.get(i).getBtch_key().trim();
			fr_file_name = btch_key+".fr";
			
			file_name = validList.get(i).getFile_name().trim();
			link_field = validList.get(i).getLink_field().trim();
			link_auth_type = validList.get(i).getLink_auth_type().trim();
			link_auth = validList.get(i).getLink_auth().trim();
			link_limit = validList.get(i).getLink_limit().trim();
			link_cnt = validList.get(i).getLink_cnt().trim();
			
			list = fileToList(ing_path+File.separator+fr_file_name);
			
			if(list!=null)
			{
				HttpConnection httpConn = new HttpConnection();
				for (int j=0; j<list.size(); j++)
				{
					Calendar cal = new GregorianCalendar(Locale.KOREA);
			        cal.add(Calendar.DAY_OF_YEAR, Integer.parseInt(link_limit));
			        
			        SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH시mm분ss초", Locale.KOREA);
			        String strDate = fm.format(cal.getTime());
			        
			        try
			        {
			        	Date d = fm.parse(strDate);
						long unixTime = d.getTime() / 1000;
						
						String[] urlDataArry = list.get(j).split("\\|");
						
						String m_btch_key = "";
						String m_replcmnt = "";
						String m_long_url = "";
						String m_short_url = "";

						m_btch_key = urlDataArry[0].toString();
						m_replcmnt = urlDataArry[1].toString();
						m_long_url = urlDataArry[2].toString();
						m_short_url = urlDataArry[3].toString();
						
						String http_result = "";
						String urlDecode="";
						
						if(m_btch_key.equals(btch_key) && link_field.equals(m_replcmnt))
						{
							http_result = httpConn.GetData(Common.SHORT_URL_SERVER+"/set?s=/"+m_short_url+"&l="+m_long_url+"&a="+link_auth_type+"&p="+link_auth+"&c="+link_cnt+"&e="+unixTime);
							
							try {
								urlDecode = URLDecoder.decode(m_long_url, "UTF-8");
							} catch (UnsupportedEncodingException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
							frList.add(m_btch_key+"|"+m_replcmnt+"|"+urlDecode+"|"+m_short_url+"|"+http_result);
						}
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			        
				} //list for end
			}
		}
		
		String strToday = getTodayPath();
		String fr_toDayPath = Common.FR_PATH+File.separator+strToday;
		
		if(makeDirs(fr_toDayPath))
        {
			String fr_file_name_ok = fr_toDayPath+File.separator+btch_key+".fr.ok";
        	r = ArrayListToFile(frList, fr_file_name_ok);
        	if(r)
        	{
        		if(fileMove(ing_path+File.separator+file_name+".mass",Common.LAST_PATH+File.separator+file_name+".mass"))
        		{
        			if(fileMove(ing_path+File.separator+file_name+".meta",Common.LAST_PATH+File.separator+file_name+".meta"))
        			{
        				r = fileDelete(ing_path+File.separator+fr_file_name);
        			}
        		}
        	}
        }
		
		return r;
	}
	
	public static List<String> fileToList(String filepath)
	{
		List<String> list = new ArrayList<String>();
		try 
		{
			FileReader fileReader = new FileReader(filepath);
	         
	        BufferedReader bufferedReader = new BufferedReader(fileReader);
	        
	        String line = null;
	         
	        while ((line = bufferedReader.readLine()) != null) 
	        {
	        	list.add(line);
	        }
	         
	        bufferedReader.close();
	         
	        //return list.toArray(new String[list.size()]);

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static String getTodayPath()
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Calendar c1 = Calendar.getInstance();
		String strYYMMDD = sdf.format(c1.getTime());
   
		String strYY = strYYMMDD.substring(0,4);
		String strMM = strYYMMDD.substring(4,6);
		String strDD = strYYMMDD.substring(6,8);
   
		String strToday = strYY+File.separator+strMM+File.separator+strDD;
	 
		return strToday;
	}
	
	public static boolean makeDirs(String path)
	{
		boolean r = false;
		 
		File Dir = new File(path);
		if (!Dir.exists()) {
			if (Dir.mkdirs()) {
				r = true;
			} else {
				 r = false;
			}
		}else{
			 r = true;
		}
		
		return r;
	}
	
	public static boolean ArrayListToFile(ArrayList<String> list, String path)
	{
		boolean r = false;
		FileWriter writer;
		try {
			writer = new FileWriter(path);
			for(String str: list) 
			{
				writer.write(str);
				writer.write("\n");
			}
			writer.close();
			r = true;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return r;
	}
	
	public static boolean fileMove(String in , String out)
	{
		File file = new File(in);
		File fileToMove = new File(out);
		boolean isMoved = file.renameTo(fileToMove);
		
		return isMoved;
	}
	
	public static boolean fileDelete(String filepath) 
	{
		boolean r = false;
		
		File file = new File(filepath);
		r = file.delete();
		
		return r;
	}
}
