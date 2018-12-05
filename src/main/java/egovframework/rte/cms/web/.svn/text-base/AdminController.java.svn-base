package egovframework.rte.cms.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.CookieGenerator;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.tsis.applicense.AES128;

import egovframework.rte.cmmn.util.Common;
import egovframework.rte.cms.service.TsmDefaultVO;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class AdminController {

	/** MainService */
	@Resource(name = "tsmService")
	private TsmService tsmService;
	private int SESSION_TIMEOUT = 60000;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	//네비 메뉴
	private static int NAVI_NUM = 3;

	
	//수신거부 현황 리스트 페이지
	@RequestMapping("/refuseList.tsis")
	public String refuseList(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		if(Common.sessionCheck(session)){
			
			String aidx = request.getParameter("search_aidx");
			String refuse = request.getParameter("search_refuse");
			String mtype = request.getParameter("search_mtype");
			String receive_num = request.getParameter("search_receive_num");
			
			if(aidx != null)
				tsmVO.setAidx(aidx);
			
			if(refuse != null)
				tsmVO.setRefuse(refuse);
			
			if(mtype != null){
				tsmVO.setMtype(mtype);
			}
			
			if(receive_num !=null){
				tsmVO.setReceive_num(receive_num);
			}
			
			
			int totalCount = tsmService.refuseListCnt(tsmVO);
			if(Common.pagingOrder(totalCount, tsmVO, model, request)){				
				List refuseList = tsmService.refuseList(tsmVO);
				model.addAttribute("refuseList", refuseList);
				model.addAttribute("search_aidx", aidx);
				model.addAttribute("search_refuse", refuse);
				model.addAttribute("search_mtype", mtype);
				model.addAttribute("search_receive_num", receive_num);
				model.addAttribute("start_date", tsmVO.getStart_date());
				model.addAttribute("last_date", tsmVO.getLast_date());
				
			}
			
						
			model.addAttribute("navi", 4);
			return "/tsm/tsm_0401";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	//수신거부 현황 리스트 페이지
	@RequestMapping("/refuseRegi.tsis")
	public String refuseRegi(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		
		if(Common.sessionCheck(session)){
			
			
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			model.addAttribute("reg_date", sdf.format(time));
			model.addAttribute("navi", 4);
			return "/tsm/tsm_040101";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	
	
	//수신거부 상세 페이지
	@RequestMapping("/refuseDetail.tsis")
	public String refuseDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		
		if(Common.sessionCheck(session)){
			
			TsmVO vo  = tsmService.refuseDetail(tsmVO);
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			vo.setMod_date(sdf.format(time));
			
			model.addAttribute("detail", vo);
			model.addAttribute("navi", 4);
			return "/tsm/tsm_040102";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	//수신거부 상세 수정
	@RequestMapping("/refuseModify.tsis")
	public String refuseModify(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		
		if(Common.sessionCheck(session)){
			
			tsmService.refuseModify(tsmVO);
			tsmService.refuseInsertHistory(tsmVO);
			
			model.addAttribute("navi", 4);
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "refuseList.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}	
	
	//수신거부 상세 삭제
	@RequestMapping("/refuseDelete.tsis")
	public String refuseDelete(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		
		if(Common.sessionCheck(session)){
			
			String[] pidx = tsmVO.getPidx().split(",");
			
			if(pidx.length > 1){
				for(int i =0 ; i < pidx.length ; i++){
					TsmVO vo = new TsmVO();
					vo.setPidx(pidx[i]);
					vo.setDel_desc(tsmVO.getDel_desc());
					tsmService.refuseDelete(vo);
					tsmService.refuseInsertHistory(vo);
				}
			} else {
				tsmService.refuseDelete(tsmVO);
				tsmService.refuseInsertHistory(tsmVO);
			}
			
			
			
			model.addAttribute("navi", 4);
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "refuseList.tsis");
			
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}		
	
	//수신거부 현황 리스트 페이지
	@RequestMapping("/refuseInsert.tsis")
	public String refuseInsert(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		
		if(Common.sessionCheck(session)){

			if(tsmVO.getMtype().contains("A")){
				//알림톡 수신거부 테이블 등록 유/무 검사
				
				//알림톡 수신거부 테이블에 추가/수정
			}
			
			String pidx = tsmService.refuseInsert(tsmVO);
			
			tsmVO.setPidx(pidx);
			
			System.out.println("PIDX : " + pidx);
			tsmService.refuseInsertHistory(tsmVO);
			
			model.addAttribute("returnData", "pidx="+tsmVO.getPidx());
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "refuseDetail.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	
	//수신거부 현황 리스트 페이지
	@RequestMapping("/checkRefuseNum.tsis")
	public void checkRefuseNum(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
	
		PrintWriter out = response.getWriter();
		int cnt = tsmService.checkRefuseNum(tsmVO);
		
		out.print(cnt);
		
		out.flush();
		out.close();
	}	
	
	
	
	
	//관리자 리스트 페이지
	@RequestMapping("/agentInfo.tsis")
	public String agentInfo(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			String aidx = request.getParameter("search_aidx");
			String name = request.getParameter("search_name");
			if(aidx != null){
				tsmVO.setAidx(aidx);
			}
			
			if(name != null){
				tsmVO.setName(name);
			}
			
			int totalCount = tsmService.adminListCnt(tsmVO);
			if(Common.pagingOrder(totalCount, tsmVO, model, request)){				
				List adminList = tsmService.adminList(tsmVO);
				model.addAttribute("adminList", adminList);
			}
			
			model.addAttribute("search_aidx", aidx);
			model.addAttribute("search_name", name);
			
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_0301";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
		
		
	}

	//관리자등록 화면
	@RequestMapping("/agentRegister.tsis")
	public String agentRegister(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(Common.sessionCheck(session)){
			
			long time = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			model.addAttribute("reg_date", sdf.format(time));
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
		
		model.addAttribute("navi", NAVI_NUM);
		return "/tsm/tsm_030101";
	}
	
	@RequestMapping("/agentCheck.tsis")
	public String agentCheck(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		PrintWriter out = response.getWriter();
		
		int check = tsmService.adminListCnt(tsmVO);
		out.print(check);
		out.flush();
		out.close();
		
		return null;
	}
	
	
	@RequestMapping("/agentInsert.tsis")
	public String agentInsert(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(Common.sessionCheck(session)){
			
			String passwd = tsmVO.getPasswd();
			
			passwd = AES128.encrypt(passwd);
			tsmVO.setPasswd(passwd);
			
			tsmService.agentInsert(tsmVO);
			
			model.addAttribute("returnMsg", "등록되었습니다.");
			model.addAttribute("returnUrl", "agentInfo.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	@RequestMapping("/agentDelete.tsis")
	public String agentDelete(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(Common.sessionCheck(session)){
			
			String[] arrAidx = tsmVO.getAidx().split(",");
			if(arrAidx.length > 1){
				for(int i = 0 ; i < arrAidx.length ; i++){
					TsmVO vo =new TsmVO();
					vo.setAidx(arrAidx[i]);
					tsmService.agentDelete(vo);
				}
			} else {
				tsmService.agentDelete(tsmVO);
			}
			
			model.addAttribute("returnMsg", "삭제되었습니다.");
			model.addAttribute("returnUrl", "agentInfo.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	
	@RequestMapping("/agentUpdate.tsis")
	public String agentUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		if(Common.sessionCheck(session)){
			
			String passwd = tsmVO.getPasswd();
			System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>> : "+ passwd);
			if(passwd!=null && passwd.length()>0){
				passwd = AES128.encrypt(passwd);
				tsmVO.setPasswd(passwd);
			}
			tsmService.agentUpdate(tsmVO);
			
			TsmVO admin_info = (TsmVO) session.getAttribute("admin_info");

			if(tsmVO.getName()!=null){
				admin_info.setName(tsmVO.getName());
			}
			
			if(tsmVO.getAuth()!=null){
				admin_info.setAuth(tsmVO.getAuth());
			}
			
			session.setAttribute("admin_info", admin_info);
			
			model.addAttribute("returnMsg", "수정되었습니다.");
			model.addAttribute("returnUrl", "agentInfo.tsis");
			return "/common/link";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
	
	
	//관리자 수정 화면
	@RequestMapping("/agentInfoDetail.tsis")
	public String agentInfoDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request) throws Exception {
		
		if(Common.sessionCheck(session)){
			
			TsmVO detail = tsmService.adminInfoDetail(tsmVO);
			model.addAttribute("detail", detail);
			model.addAttribute("navi", NAVI_NUM);
			return "/tsm/tsm_030101";
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.tsis");
			return "/common/link";
		}
	}
}

