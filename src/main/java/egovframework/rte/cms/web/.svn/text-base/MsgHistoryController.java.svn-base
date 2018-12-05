package egovframework.rte.cms.web;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.cmmn.util.Common;
import egovframework.rte.cmmn.util.CreateExcelFile;
import egovframework.rte.cmmn.util.Util;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class MsgHistoryController {

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
	private static int NAVI_NUM = 2;
	
	
	// 실시간 발송 현황
	@RequestMapping("/msgRealtime.tsis")
	public String msgRealtime(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		try{
			if(Common.sessionCheck(session)){
				
//				List<TsmVO> ums = tsmService.realTimeDataUMS(tsmVO);
//				model.addAttribute("ums", ums);
				
				List<TsmVO> total = tsmService.realTimeDataTotal(tsmVO);
				model.addAttribute("total", total);
				
				List<TsmVO> list = tsmService.realTimeData(tsmVO);
				model.addAttribute("search", list);
				model.addAttribute("navi", NAVI_NUM);
				
				return "/tsm/tsm_0201_02";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.tsis");
				return "/common/link";
			}
		}catch(Exception e){
			e.printStackTrace();
			return "/common/tsm_000";
		}
	}
		
	//메시지 이력 페이지 추가(흥국생명 요청 10.12 권훈)
	@RequestMapping("/msgHistoryByPhone.tsis")
	public String msgHistoryByPhone(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		try{
			//if(Common.sessionCheck(session)){
				
				System.out.println("========request : " + request.getParameter("search_num"));
				
				
				String searchNum = request.getParameter("search_num");
			
				if(searchNum == null || searchNum.equals("")){
					return "/common/tsm_000";
				}
				
				tsmVO.setSearch_num(searchNum);
				tsmVO.setSend_type("All");
				
				long time = System.currentTimeMillis();
				SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
			    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
			    
				if(tsmVO.getStart_date()==null){
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
					Calendar calendar = Calendar.getInstance();
					tsmVO.setStart_date(sdf.format(calendar.getTime()) + "-01");
					tsmVO.setLast_date(sdf.format(calendar.getTime()) + "-" + calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
					
					tsmVO.setDay_type("M");
					tsmVO.setTable_name(logTableName);
					Calendar c = Calendar.getInstance();
					c.setTimeInMillis(time);;
					c.add(Calendar.MONTH, -3);
					
					
				} else {
					SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
					String thisMonth =  "SMART_MESSAGE_LOG_" + tsmVO.getLast_date().replace("-", "").substring(0, 6);
					
					Date endDate = format.parse(tsmVO.getLast_date().replace("-", "").substring(0, 6));
					Date startDate = format.parse(tsmVO.getStart_date().replace("-", "").substring(0, 6));
					
					Calendar c = Calendar.getInstance();
					c.setTime(endDate);
					c.add(Calendar.MONTH, -3);
					Date preDate = c.getTime();
					int dateCompare = startDate.compareTo(preDate);
					
					if(dateCompare > 0){
						
						String startMonth = "SMART_MESSAGE_LOG_" + format.format(startDate);
						
						c.setTime(startDate);
						
						if(startDate.compareTo(endDate) != 0){
							ArrayList<String> list = new ArrayList<String>();
							while(true){
								c.add(Calendar.MONTH, 1);
								if(Integer.parseInt(format.format(c.getTime())) == Integer.parseInt(format.format(endDate))){
									break;
								}
								list.add(format.format(c.getTime()));
							}
							
							String tempTable = "";
							for(int i = 0 ; i < list.size() ; i++){
								tempTable = tempTable + " UNION ALL SELECT * FROM SMART_MESSAGE_LOG_"+ list.get(i).toString();
							}
							
							String threeTable = "( SELECT * FROM " + startMonth 
									           + tempTable
									           + " UNION ALL"
									           + " SELECT * FROM " + thisMonth
									           + " ) ";
					
							tsmVO.setTable_name(threeTable);
						}else{
							//SimpleDateFormat format = new SimpleDateFormat("yyyyMM");
							String thisMonths =  "SMART_MESSAGE_LOG_" + tsmVO.getLast_date().replace("-", "").substring(0, 6);
							tsmVO.setDay_type("M");
							tsmVO.setTable_name(thisMonths);
						}
					}else{
						c.setTime(endDate);
						c.add(Calendar.MONTH, -3);
						
						String table1 = "SMART_MESSAGE_LOG_" + format.format(c.getTime());;
						c.add(Calendar.MONTH, 1);
						String table2 = "SMART_MESSAGE_LOG_" + format.format(c.getTime());;
						c.add(Calendar.MONTH, 1);
						String table3 = "SMART_MESSAGE_LOG_" + format.format(c.getTime());;
						
						String threeTable = "( SELECT * FROM " + table1 
								           + " UNION ALL"
								           + " SELECT * FROM " + table2 
								           + " UNION ALL"
								           + " SELECT * FROM " + table3 
								           + " UNION ALL"
								           + " SELECT * FROM " + thisMonth
								           + " ) ";

						tsmVO.setTable_name(threeTable);
						
					}
				}
				
				
				System.out.println("====== vo : " + tsmVO.getSearch_num());
				
				int totalCount = tsmService.msgHistoryCnt2(tsmVO);
				if(Common.pagingOrder(totalCount, tsmVO, model, request)){
					List<TsmVO> hist = tsmService.msgHistory(tsmVO);
					
					model.addAttribute("search", tsmVO);
					model.addAttribute("hist", hist);
				} else {
					throw new Exception("ERR_PAGING_FAIL");
				}
				model.addAttribute("start_date", tsmVO.getStart_date());
				model.addAttribute("last_date", tsmVO.getLast_date());
				model.addAttribute("navi", NAVI_NUM);
				return "/tsm/tsm_0201_01";
//			} else {
//				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
//				model.addAttribute("returnUrl", "login.tsis");
//				return "/common/link";
//			}
		}catch(Exception e){
			e.printStackTrace();
			return "/common/tsm_000";
		}
	}
	
	
	//메시지 이력 페이지
	@RequestMapping("/msgHistory.tsis")
	public String msgHistory(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		try {
			if(Common.sessionCheck(session)){
				long time = System.currentTimeMillis();
				SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
			    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
				
				if(tsmVO.getStart_date() == null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
					Calendar calendar = Calendar.getInstance();
					tsmVO.setStart_date(sdf.format(calendar.getTime()) + "-01");
					tsmVO.setLast_date(sdf.format(calendar.getTime()) + "-" + calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
					
					tsmVO.setDay_type("M");
					tsmVO.setTable_name(logTableName);
				} else {
					logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
					tsmVO.setTable_name(logTableName);
				}
				
				int totalCount = tsmService.msgHistoryCnt(tsmVO);
				if(Common.pagingOrder(totalCount, tsmVO, model, request)){
					List<TsmVO> hist = tsmService.msgHistory(tsmVO);
					
					model.addAttribute("search", tsmVO);
					model.addAttribute("hist", hist);
				} else {
					throw new Exception("ERR_PAGING_FAIL");
				}
				model.addAttribute("start_date", tsmVO.getStart_date());
				model.addAttribute("last_date", tsmVO.getLast_date());
				model.addAttribute("navi", NAVI_NUM);
				return "/tsm/tsm_0201";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.tsis");
				return "/common/link";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return "/common/tsm_000";
		}
		
	}
	
	//메시지 이력 상세
	@RequestMapping("/msgHistoryDetail.tsis")
	public String msgHistoryDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String mon = sdf.format(time).split("-")[1];
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
		    
			//이력 상세 조회
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			
			TsmVO hist = tsmService.msgHistoryDetail(tsmVO);
			
			model.addAttribute("hist", hist);
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_020101";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
		
	}
	
	//기간별 메시지 통계 
	@RequestMapping("/msgDaysChart.tsis")
	public String msgDaysChart(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		if(Common.sessionCheck(session)){
			
			long time = System.currentTimeMillis();
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
		    
		    tsmVO.setTable_name(logTableName);
			if(tsmVO.getStart_date()==null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				Calendar calendar = Calendar.getInstance();
				tsmVO.setStart_date(sdf.format(calendar.getTime()) + "-01");
				tsmVO.setLast_date(sdf.format(calendar.getTime()) + "-" + calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
				
				tsmVO.setDay_type("M");
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			
			List chart = tsmService.msgChart(tsmVO);
			int totalSize = 0;
			if(chart!=null){
				 totalSize = chart.size();
			}
			
			model.addAttribute("day_type", tsmVO.getDay_type());
			model.addAttribute("start_date", tsmVO.getStart_date());
			model.addAttribute("last_date", tsmVO.getLast_date());
			model.addAttribute("chart", chart);
			model.addAttribute("totalSize", totalSize);
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0202";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}	
		
	}
	
	//기간별 메시지 통계 상세보기
	@RequestMapping("/msgDaysChartDetail.tsis")
	public String msgDaysChartDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		if(Common.sessionCheck(session)){
			long time = System.currentTimeMillis();
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
			String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();

			
			if (tsmVO.getStart_date() == null) {
			    tsmVO.setTable_name(logTableName);
			    
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
				Calendar calendar = Calendar.getInstance();
				tsmVO.setStart_date(sdf.format(calendar.getTime()) + "-01");
				tsmVO.setLast_date(sdf.format(calendar.getTime()) + "-" + calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
				
				tsmVO.setDay_type("M");
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			
			// 마지막일이 현재 달의 마지막을 넘게 검색하려고 하는지 체크
			tsmVO.setLast_date(Util.getLastDateCheck(tsmVO.getLast_date()));
			
			tsmVO.setTable_name(logTableName);
			List chart = tsmService.msgChartDetail(tsmVO);
			int totalSize = 0;
			if(chart!=null){
				 totalSize = chart.size();
			}
			
			model.addAttribute("start_date", tsmVO.getStart_date());
			model.addAttribute("last_date", tsmVO.getLast_date());
			model.addAttribute("day_type", tsmVO.getDay_type());
			model.addAttribute("code", tsmVO.getCode());
			model.addAttribute("chart", chart);
			model.addAttribute("totalSize", totalSize);
			model.addAttribute("navi", NAVI_NUM);
			
			return "/tsm/tsm_020201";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}	
		
	}
	
	
	//문구별 메시지 통계 
	@RequestMapping("/msgChartGraph.tsis")
	public String msgChart(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		if(Common.sessionCheck(session)){
			
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			
			List<TsmVO> gList = tsmService.msgChartGraph(tsmVO);
			int a_total = 0, s_total =0 , l_total =0, n_total = 0;
			int a_per = 0, s_per = 0, l_per = 0, n_per = 0;
			for(int i = 0 ; i < gList.size(); i++){
				System.out.println(gList.get(i).getMtype() + " : " + gList.get(i).getCnt());
				if(gList.get(i).getMtype().equals("A")){
					a_total += gList.get(i).getCnt();
					if(gList.get(i).getFail_yn().equals("F")){
						a_per = gList.get(i).getCnt();
					}
				} else if(gList.get(i).getMtype().equals("L")){
					l_total += gList.get(i).getCnt();
					if(gList.get(i).getFail_yn().equals("F")){
						l_per = gList.get(i).getCnt();
					}
				} else if(gList.get(i).getMtype().equals("S")){
					s_total += gList.get(i).getCnt();
					if(gList.get(i).getFail_yn().equals("F")){
						s_per = gList.get(i).getCnt();
					}
				} else if(gList.get(i).getMtype().equals("N")){
					n_total += gList.get(i).getCnt();
					if(gList.get(i).getFail_yn().equals("F")){
						n_per = gList.get(i).getCnt();
					}
				}
			}
			
			try {
				model.addAttribute("a_per", (int)(((double)a_per / a_total) * 100));
			} catch (ArithmeticException e) {
				// TODO: handle exception
				model.addAttribute("a_per", 0);
			}
			
			try {
				model.addAttribute("l_per", (int)(((double)l_per / l_total) * 100));
			} catch (ArithmeticException e) {
				// TODO: handle exception
				model.addAttribute("l_per", 0);
			}
			
			try {
				model.addAttribute("s_per", (int)(((double)s_per / s_total) * 100));
			} catch (ArithmeticException e) {
				// TODO: handle exception
				model.addAttribute("s_per", 0);
			}
			
			try {
				model.addAttribute("n_per", (int)(((double)n_per / n_total) * 100));
			} catch (ArithmeticException e) {
				// TODO: handle exception
				model.addAttribute("n_per", 0);
			}
			
			try {
				model.addAttribute("all_per", (int)(((double)(a_per + l_per + s_per + n_per) / (a_total + l_total + s_total + n_total)) * 100));
			} catch (ArithmeticException e) {
				// TODO: handle exception
				model.addAttribute("all_per", 0);
			}
			
			model.addAttribute("curDate", sdf.format(time));
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0203";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}	
		
	}
	
	//문구별 메시지 통계 상세보기
	@RequestMapping("/msgChartGraphDetail.tsis")
	public String msgCodeChartDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		if(Common.sessionCheck(session)){
			
			
			String colorValue[] = {"#F7464A", "#FF8224", "#FDB45C", "#FFE400", "#D6C94D"};
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			
			List<TsmVO> de = tsmService.msgChartGraphDetail(tsmVO);
			
			JSONArray a_arr  = new JSONArray();
			JSONArray l_arr  = new JSONArray();
			JSONArray s_arr  = new JSONArray();
			JSONArray n_arr  = new JSONArray();
			
			for(int i = 0 ; i < de.size() ; i++){
				JSONObject  temp = new JSONObject();
				if(de.get(i).getMtype().equals("A") && a_arr.size() < 5 ){
					temp.put("value",de.get(i).getCnt());
					temp.put("color",colorValue[a_arr.size()-1 >0 ? a_arr.size() : 0]);
					//temp.put("title", de.get(i).getCode());
					temp.put("title", de.get(i).getSubject());
					
					a_arr.add(temp);
					
				} else if(de.get(i).getMtype().equals("L") && l_arr.size() < 5 ){
					temp.put("value",de.get(i).getCnt());
					temp.put("color",colorValue[l_arr.size()-1 >0 ? l_arr.size() : 0]);
					temp.put("title", de.get(i).getSubject());
					
					l_arr.add(temp);
					
				} else if(de.get(i).getMtype().equals("S") && s_arr.size() < 5 ){
					temp.put("value",de.get(i).getCnt());
					temp.put("color",colorValue[s_arr.size()-1 >0 ? s_arr.size() : 0]);
					temp.put("title", de.get(i).getSubject());
					
					s_arr.add(temp);
					
				} else if(de.get(i).getMtype().equals("N") && n_arr.size() < 5 ){
					temp.put("value",de.get(i).getCnt());
					temp.put("color",colorValue[n_arr.size()-1 >0 ? n_arr.size() : 0]);
					temp.put("title", de.get(i).getSubject());
					
					n_arr.add(temp);
				}
			}
			
			
			JSONObject  temp = new JSONObject();
			temp.put("value", 0);
			temp.put("color",colorValue[0]);
			temp.put("title", "no-value");
			
			if(a_arr.size() ==0){
				a_arr.add(temp);
			}
			
			if(l_arr.size() ==0){
				l_arr.add(temp);	
			}
			
			if(s_arr.size() ==0){
				s_arr.add(temp);
			}
			
			if(n_arr.size() ==0){
				n_arr.add(temp);
			}
			
			model.addAttribute("alimData", a_arr.toJSONString());
			model.addAttribute("lmsData", l_arr.toJSONString());
			model.addAttribute("smsData", s_arr.toJSONString());
			model.addAttribute("nmsData", n_arr.toJSONString());
			
			
			model.addAttribute("curDate", sdf.format(time));
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_020301";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}	
		
	}
	
	
	//메시지 발송 이력 다운
	@RequestMapping("/msgHistoryDown.tsis")
	public void msgSendPage(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String realPath = new HttpServletRequestWrapper(request).getRealPath("/excelDown/");
		long time = System.currentTimeMillis();
		String fileName = "스마트메시징_로그파일"+time+".xls";
		String filePath = realPath +"/"+ fileName;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String mon = sdf.format(time).split("-")[1];
		SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
	    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
		
		try {
			
			tsmVO.setStartNum(0);
			tsmVO.setRecordCount(99999999);
			
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			List<TsmVO> history = tsmService.msgHistory(tsmVO);
			
			List<Map<String,Object>> excelList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			
			
			for(int i = 0 ; i < history.size(); i++){
				//PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
				map = new HashMap<String, Object>();
				map.put("pidx", history.get(i).getPidx());
				map.put("mtype", propertiesService.getString(history.get(i).getMtype()));
				map.put("code", history.get(i).getCode());
				map.put("aidx", history.get(i).getAidx());
				map.put("ukey", history.get(i).getUkey());
				map.put("message", history.get(i).getMessage());
				map.put("receive_num", history.get(i).getReceive_num());
				map.put("sender", history.get(i).getSender());
				map.put("req_date", history.get(i).getReq_date());
				map.put("report_date", history.get(i).getReport_date());
				//map.put("req_result", history.get(i).getReq_result()+"\n"+propertiesService.getString(history.get(i).getReq_result()));
				map.put("req_result", history.get(i).getDescription());
				excelList.add(map);
			}
			
			File file = new File(filePath);
			CreateExcelFile cr = new CreateExcelFile();
			cr.CreateExcelHistory(file, excelList, "메시지 이력 현황");
			Common.download(response, file, realPath, fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("엑셀다운로드가 중단되었습니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('해당월의 데이터가 없습니다.'); history.back(-1);</script>'");
			out.flush();
			out.close();
		}
		
	}
	
	
	//메시지 기간별 통계 다운
	@RequestMapping("/msgChartDown.tsis")
	public void msgChartDown(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			String realPath = new HttpServletRequestWrapper(request).getRealPath("/excelDown/");
			long time = System.currentTimeMillis();
			String fileName = "SMART_MESSAGE_CHART_"+time+".xls";
			String filePath = realPath +"/"+ fileName;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String mon = sdf.format(time).split("-")[1];
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
			
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			List<TsmVO> chart = tsmService.msgChart(tsmVO);
			
			List<Map<String,Object>> excelList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for(int i = 0 ; i < chart.size(); i++){
				
				map = new HashMap<String, Object>();
				map.put("report_date", chart.get(i).getReport_date());
				map.put("n_succ", chart.get(i).getN_succ());
				map.put("n_fail", chart.get(i).getN_fail());
				
				map.put("s_succ", chart.get(i).getS_succ());
				map.put("s_fail", chart.get(i).getS_fail());
				
				map.put("l_succ", chart.get(i).getL_succ());
				map.put("l_fail", chart.get(i).getL_fail());
				
				map.put("a_succ", chart.get(i).getA_succ());
				map.put("a_fail", chart.get(i).getA_fail());
				
				excelList.add(map);
			}
			
			File file = new File(filePath);
			CreateExcelFile cr = new CreateExcelFile();
			cr.CreateExcelChart(file, excelList, "메시지 통계 건수");
			Common.download(response, file, realPath, fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("엑셀다운로드가 중단되었습니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('해당월의 데이터가 없습니다.'); history.back(-1);</script>'");
			out.flush();
			out.close();
		}
	}
	
	//메시지 기간별 통계 상세보기 다운
	@RequestMapping("/msgChartDetailDown.tsis")
	public void msgChartDetailDown(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			String realPath = new HttpServletRequestWrapper(request).getRealPath("/excelDown/");
			long time = System.currentTimeMillis();
			String fileName = "SMART_MESSAGE_CHART_"+time+".xls";
			String filePath = realPath +"/"+ fileName;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String mon = sdf.format(time).split("-")[1];
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
		    
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			List<TsmVO> chart = tsmService.msgChartDetail(tsmVO);
			
			List<Map<String,Object>> excelList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for(int i = 0 ; i < chart.size(); i++){
				
				map = new HashMap<String, Object>();
				map.put("code", chart.get(i).getCode());
				map.put("n_succ", chart.get(i).getN_succ());
				map.put("n_fail", chart.get(i).getN_fail());
				
				map.put("s_succ", chart.get(i).getS_succ());
				map.put("s_fail", chart.get(i).getS_fail());
				
				map.put("l_succ", chart.get(i).getL_succ());
				map.put("l_fail", chart.get(i).getL_fail());
				
				map.put("a_succ", chart.get(i).getA_succ());
				map.put("a_fail", chart.get(i).getA_fail());
				
				excelList.add(map);
			}
			
			File file = new File(filePath);
			CreateExcelFile cr = new CreateExcelFile();
			cr.CreateExcelChart(file, excelList, "메시지 통계 건수", tsmVO.getStart_date() +" ~ "+tsmVO.getLast_date());
			Common.download(response, file, realPath, fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("엑셀다운로드가 중단되었습니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('해당월의 데이터가 없습니다.'); history.back(-1);</script>'");
			out.flush();
			out.close();
		}
	}
	
	
	//메시지 문구별 통계 다운
	@RequestMapping("/msgCodeChartDown.tsis")
	public void msgCodeChartDown(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			String realPath = new HttpServletRequestWrapper(request).getRealPath("/excelDown/");
			long time = System.currentTimeMillis();
			String fileName = "SMART_MESSAGE_CHART_"+time+".xls";
			String filePath = realPath +"/"+ fileName;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String mon = sdf.format(time).split("-")[1];
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
			
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			List<TsmVO> chart = tsmService.msgCodeChart(tsmVO);
			
			List<Map<String,Object>> excelList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for(int i = 0 ; i < chart.size(); i++){
				
				map = new HashMap<String, Object>();
				map.put("code", chart.get(i).getCode());
				map.put("n_succ", chart.get(i).getN_succ());
				map.put("n_fail", chart.get(i).getN_fail());
				
				map.put("s_succ", chart.get(i).getS_succ());
				map.put("s_fail", chart.get(i).getS_fail());
				
				map.put("l_succ", chart.get(i).getL_succ());
				map.put("l_fail", chart.get(i).getL_fail());
				
				map.put("a_succ", chart.get(i).getA_succ());
				map.put("a_fail", chart.get(i).getA_fail());
				
				excelList.add(map);
			}
			
			File file = new File(filePath);
			CreateExcelFile cr = new CreateExcelFile();
			cr.CreateExcelCodeChart(file, excelList, "메시지 통계 건수");
			Common.download(response, file, realPath, fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("엑셀다운로드가 중단되었습니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('해당월의 데이터가 없습니다.'); history.back(-1);</script>'");
			out.flush();
			out.close();
		}
	}
	
	//메시지 기간별 통계 상세보기 다운
	@RequestMapping("/msgCodeChartDetailDown.tsis")
	public void msgCodeChartDetailDown(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		try {
			String realPath = new HttpServletRequestWrapper(request).getRealPath("/excelDown/");
			long time = System.currentTimeMillis();
			String fileName = "SMART_MESSAGE_CHART_"+time+".xls";
			String filePath = realPath +"/"+ fileName;
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			String mon = sdf.format(time).split("-")[1];
			SimpleDateFormat logSdf = new SimpleDateFormat("yyyyMM");
		    String logTableName =  "SMART_MESSAGE_LOG_" + logSdf.format(time).toString();
		    
			
			if(tsmVO.getStart_date()==null) {
				tsmVO.setTable_name(logTableName);
			}
			else {
				logTableName =  "SMART_MESSAGE_LOG_" + tsmVO.getStart_date().replace("-", "").substring(0, 6);
				tsmVO.setTable_name(logTableName);
			}
			List<TsmVO> chart = tsmService.msgCodeChartDetail(tsmVO);
			
			List<Map<String,Object>> excelList = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = null;
			for(int i = 0 ; i < chart.size(); i++){
				
				map = new HashMap<String, Object>();
				map.put("report_date", chart.get(i).getReport_date());
				map.put("n_succ", chart.get(i).getN_succ());
				map.put("n_fail", chart.get(i).getN_fail());
				
				map.put("s_succ", chart.get(i).getS_succ());
				map.put("s_fail", chart.get(i).getS_fail());
				
				map.put("l_succ", chart.get(i).getL_succ());
				map.put("l_fail", chart.get(i).getL_fail());
				
				map.put("a_succ", chart.get(i).getA_succ());
				map.put("a_fail", chart.get(i).getA_fail());
				
				excelList.add(map);
			}
			
			File file = new File(filePath);
			CreateExcelFile cr = new CreateExcelFile();
			cr.CreateExcelCodeChart(file, excelList, "메시지 통계 건수", tsmVO.getCode());
			Common.download(response, file, realPath, fileName);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("엑셀다운로드가 중단되었습니다.");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('해당월의 데이터가 없습니다.'); history.back(-1);</script>'");
			out.flush();
			out.close();
		}
	}
	
}

