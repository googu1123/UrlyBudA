package egovframework.rte.cms.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;














import org.json.JSONArray;
import org.json.JSONObject;
//import org.json.simple.JSONArray;
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.json.simple.JSONObject;
//import org.json.simple.JSONValue;
//import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;




















import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

import egovframework.rte.cmmn.util.Common;
import egovframework.rte.cmmn.util.ExcelRead;
import egovframework.rte.cmmn.util.HttpConnection;
import egovframework.rte.cmmn.util.JsonHelper;
import egovframework.rte.cmmn.util.Util;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class CampaignController {

	/** MainService */
	@Resource(name = "tsmService")
	private TsmService tsmService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	//네비 메뉴
	private static int NAVI_NUM = 6;

								
	@RequestMapping("/campaign.do")
	public String campaign(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				
				
//				//리스트 조회
//				int totalCount = tsmService.campaignTotalCnt(tsmVO);
//				
//				//페이징 처리
//				if(Common.pagingOrder(totalCount, tsmVO, model, request)){
//					List<TsmVO> campaignList = tsmService.campaignList(tsmVO);
//					
//					model.addAttribute("use_yn", tsmVO.getUse_yn());
//					model.addAttribute("subject", tsmVO.getSubject());
//					model.addAttribute("campaignList", campaignList);
//					
//				} else {
//					throw new Exception("ERR_PAGING_FAIL");
//				}
//				model.addAttribute("navi", NAVI_NUM);
//				return "/tsm/tsm_0601";
				
				return "/url/url_0101";
				
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.do");
				return "/common/link";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/common/500";
		}
		
	}
	 
	@RequestMapping("/campaignList.do")
	public @ResponseBody String campaignList(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		System.out.println(">>>>>> campaignList.do");
	
		//JSONObject jsonObject= (JSONObject) JSONValue.parse(data);
		JSONObject jsonObject = new JSONObject(data); 
		
		System.out.println("uid >>>>>>"+jsonObject.get("uid"));
		System.out.println("limit >>>>>>"+jsonObject.get("limit"));
		System.out.println("pageNo >>>>>>"+jsonObject.get("pageNo"));
		System.out.println("skip >>>>>>"+jsonObject.get("skip"));
		
		String in = "uid="+jsonObject.get("uid")+"&limit="+jsonObject.get("limit")+"&skip="+jsonObject.get("skip");;
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/groups?",in);
		
		System.out.println("result >> " + result);
			
		return result;
	}
	
	@RequestMapping("/urlList.do")
	public @ResponseBody String urlList(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		System.out.println(">>>>>> urlList.do");
	
		//JSONObject jsonObject= (JSONObject) JSONValue.parse(data);
		JSONObject jsonObject = new JSONObject(data); 
		
		System.out.println("uid >>>>>>"+jsonObject.get("uid"));
		System.out.println("limit >>>>>>"+jsonObject.get("limit"));
		System.out.println("skip >>>>>>"+jsonObject.get("skip"));
		System.out.println("gid >>>>>>"+jsonObject.get("gid"));
//		System.out.println("_id >>>>>>"+jsonObject.get("_id"));
		
		System.out.println("pageNo >>>>>>"+jsonObject.get("pageNo"));
		
		String in = "uid="+jsonObject.get("uid")+"&limit="+jsonObject.get("limit")
				+"&skip="+jsonObject.get("skip")+"&gid="+jsonObject.get("gid");
		
		System.out.println("in >>>>>>"+in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/urls?",in);
		
		System.out.println("result >> " + result);
			
		return result;
	}
	
	//캠페 상세 보기
	@RequestMapping("/campaignDetail.do")
	public String campaignDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println(">>>>"+tsmVO.toString());
		if(Common.sessionCheck(session)){
			
			String gid = request.getParameter("gid");
			System.out.println(gid);
			
			String in = "limit=1&_id="+gid;
			String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/groups?",in);
			System.out.println("result >> " + result);
			
			JSONObject resultJson = new JSONObject(result);
			System.out.println("data >>>>>>"+resultJson.get("data"));
			
			JSONArray jarr = new JSONArray();
			jarr = resultJson.getJSONArray("data");
			
			Map<String, Object> map = new HashMap<>();
			for (int i = 0; i<jarr.length(); i++)
			{
				map = JsonHelper.toMap(jarr.getJSONObject(i));
			}
			
//			TsmVO campaignDetail = tsmService.campaignDetail(tsmVO);
//			model.addAttribute("navi", NAVI_NUM);
//			model.addAttribute("len_subject", 100);
//			model.addAttribute("len_add_content", 100);
//			model.addAttribute("len_content", 2048);
//			model.addAttribute("view", campaignDetail);
			
			model.addAttribute("group", map);
			
			return "/url/url_010101";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.do");
			return "/common/link";
		}
	}
	
	@RequestMapping("/campaignSave.do")
	public @ResponseBody String campaignSave(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		
		System.out.println(">>>>>> campaignSave.do");
		
//		System.out.println("gid >>>>>>"+request.getParameter("gid"));
//		System.out.println("uid >>>>>>"+request.getParameter("uid"));
//		System.out.println("expires >>>>>>"+request.getParameter("expires"));
//		System.out.println("counts >>>>>>"+request.getParameter("counts"));
		
		JSONObject jsonObject = new JSONObject(data);
		
		System.out.println("gid >>>>>>"+jsonObject.get("gid"));
		System.out.println("uid >>>>>>"+jsonObject.get("uid"));
		System.out.println("expires >>>>>>"+jsonObject.get("expires"));
		System.out.println("authType >>>>>>"+jsonObject.get("authType"));
		System.out.println("counts >>>>>>"+jsonObject.get("counts"));
		
		
		String expires = jsonObject.get("expires").toString().replace("-", "").trim();
		expires += "235959";
		
//		System.out.println("expires : "+ expires);
		
        SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmmss");
        Date cal = fm.parse(expires);
        
//        System.out.println("cal >>" + cal.toString());
        
        //long unixTime = cal.getTime() / 1000;
        long unixTime = cal.getTime();
		
		String in = "uid="+jsonObject.get("uid")+"&gid="+jsonObject.get("gid")+"&expires="+unixTime
				+"&authTypes="+jsonObject.get("authType")+"&counts="+jsonObject.get("counts");
		
		System.out.println("in >>>"+ in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/group?",in);
		
		JSONObject out = new JSONObject();
		out.put("result", result);
		
		System.out.println("out >>" + out.toString());

		return out.toString();

//		return "redirect:campaign.do";
        
	}
	
	@RequestMapping("/shortUrlSave.do")
	public @ResponseBody String shortUrlSave(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		
		System.out.println(">>>>>> shortUrlSave.do");
				
		JSONObject jsonObject = new JSONObject(data);
		
		
		System.out.println("gid >>>>>>"+jsonObject.get("gid"));
		System.out.println("uid >>>>>>"+jsonObject.get("uid"));
		System.out.println("longurl >>>>>>"+jsonObject.get("longurl"));
		System.out.println("authType >>>>>>"+jsonObject.get("authType"));
		System.out.println("authKey >>>>>>"+jsonObject.get("authKey"));
		System.out.println("expires >>>>>>"+jsonObject.get("expires"));
		System.out.println("counts >>>>>>"+jsonObject.get("counts"));
		System.out.println("_id >>>>>>"+jsonObject.get("_id"));
		
		String expires = jsonObject.get("expires").toString().replace("-", "").trim();
		expires += "235959";
		
//		System.out.println("expires : "+ expires);
		
        SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmmss");
        Date cal = fm.parse(expires);
        
//        System.out.println("cal >>" + cal.toString());
        
        //long unixTime = cal.getTime() / 1000;
        long unixTime = cal.getTime();
        
        String ServiceApi = "";
		
		String in = "gid="+jsonObject.get("gid")
				+"&uid="+jsonObject.get("uid")
				+"&l="+jsonObject.get("longurl")
				+"&a="+jsonObject.get("authType")
				+"&p="+jsonObject.get("authKey")
				+"&c="+jsonObject.get("counts")
				+"&e="+unixTime;
		
		if (jsonObject.get("_id").equals("") || jsonObject.get("_id") == null )
		{
			ServiceApi = "/uset?";
		}else{
			ServiceApi = "/uupdate?";
			in = in + "&_id="+jsonObject.get("_id");
		}
		System.out.println("in >>>"+ in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+ServiceApi,in);
		
		JSONObject out = new JSONObject();
		out.put("result", result);
		
		System.out.println("out >>" + out.toString());

		return out.toString();

//		return "redirect:campaign.do";
        
	}
	
	@RequestMapping("/urls.do")
	public @ResponseBody String urls(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {

		System.out.println(">>>>>> urls.do");
	
		//JSONObject jsonObject= (JSONObject) JSONValue.parse(data);
		JSONObject jsonObject = new JSONObject(data); 
		
		System.out.println("_id >>>>>>"+jsonObject.get("_id"));
		System.out.println("limit >>>>>>"+jsonObject.get("limit"));
		
		String in = "_id="+jsonObject.get("_id")
				+"&limit="+jsonObject.get("limit");
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/urls?",in);
		
		System.out.println("result >> " + result);
		
		JSONObject resultJson = new JSONObject(result);
		System.out.println("data >>>>>>"+resultJson.get("data"));
		
		JSONArray jarr = new JSONArray();
		jarr = resultJson.getJSONArray("data");
		
		JSONObject outJson  = new JSONObject();
		for (int i = 0; i<jarr.length(); i++)
		{
			outJson = (JSONObject) JsonHelper.toJSON(jarr.getJSONObject(i));
		}
		
		return outJson.toString();
	}
	
	
	//캠페인 정보 수정
	@RequestMapping("/campaignUpdate.do")
	public @ResponseBody String campaignUpdate(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		
		System.out.println(">>>> campaignUpdate.do");
			
//			String _id = request.getParameter("gid");
//			String uid = request.getParameter("uid");
//			String authType = request.getParameter("authType");
//			String counts = request.getParameter("counts");
//			String expires = request.getParameter("expires").replace("-", "").trim();
//			expires += "235959";
		
		JSONObject jsonObject = new JSONObject(data);
		
		String _id = (String) jsonObject.get("gid");
		String uid = (String) jsonObject.get("uid");
		String authType = (String) jsonObject.get("authType");
		String counts = (String) jsonObject.get("counts");
		String expires = (String) jsonObject.get("expires");
		expires = expires.replace("-", "").trim();
		expires += "235959";
		
//			System.out.println("expires : "+ expires);
		
        SimpleDateFormat fm = new SimpleDateFormat("yyyyMMddHHmmss");
        Date cal = fm.parse(expires);
        
//	        System.out.println("cal >>" + cal.toString());
        
        //long unixTime = cal.getTime() / 1000;
        long unixTime = cal.getTime();
		
		String in = "_id="+_id+"&c="+counts+"&e="+unixTime;
		System.out.println("in>>>"+in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/gupdate?",in);
		System.out.println("result >> " + result);
		
		JSONObject out = new JSONObject();
		out.put("result", result);
		
		System.out.println("out >>" + out.toString());

		
		return out.toString();
		
	}
	
	
	@RequestMapping("/logView.do")
	public String logView(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				String gid = request.getParameter("gid");
				String _id = request.getParameter("_id");
				
				System.out.println(">>> logView.do");
				System.out.println("gid >> " + gid);
				System.out.println("_id >> " + _id);
				
				model.addAttribute("gid", gid);
				model.addAttribute("_id", _id);
				
				return "/url/url_010102";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.do");
				return "/common/link";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/common/500";
		}
		
	}
	
	@RequestMapping("/logViewList.do")
	public @ResponseBody String logList(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		
		System.out.println(">>>>>> logViewList.do");
			
		//JSONObject jsonObject= (JSONObject) JSONValue.parse(data);
		JSONObject jsonObject = new JSONObject(data); 
		
		String s 		= jsonObject.isNull("s")?"":jsonObject.get("s").toString();
		String limit 	= jsonObject.isNull("limit")?"":jsonObject.get("limit").toString();
		String skip 	= jsonObject.isNull("skip")?"":jsonObject.get("skip").toString();
		String gid 		= jsonObject.isNull("gid")?"":jsonObject.get("gid").toString();
		
		
		System.out.println("gid >>>>>>"+gid);
		System.out.println("s >>>>>>"+s);
		System.out.println("limit >>>>>>"+limit);
		System.out.println("skip >>>>>>"+skip);
		
		String in = "limit="+limit
					+"&skip="+skip
					+"&gid="+gid;
		
		if (!s.equals("")){
			in = in + "&s="+s;
		}

		System.out.println("in >>>>>>"+in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/clicks?",in);
		
		System.out.println("result >> " + result);
			
		return result;
	}
	
	@RequestMapping("/statView.do")
	public String statView(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				String gid = request.getParameter("gid");
				String _id = request.getParameter("_id");
				
				System.out.println(">>> logView.do");
				System.out.println("gid >> " + gid);
				System.out.println("_id >> " + _id);
				
				String in = "gid="+gid;
				//String result ="{\"uid\":\"root\",\"gid\":\"tbroad007\",\"count\":\"464\",\"data\":[{\"code\":\"200\",\"cnt\":\"70\"},{\"code\":\"302\",\"cnt\":\"69\"},{\"code\":\"200\",\"cnt\":\"10\"},{\"code\":\"242\",\"cnt\":\"1\"},{\"code\":\"243\",\"cnt\":\"100\"},{\"code\":\"244\",\"cnt\":\"100\"},{\"code\":\"401\",\"cnt\":\"89\"},{\"code\":\"404\",\"cnt\":\"45\"},{\"code\":\"500\",\"cnt\":\"50\"}]}";
				
				String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/aggregate_code?",in);
				System.out.println("result >> " + result);
				
				JSONObject resultJson = new JSONObject(result);
				System.out.println("data >>>>>>"+resultJson.get("data"));
			
				JSONArray jarr = new JSONArray();
				jarr = resultJson.getJSONArray("data");
				
				List list = new ArrayList();
				for (int i = 0; i<jarr.length(); i++)
				{
					list = JsonHelper.toList(jarr);
				}
				
				model.addAttribute("codeList", list);
				model.addAttribute("count", resultJson.get("cnt"));
				model.addAttribute("gid", gid);
				
				return "/url/url_010103";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.do");
				return "/common/link";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/common/500";
		}
		
	}
	
	@RequestMapping("/statistics.do")
	public @ResponseBody String statistics(
			@RequestBody String data,
			HttpServletRequest request, 
			HttpServletResponse response, 
			HttpSession session
			) throws Exception {
		
		System.out.println(">>>>>> statistics.do");
			
		JSONObject jsonObject = new JSONObject(data); 
		
		String s 		= jsonObject.isNull("s")?"":jsonObject.get("s").toString();
		String limit 	= jsonObject.isNull("limit")?"":jsonObject.get("limit").toString();
		String skip 	= jsonObject.isNull("skip")?"":jsonObject.get("skip").toString();
		String gid 		= jsonObject.isNull("gid")?"":jsonObject.get("gid").toString();
		
		System.out.println("gid >>>>>> "+gid);
		System.out.println("s >>>>>> "+s);
		System.out.println("limit >>>>>> "+limit);
		System.out.println("skip >>>>>> "+skip);
		
		String in = "limit="+limit
					+"&skip="+skip
					+"&gid="+gid;
		
		if (!s.equals("")){
			in = in + "&s="+s;
		}

		System.out.println("in >>>>>>"+in);
		
		String result = HttpConnection.PostData(Common.SHORT_URL_SERVER+"/clicks?",in);
		
		System.out.println("result >> " + result);
			
		return result;
	}
	
}



