package egovframework.rte.cmmn.util;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Util {
	
	/**
	 * 문자열 바이트 단위로 자르기
	 * @param szText
	 * @param nLength
	 * @return
	 */
	public static String subStringByte(String szText, int nLength) {
		String r_val = szText;
		int oF = 0, oL = 0, rF = 0, rL = 0; 
		int nLengthPrev = 0;
		
		try {
			byte[] bytes = r_val.getBytes("UTF-8");     // 바이트로 보관 
			
			// x부터 y길이만큼 잘라낸다. 한글안깨지게.
			int j = 0;
			
			if (nLengthPrev > 0) while(j < bytes.length) {
				if((bytes[j] & 0x80) != 0) {
					oF+=2; rF+=3;
					if (oF+2 > nLengthPrev) {
						break;
					}
					j+=3;
				}
				else {
					if (oF+1 > nLengthPrev) {
						break;
					}
					++oF; ++rF; ++j;
				}
			}
			
			j = rF;
			
			while (j < bytes.length) {
				if ((bytes[j] & 0x80) != 0) {
					if (oL+2 > nLength) {
						break;
					}
					oL+=2; rL+=3; j+=3;
				}
				else {
					if(oL+1 > nLength) {
						break;
					}
					++oL; ++rL; ++j;
				}
			}
			
			r_val = new String(bytes, rF, rL, "UTF-8");  // charset 옵션
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}  
		
		return r_val;
	}

	public static String htmlConvert(String msg) {
		if (isNull(msg))
			return "";
		
		msg = msg.replaceAll("#\\{(.*?)\\}","#"); // 기존에 있던거 복사해왔음, 어떤기능인지 파악못함
		msg = msg.replaceAll("&apos;", "'");
		msg = msg.replaceAll("&quot;", "\"");
		msg = msg.replaceAll("&gt;", ">");
		msg = msg.replaceAll("&lt;", "<");
		msg = msg.replaceAll("&amp;", "&");
		return msg;
	}
	
	/**
	 * 게시글 내용에서 이미지 URL이 있으면  img html 태그를 붙여서 리턴
	 * (게시글에 이미지 url 이 있으면 이미지로 표시하기 위함)
	 * @param msg
	 * @return
	 */
	public static String htmlImageConvert(String msg) {
		final String SEARCH_TEXT[] = {"http://", "https://"};
		final String EXEC_LIST[] = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};
		
		String sSum = msg;
		String sCutMsg = "";
		
		for (int i = 0; i < SEARCH_TEXT.length; i++) {
			sCutMsg = sSum;
			sSum = "";
			
			int nStartPos = 0;
			int nEndPos = 0;
			
			while((nStartPos = sCutMsg.indexOf(SEARCH_TEXT[i])) != -1) {
				int nPos1 = sCutMsg.indexOf(" ", nStartPos);
				int nPos2 = sCutMsg.indexOf("\n", nStartPos);
				nEndPos = nPos1 == -1 ? nPos2 : nPos1;
				
				if (nEndPos == -1) {
					nEndPos = sCutMsg.length();
				}
				
				sSum += sCutMsg.substring(0, nStartPos);
				
				// 이미지 확장자 검사
				String sUrl = sCutMsg.substring(nStartPos, nEndPos);
				int nUrlLength = sUrl.length();
				if (nUrlLength > 3) {
					boolean isSearch = false;
					for (int j = 0; j < EXEC_LIST.length; j++) {
						String sExec = sUrl.substring(nUrlLength - EXEC_LIST[j].length(), nUrlLength).toLowerCase();
						
//						System.out.println("sExec:"+sExec + ":" + EXEC_LIST[j]);
						if (sExec.equals(EXEC_LIST[j])) {
							isSearch = true;
							sSum += "<img src='" + sCutMsg.substring(nStartPos, nEndPos) + "'/>";
							break;
						}
					}
					
					if (!isSearch)
						sSum += sCutMsg.substring(nStartPos, nEndPos);
				}
				else {
					sSum += sUrl;
				}
				
				sCutMsg = sCutMsg.substring(nEndPos, sCutMsg.length());
			}
			sSum += sCutMsg;
		}
		return sSum;
	}
	
	public static boolean isNull(String msg) {
		if (msg == null || msg.equals("") || msg.equals("null"))
			return true;
		return false;
	}
	
	public static String getNullReplace(String msg, String replacement) {
		if (msg == null || msg.equals("") || msg.equals("null"))
			return replacement;
		return msg;
	}
	
	public static int toInteger(String num) {
		if (isNull(num)) return 0;
		
		try {
			return Integer.parseInt(num);
		} catch(Exception e) {
			int pos = num.indexOf(".");
			if (pos > 0) {
				return toInteger(num.substring(0, pos));
			}
			return 0;
		}
	}
	

	public static String LPad(String Msg, int nLen, String reMsg) {
		
		if (isNull(Msg))
			return "";
		
		if (isNull(reMsg))
			reMsg = " ";
		
		String sResult = Msg;
		int len = sResult.length();
		
		for (int i = len; i < nLen; i++) {
			sResult = reMsg + sResult;
        }
		return sResult;
	}
	
	public static String getContentIndexTextChange(String content) {
		if (content == null || content.equals(""))
			return "";
		
		String sContent = content;
		sContent = replaceAll(sContent, "[", "[[]");
		sContent = replaceAll(sContent, "#", "%");
		sContent = replaceAll(sContent, " ", "");
		sContent = replaceAll(sContent, "\n", "");
		
		sContent = "%" + sContent;
		if (sContent.length() > 250)
			sContent = sContent.substring(0, 250);
		return sContent + "%";
	}
	
	public static String replaceAll(String msg, String regex, String replacement) {
		if (isNull(msg)) return "";
		
		if (isNull(regex) || (replacement == null)) return msg;
		
		int posStart = 0;
		int posEnd = msg.indexOf(regex);
		String sTemp = "";
		
		while(posEnd != -1) {
			sTemp += msg.substring(posStart, posEnd) + replacement;
			posStart = posEnd + 1;
			posEnd = msg.indexOf(regex, posStart);
		}
		sTemp += msg.substring(posStart, msg.length());
		
		return sTemp;
	}
	
	/**
	 * 마지막 날짜가 실제달보다 넘어가는지 체크
	 * @param date
	 * @return
	 */
	public static String getLastDateCheck(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Calendar calendar = Calendar.getInstance();
		int nDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		if (isNull(date))
			return sdf.format(calendar.getTime()) + "-" + nDayOfMonth;
		
		String arDate[] = date.split("-");
		if (arDate.length < 3)
			return sdf.format(calendar.getTime()) + "-" + nDayOfMonth;
		
		try {
			calendar.set(Integer.parseInt(arDate[0]), Integer.parseInt(arDate[1]) - 1, 1);
			nDayOfMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			
			if (Integer.parseInt(arDate[2]) > nDayOfMonth) {
				return arDate[0] + "-" + arDate[1] + "-" + nDayOfMonth;
			}
		} catch (Exception e) {
			return sdf.format(calendar.getTime()) + "-" + nDayOfMonth;
		}
		return date;
	}
}
