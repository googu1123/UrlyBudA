package egovframework.rte.cms.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import egovframework.rte.cmmn.util.ExcelRead;
import egovframework.rte.cmmn.util.Util;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class MsgController {

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
	private static int NAVI_NUM = 1;

								
	@RequestMapping("/msgStandardTest.tsis")
	public void msgStandardTest(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		tsmVO.setStartNum(5);
		tsmVO.setRecordCount(70);
		
		response.setContentType("text/html; charset=utf-8");
		List<TsmVO> standList = tsmService.msgStandard(tsmVO);
		
		PrintWriter out = response.getWriter();
		

		JSONObject obj;
		
		JSONArray arr = new JSONArray();
		for(int i = 0 ; i < standList.size(); i++){
			TsmVO tsmVoRow = standList.get(i);
			
			obj = new JSONObject();
			obj.put("PIDX", tsmVoRow.getPidx());
			obj.put("AIDX", tsmVoRow.getAidx());
			obj.put("SUBJECT", tsmVoRow.getSubject());
			obj.put("CONTENT", tsmVoRow.getContent());
			obj.put("DIV_NM", tsmVoRow.getDiv_nm());
			obj.put("REG_DATE", tsmVoRow.getReg_date());
			
			arr.add(obj);
		}
		
		out.print(arr.toString());
	}
	
	//메시지 규격관리
	@RequestMapping("/msgStandard.tsis")
	public String msgStandard(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		try {
			if(Common.sessionCheck(session)){
				//리스트 조회
				
//				TsmVO tempVO = (TsmVO)session.getAttribute("admin_info");
//				tsmVO.setDept(tempVO.getDept());
				
				int totalCount = tsmService.msgStandardCnt(tsmVO);
				
				String aidx = (String) request.getParameter("search_aidx");
				if(aidx!=null){
					tsmVO.setAidx(aidx);
				}
				
				//페이징 처리
				if(Common.pagingOrder(totalCount, tsmVO, model, request)){
					List<TsmVO> standList = tsmService.msgStandard(tsmVO);
					
					model.addAttribute("use_yn", tsmVO.getUse_yn());
					model.addAttribute("code", tsmVO.getCode());
					model.addAttribute("search_aidx", tsmVO.getAidx());
					model.addAttribute("subject", tsmVO.getSubject());
					model.addAttribute("div_nm", tsmVO.getDiv_nm());
					model.addAttribute("content", tsmVO.getContent());
					model.addAttribute("dept", tsmVO.getDept());
					model.addAttribute("standList", standList);
					
				} else {
					throw new Exception("ERR_PAGING_FAIL");
				}
				model.addAttribute("navi", NAVI_NUM);
				return "/tsm/tsm_0101";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.tsis");
				return "/common/link";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/common/500";
		}
	}
	
	//메시지 규격관리
	@RequestMapping("/msgBatchReg.tsis")
	public String msgBatchReg(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		try {
			if(Common.sessionCheck(session)){
				
				model.addAttribute("navi", NAVI_NUM);
				return "/tsm/tsm_0104";
			} else {
				model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
				model.addAttribute("returnUrl", "login.tsis");
				return "/common/link";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return "/common/500";
		}
	}
	
	//메시지 규격관리 상세
	@RequestMapping("/msgStandardDetail.tsis")
	public String msgStandardDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			TsmVO template = tsmService.msgStandardDetail(tsmVO);
			
			int pri_size = template.getPriority().length();
			String pri_fir = "",pri_sec = "", pri_thi = "";
			if(pri_size == 1){
				pri_fir = template.getPriority().substring(0, 1);
			} else if(pri_size == 2){
				pri_fir = template.getPriority().substring(0, 1);
				pri_sec = template.getPriority().substring(1, 2);
			} else if(pri_size == 3){
				pri_fir = template.getPriority().substring(0, 1);
				pri_sec = template.getPriority().substring(1, 2);
				pri_thi = template.getPriority().substring(2, 3);
			}
			
			model.addAttribute("tmp", template);
			model.addAttribute("pri_fir",pri_fir);
			model.addAttribute("pri_sec",pri_sec);
			model.addAttribute("pri_thi",pri_thi);
			model.addAttribute("navi", NAVI_NUM);
			
			model.addAttribute("len_code", 40);
			model.addAttribute("len_deli_no", 30);
			model.addAttribute("len_subject", 100);
			model.addAttribute("len_content", 2048);
			model.addAttribute("len_add_content", 100);
			model.addAttribute("len_div_nm", 50);
			model.addAttribute("len_description", 100);
			model.addAttribute("len_link_btn_name", 100);
			model.addAttribute("len_link_btn_url", 100);
			
			TsmVO temp = (TsmVO) session.getAttribute("admin_info");
			String auth = temp.getAuth();
			
			//권한별로 승인화면/등록 화면 보기
			if(auth.equals("M") || auth.equals("A")){
				//승인화면
				return "/tsm/tsm_010102";
			} else {
				//승인화면
				return "/tsm/tsm_010101";
			}
						
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	//메시지 규격관리 등록
	@RequestMapping("/msgStandardRegi.tsis")
	public String msgStandardRegi(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			model.addAttribute("reg_date", sdf.format(time));
			
			model.addAttribute("navi", NAVI_NUM);
			
			model.addAttribute("len_subject", 100);
			model.addAttribute("len_content", 2048);
			model.addAttribute("len_add_content", 100);
			model.addAttribute("len_div_nm", 50);
			model.addAttribute("len_description", 100);
			model.addAttribute("len_link_btn_name", 100);
			model.addAttribute("len_link_btn_url", 100);
			
			return "/tsm/tsm_010101";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
		
		
	}
	@RequestMapping("/msgStandardInsert.tsis")
	public String msgStandardInsert(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
	
			tsmVO.setContent(Util.htmlConvert(tsmVO.getContent()));
			tsmVO.setAdd_content(request.getParameter("add_content")); // 시작, 끝 공백이 사라져서 처리함
			
			String pidx = tsmService.msgStandardInsert(tsmVO);
			System.out.println("PIDX : "+ pidx);
			
			TsmVO his = tsmService.msgStandardDetail(tsmVO);
			his.setStatus("I");
			his.setAidx(aidx);
			tsmService.msgStandardInsertHistory(his);
			
			model.addAttribute("returnMsg", "등록요청되었습니다.");
			
			String auth = temp.getAuth();
			//권한별로 승인화면/등록 화면 보기
			if(auth.equals("M") || auth.equals("A")){
				//승인화면
				model.addAttribute("returnUrl", "msgStandard.tsis");
			} else {
				//등록화면
				model.addAttribute("returnUrl", "msgStandardRegi.tsis");
			}
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/msgStandardComlete.tsis")
	public String msgStandardComlete(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			
			tsmVO.setContent(Util.htmlConvert(tsmVO.getContent()));
			tsmVO.setAdd_content(request.getParameter("add_content")); // 시작, 끝 공백이 사라져서 처리함
			
			//업데이트
			/*tsmVO.setProcess("B");*/
			tsmService.msgStandardUpdate(tsmVO);
			
			TsmVO his = tsmService.msgStandardDetail(tsmVO);
			his.setStatus("I");
			his.setAidx(aidx);
			tsmService.msgStandardInsertHistory(his);
			
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "msgStandardDetail.tsis");
			model.addAttribute("returnData", "pidx="+tsmVO.getPidx());
			return "/common/link";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/msgStandardDelete.tsis")
	public String msgStandardDelete(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		System.out.println("CALL DELETE");
		if(Common.sessionCheck(session)){
			System.out.println(tsmVO.getPidx());
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			
			if(tsmVO.getPidx()!=null){
				String[] codes = tsmVO.getPidx().split(",");
				if(codes.length > 1){
					for(int i =0 ; i < codes.length; i++){
						TsmVO vo = new TsmVO();
						vo.setPidx(codes[i]);
						TsmVO his = tsmService.msgStandardDetail(vo);
						his.setStatus("D");
						his.setAidx(aidx);
						tsmService.msgStandardInsertHistory(his);
						tsmService.msgStandardDelete(vo);
					}
				}else {
					TsmVO his = tsmService.msgStandardDetail(tsmVO);
					his.setStatus("D");
					his.setAidx(aidx);
					tsmService.msgStandardInsertHistory(his);
					tsmService.msgStandardDelete(tsmVO);
				}
				
				model.addAttribute("returnMsg", "success");
				model.addAttribute("returnUrl", "msgStandard.tsis");
				return "/common/link";
			} else {
				model.addAttribute("returnMsg", "선택하신 목록이 없습니다.");
				model.addAttribute("returnUrl", "msgStandard.tsis");
				return "/common/link";
			}
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/msgStandardUpdate.tsis")
	public String msgStandardUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			
			tsmVO.setContent(Util.htmlConvert(tsmVO.getContent()));
			
			tsmService.msgStandardUpdate(tsmVO);
			TsmVO his = tsmService.msgStandardDetail(tsmVO);
			his.setStatus("U");
			his.setAidx(aidx);
			tsmService.msgStandardInsertHistory(his);
			
			request = null;
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "msgStandard.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	/**
	 * 메시지 일괄등록 엑셀파일 등록하기
	 * @param tsmVO
	 * @param model
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/	updateTemplate.tsis")
	public String updateTemplate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO temp = (TsmVO)session.getAttribute("admin_info");
			String aidx = temp.getAidx();
			
			if(tsmVO.getUpload_data().getSize() > 0 && !tsmVO.getUpload_data().isEmpty()){
				
				File src = new File(tsmVO.getUpload_data().getOriginalFilename());
				tsmVO.getUpload_data().transferTo(src);
				
				String[] tmp_ext = tsmVO.getUpload_data().getOriginalFilename().split("[.]");
				
				String ext = tmp_ext[1];
				
				ExcelRead read = new ExcelRead();
				List<TsmVO> regList = null;
				if(ext.equals("xlsx")){
					regList = read.ReadXLSX(new FileInputStream(src));
				} else {
					regList = read.ReadXLS(new FileInputStream(src));
				}
				
				
				for(int i = 0 ; i < regList.size(); i++){
					regList.get(i).setContent(Util.htmlConvert(regList.get(i).getContent()));
					
					String pidx = tsmService.msgStandardInsertBatch(regList.get(i));
					regList.get(i).setPidx(pidx);
					regList.get(i).setAidx(aidx);
					tsmService.msgStandardInsertHistory(regList.get(i));
				}
			}
			
			request = null;
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "msgBatchReg.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/	isCodeCheck.tsis")
	public String isCodeCheck(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int isCheck = tsmService.isCodeCheck(tsmVO);
		
		if(isCheck >= 1){
			out.print("N");
		} else {
			out.print("Y");
		}
		
		out.flush();
		out.close();
		
		return null;
	}


	
	
	//메시지 우선순위 정의
	/*@RequestMapping("/msgPriority.tsis")
	public String msgPriority(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO send = tsmService.msgSendPriority(tsmVO);		
			
			System.out.println(send.getPriority());
			
			System.out.println(send.getPriority().charAt(0));
			System.out.println(send.getPriority().charAt(1));
			System.out.println(send.getPriority().charAt(2));
			
			model.addAttribute("send", send);
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0102";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}	
	}*/
}

