package egovframework.rte.cms.web;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Comparator;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.rte.cmmn.util.Common;
import egovframework.rte.cmmn.util.DateUtil;
import egovframework.rte.cmmn.util.Util;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class CallCenterController {

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
	private static int NAVI_NUM = 5;


	@RequestMapping("/callCenterHelpList.tsis")
	public String callCenterHelpList(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			System.out.println("callCenterHelpList:"+tsmVO.getRecordCount());
			
			int totalCount = tsmService.callCenterHelpListCnt(tsmVO);
			
			//페이징 처리				
			if(Common.pagingOrder(totalCount, tsmVO, model, request)){
				List<TsmVO> tmpList = tsmService.callCenterHelpList(tsmVO);
				
				model.addAttribute("tmpList", tmpList);
				
			} else {
				throw new Exception("ERR_PAGING_FAIL");
			}
			
			model.addAttribute("send_type", tsmVO.getSend_type());
			
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0501";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterHelpDetail.tsis")
	public String callCenterHelpDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO template = tsmService.callCenterHelpDetail(tsmVO);
			
			if (template == null) {
				model.addAttribute("returnMsg", "정보가 부정확합니다");
				model.addAttribute("returnUrl", "callCenterHelpList.tsis");
				model.addAttribute("returnData",
						"pidx="+tsmVO.getPidx()
						+ "@#nowPage="+tsmVO.getNowPage()
						+ "@#send_type="+tsmVO.getSend_type()
						+ "@#recordCount="+tsmVO.getRecordCount());
				return "/common/link";
			}
			
			template.setContent(Util.htmlImageConvert(template.getContent()));
			
			model.addAttribute("tmp", template);
			
			model.addAttribute("len_res_message", 1000);
			
        	model.addAttribute("nowPage", tsmVO.getNowPage());
        	model.addAttribute("send_type", tsmVO.getSend_type());
        	model.addAttribute("recordCount", tsmVO.getRecordCount());
        	
        	System.out.println("callCenterHelpDetail:"+tsmVO.getRecordCount());
			
			model.addAttribute("navi", NAVI_NUM);
			
			if (template.getStatus().equals("STR")
				|| template.getStatus().equals("ING"))
				return "/tsm/tsm_050101";
			
			return "/tsm/tsm_050102";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterHelpDeferUpdate.tsis")
	public String callCenterHelpDeferUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			tsmVO.setAidx(aidx);
			
			tsmService.callCenterHelpUpdate(tsmVO);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterHelpDetail.tsis");
			model.addAttribute("returnData",
					"pidx="+tsmVO.getPidx()
					+ "@#nowPage="+tsmVO.getNowPage()
					+ "@#send_type="+tsmVO.getSend_type()
					+ "@#recordCount="+tsmVO.getRecordCount());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterHelpUpdate.tsis")
	public String callCenterHelpUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			tsmVO.setAidx(aidx);
			
			if (tsmVO.getStatus().equals("END")) {
				// 메세지 전송
				TsmVO custVO = tsmService.select_question_cuphone(tsmVO);
				
				if (custVO != null) {
					if (Util.isNull(custVO.getPhone())) {
						model.addAttribute("returnMsg", "고객 전화번호가 없습니다.");
						model.addAttribute("returnUrl", "callCenterHelpDetail.tsis");
						model.addAttribute("returnData",
								"pidx="+tsmVO.getPidx()
								+ "@#nowPage="+tsmVO.getNowPage()
								+ "@#send_type="+tsmVO.getSend_type()
								+ "@#recordCount="+tsmVO.getRecordCount());
						return "/common/link";
					}
					
					custVO.setAidx(tsmVO.getAidx());
					
					String sKey = DateUtil.getDateNTimeByForm("yyMMddHHmmss");
					Random ran = new Random();
					custVO.setUkey(sKey + Util.LPad("" + ran.nextInt(99999999), 8, "0"));
					
					final String TOTAL_MESSAGE = "[티시스 답변] 고객님 안녕하세요"
							+ "\n문의 하신 사항에 대해서 아래와 같이 회신 드립니다. 아래 내용을 부족한 답변은 사이트 접속을 통해 추가 확인이 가능하십니다."
							+ "\n[내용]"
							+ "\n-. 문의 사항 : %s"
							+ "\n-. 답변 내용 : %s"
							+ "\n"
							+ "\n더 많은 정보를 원하시면 아래 버튼을 선택하여 주십시오.";
					
					String sContent = Util.subStringByte(tsmVO.getContent(), 1000);
					if (tsmVO.getRes_message().getBytes("EUC-KR").length > 1000) {
						model.addAttribute("returnMsg", "답변할 수 있는 길이(1000byte)를 초과 하였습니다.");
						model.addAttribute("returnUrl", "callCenterHelpDetail.tsis");
						model.addAttribute("returnData",
								"pidx="+tsmVO.getPidx()
								+ "@#nowPage="+tsmVO.getNowPage()
								+ "@#send_type="+tsmVO.getSend_type()
								+ "@#recordCount="+tsmVO.getRecordCount());
						return "/common/link";
					}
					
					custVO.setMessage(String.format(TOTAL_MESSAGE, sContent, tsmVO.getRes_message()));
							
					tsmService.insert_total(custVO);
					
					tsmService.callCenterHelpUpdate(tsmVO);
				}
				else {
					model.addAttribute("returnMsg", "고객 ID에 대한 정보가 없습니다");
					model.addAttribute("returnUrl", "callCenterHelpDetail.tsis");
					model.addAttribute("returnData",
							"pidx="+tsmVO.getPidx()
							+ "@#nowPage="+tsmVO.getNowPage()
							+ "@#send_type="+tsmVO.getSend_type()
							+ "@#recordCount="+tsmVO.getRecordCount());
					return "/common/link";
				}
			}
			else {
				tsmService.callCenterHelpUpdate(tsmVO);
			}
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterHelpDetail.tsis");
			model.addAttribute("returnData",
					"pidx="+tsmVO.getPidx()
					+ "@#nowPage="+tsmVO.getNowPage()
					+ "@#send_type="+tsmVO.getSend_type()
					+ "@#recordCount="+tsmVO.getRecordCount());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioManage.tsis")
	public String callCenterScenarioManage(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			tsmVO.setStartNum(0);
			tsmVO.setRecordCount(9999);
			
			List<TsmVO> tmpList = tsmService.callCenterScenarioManageList(tsmVO);
			
			for (int i = 0; i < tmpList.size(); i++) {
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(tmpList.get(i).getRes_message());
				if (jsonObject != null) {
					JSONObject jsonMessage = (JSONObject) jsonObject.get("message");
					if (jsonMessage != null) {
						tmpList.get(i).setContent((String) jsonMessage.get("text"));
					}
					
					JSONObject jsonKeyboard = (JSONObject) jsonObject.get("keyboard");
					if (jsonKeyboard != null) {
						tmpList.get(i).setSend_type((String) jsonKeyboard.get("type"));
					}
				}
				
				tmpList.get(i).setUkey("" + i);
				tmpList.get(i).setRes_message(Util.replaceAll(tmpList.get(i).getRes_message(), "\"", "'"));
				System.out.println(i+":"+tmpList.get(i).getRes_message());
			}
			
			model.addAttribute("tmpList", tmpList);
			
			model.addAttribute("navi", NAVI_NUM);
			
			return "/tsm/tsm_0502";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioManageUpdate.tsis")
	public String callCenterScenarioManageUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			int nTmpInfoLen = Util.toInteger(request.getParameter("tmpInfoLen"));
			System.out.println("tmpInfoLen::"+nTmpInfoLen);

			// 정렬을 위해 값 셋팅
			TsmVO arTsmVO[] = new TsmVO[nTmpInfoLen];
			for (int i = 0; i < nTmpInfoLen; i++) {
				arTsmVO[i] = new TsmVO();
				arTsmVO[i].setPidx(request.getParameter("pidx" + i));
				arTsmVO[i].setEtc1(request.getParameter("etc1" + i));
				arTsmVO[i].setEtc2(request.getParameter("etc2" + i));
				arTsmVO[i].setPriority(request.getParameter("priority" + i));
				arTsmVO[i].setSubject(request.getParameter("subject" + i));
				arTsmVO[i].setOrder_num(request.getParameter("order_num" + i));
			}
			
			// 정렬
			Arrays.sort(arTsmVO, new Comparator<TsmVO>() {
				@Override
				public int compare(TsmVO o1, TsmVO o2) {
					return o1.getOrder_num().compareTo(o2.getOrder_num());
				}
			});
			
			for (int i = 0; i < nTmpInfoLen; i++) {
				TsmVO template = new TsmVO();
				template.setPidx(arTsmVO[i].getPidx());
				template = tsmService.callCenterScenarioDetail(template);
				
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(template.getRes_message());
				if (jsonObject != null) {
					JSONObject jsonKeyboard = (JSONObject) jsonObject.get("keyboard");
					if (jsonKeyboard != null) {
						JSONArray jsonButtons = new JSONArray();
						
						for (int j = 0; j < nTmpInfoLen; j++) {
							String etc2 = arTsmVO[j].getEtc2();
							if (etc2.equals(template.getPidx())) {
								jsonButtons.add(arTsmVO[j].getSubject());
							}
						}
						
						jsonKeyboard.remove("buttons");
						jsonKeyboard.put("buttons", jsonButtons);
						
						jsonObject.remove("keyboard");
						jsonObject.put("keyboard", jsonKeyboard);
						
						template.setRes_message(jsonObject.toString());
					}
				}
				
				template.setPriority(Util.getNullReplace(arTsmVO[i].getPriority(), "0"));
				template.setEtc1(arTsmVO[i].getEtc1());
				template.setEtc2(arTsmVO[i].getEtc2());
				template.setOrder_num(Util.getNullReplace(arTsmVO[i].getOrder_num(), "0"));
				
//				System.out.println("orderNum:"+i+","+request.getParameter("pidx" + i)+","+request.getParameter("subject" + i)+","+ request.getParameter("order_num" + i));
				
				tsmService.callCenterScenarioUpdate(template);
			}
			
			model.addAttribute("navi", NAVI_NUM);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterScenarioManage.tsis");
			
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioList.tsis")
	public String callCenterScenarioList(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			int totalCount = tsmService.callCenterScenarioListCnt(tsmVO);
			
			//페이징 처리
			if(Common.pagingOrder(totalCount, tsmVO, model, request)){
				List<TsmVO> tmpList = tsmService.callCenterScenarioList(tsmVO);
				
				for (int i = 0; i < tmpList.size(); i++) {
					System.out.println(i+":"+tmpList.get(i).getRes_message());
					JSONParser parser = new JSONParser();
					JSONObject jsonObject = (JSONObject) parser.parse(tmpList.get(i).getRes_message());
					
					JSONObject jsonMessage = (JSONObject) jsonObject.get("message");
					tmpList.get(i).setContent((String) jsonMessage.get("text"));
				}
				
				model.addAttribute("tmpList", tmpList);
			} else {
				throw new Exception("ERR_PAGING_FAIL");
			}
			
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0503";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioRegi.tsis")
	public String callCenterScenarioRegi(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO template = new TsmVO();
			
			if (!Util.isNull(tsmVO.getPidx())) {
				template = tsmService.callCenterScenarioDetail(tsmVO);
				
				JSONParser parser = new JSONParser();
				JSONObject jsonObject = (JSONObject) parser.parse(template.getRes_message());
				
				if (jsonObject != null) {
					JSONObject jsonMessage = (JSONObject) jsonObject.get("message");
					if (jsonMessage != null) {
						template.setContent((String) jsonMessage.get("text"));
						
						JSONObject jsonMessageButton = (JSONObject) jsonMessage.get("message_button");
						
						if (jsonMessageButton != null) {
							template.setLink_btn_name((String) jsonMessageButton.get("label"));
							template.setLink_btn_url((String) jsonMessageButton.get("url"));
						}
						
						JSONObject jsonPhoto = (JSONObject) jsonMessage.get("photo");
						if (jsonPhoto != null) {
							template.setImage_url((String) jsonPhoto.get("url"));
						}
					}
					
					JSONObject jsonKeyboard = (JSONObject) jsonObject.get("keyboard");
					if (jsonKeyboard != null) {
						template.setSend_type((String) jsonKeyboard.get("type"));
//						JSONArray jsonButtons = (JSONArray) jsonKeyboard.get("buttons");
//						template.setContent((String) jsonKeyboard.get("buttons"));
					}
				}
			}
			
			model.addAttribute("tmp", template);
			
			model.addAttribute("len_subject", 40);
			model.addAttribute("len_content", 800);
			model.addAttribute("len_link_btn_name", 20);
			model.addAttribute("len_link_btn_url", 100);
			
			model.addAttribute("navi", NAVI_NUM);
			
			return "/tsm/tsm_050301";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioInsert.tsis")
	public String callCenterScenarioInsert(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			tsmVO.setAidx(aidx);
			
			String uploadPath = Common.IMAGE_UPLOAD_PATH;
			String images_url = Common.fileUpload(request, uploadPath, "img_filename");
			if(images_url != null){
				tsmVO.setImage_url(images_url);
			}else{
				String o_img_filename = request.getParameter("o_img_filename");
				tsmVO.setImage_url(o_img_filename);
			}
			
			tsmVO.setRes_message(Common.getScenarioJson(tsmVO));
			
			String pidx = tsmService.callCenterScenarioInsert(tsmVO);
			
			tsmVO.setPidx(pidx);
			tsmVO.setEtc3("I");
			tsmService.callCenterScenarioHistoryInsert(tsmVO);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterScenarioRegi.tsis");
			model.addAttribute("returnData",
					"pidx="+tsmVO.getPidx()
					+ "@#nowPage="+tsmVO.getNowPage()
					+ "@#recordCount="+tsmVO.getRecordCount());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioUpdate.tsis")
	public String callCenterScenarioUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			tsmVO.setAidx(aidx);
			
			String uploadPath = Common.IMAGE_UPLOAD_PATH;
			String images_url = Common.fileUpload(request, uploadPath, "img_filename");
			if(images_url != null){
				tsmVO.setImage_url(images_url);
			}else{
				String o_img_filename = request.getParameter("o_img_filename");
				tsmVO.setImage_url(o_img_filename);
			}
			
			TsmVO template = tsmService.callCenterScenarioDetail(tsmVO);
			
			tsmVO.setRes_message(template.getRes_message());
			tsmVO.setRes_message(Common.getScenarioJson(tsmVO));
			
			template.setSubject(tsmVO.getSubject());
			template.setRes_message(tsmVO.getRes_message());
			
			tsmService.callCenterScenarioUpdate(template);
			
			template.setEtc3("U");
			tsmService.callCenterScenarioHistoryInsert(template);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterScenarioRegi.tsis");
			model.addAttribute("returnData",
					"pidx="+tsmVO.getPidx()
					+ "@#nowPage="+tsmVO.getNowPage()
					+ "@#recordCount="+tsmVO.getRecordCount());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterScenarioDelete.tsis")
	public String callCenterScenarioDelete(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			tsmVO.setAidx(aidx);
			
			TsmVO template = tsmService.callCenterScenarioDetail(tsmVO);
			template.setEtc3("D");
			tsmService.callCenterScenarioHistoryInsert(template);
			
			tsmService.callCenterScenarioDelete(tsmVO);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "callCenterScenarioList.tsis");
			model.addAttribute("returnData",
					"@#nowPage="+tsmVO.getNowPage()
					+ "@#recordCount="+tsmVO.getRecordCount());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/callCenterHelpStats.tsis")
	public String callCenterHelpStats(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO template = null;
			
			if (Util.isNull(tsmVO.getSend_type()) || tsmVO.getSend_type().equals("stats_today")) {
				tsmVO.setStart_date(DateUtil.getDateNTimeByForm("yyyy-MM-dd HH:mm:ss"));
				template = tsmService.callCenterDayStats(tsmVO);
			}
			else if (tsmVO.getSend_type().equals("stats_day")) {
				if (Util.isNull(tsmVO.getStart_date()) || tsmVO.getStart_date().length() < 10) {
					tsmVO.setStart_date(DateUtil.getDateNTimeByForm("yyyy-MM-dd HH:mm:ss"));
				}
				template = tsmService.callCenterDayStats(tsmVO);
			}
			else if (tsmVO.getSend_type().equals("stats_month")) {
				if (Util.isNull(tsmVO.getStart_date())) {
					tsmVO.setStart_date(DateUtil.getDateNTimeByForm("yyyy-MM"));
				}
				
				tsmVO.setStart_date(tsmVO.getStart_date().substring(0, 7));
				
				Calendar cal = Calendar.getInstance();
				String sDate[] = tsmVO.getStart_date().split("-");
				cal.set(Util.toInteger(sDate[0]), Util.toInteger(sDate[1]), 1);
				cal.add(Calendar.DATE, 1);
				tsmVO.setLast_date(DateUtil.getDateNTimeByForm(cal, "yyyy-MM"));
				
				template = tsmService.callCenterMonthStats(tsmVO);
			}
			
			System.out.println("date:"+tsmVO.getStart_date() + "~" + tsmVO.getLast_date());
			
			template.setStats_total_cnt(Util.getNullReplace(template.getStats_total_cnt(), "0"));
			template.setStats_finish_cnt(Util.getNullReplace(template.getStats_finish_cnt(), "0"));
			template.setStats_question_cnt(Util.getNullReplace(template.getStats_question_cnt(), "0"));
			template.setStats_wait_cnt(Util.getNullReplace(template.getStats_wait_cnt(), "0"));
			
			model.addAttribute("statsData", template);
			
			model.addAttribute("start_date", tsmVO.getStart_date());
			model.addAttribute("send_type", tsmVO.getSend_type());
			
			model.addAttribute("navi", NAVI_NUM);
			
			return "/tsm/tsm_0504";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
}

