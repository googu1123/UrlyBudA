package egovframework.rte.cms.web;

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

import egovframework.rte.cms.service.TsmDefaultVO;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class LoginController {

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

	//메인 
	//로그인 페이지
	@RequestMapping("/login.do")
	public String login(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int size = 0;
		if(request.getCookies()!=null){
    		Cookie[] ck = request.getCookies();
    		
    		size = ck.length;
    		String id="";
    		CookieGenerator cg = new CookieGenerator();
    		if(size > 0){
    			for(int i = 0; i < size; i++){
    				String name = ck[i].getName();
    				if(name.equals("tsm_id")){
    					id = ck[i].getValue();
    					System.out.println("ID : " + id);
    					if(id !=null && id.length() > 0){
    						model.addAttribute("ck", "Y");    						
    					} else {
    						model.addAttribute("ck", "N");
    					}
    					model.addAttribute("tsm_id",id);
    				}
    			}
    		} else {
    			model.addAttribute("ck", "N");
    		}
		}
		
		return "/tsm/tsm_00";
	}

	//로그인 유효성 검사/ 쿠키저장
	@RequestMapping("/loginCheck.do")
	public String loginCheck(@ModelAttribute("tsmVO") TsmVO tsmVO, ModelMap model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {

		session.setMaxInactiveInterval(SESSION_TIMEOUT);

		
		System.out.println("LOGINID  : " + tsmVO.getAidx());		
		System.out.println("REQUEST CHECK 1111 : " + request.getParameter("check_id"));
		
		String adminID = tsmVO.getAidx();
		String save_id = request.getParameter("check_id");
		//String passwd = AES128.encrypt(tsmVO.getPasswd());
		String passwd = tsmVO.getPasswd();
		
		tsmVO.setPasswd(passwd);
				
		
		TsmVO admin_info = tsmService.loginCheck(tsmVO);
		
		if(admin_info == null) {
			model.addAttribute("returnMsg", propertiesService.getString("loginFail"));
			model.addAttribute("returnUrl", "login.do");
		} else {

			CookieGenerator cg = new CookieGenerator();
			cg.setCookieMaxAge(60*60*24*7);
			
			if(save_id.equals("Y")){
				cg.setCookieName("tsm_id");
				cg.addCookie(response, adminID);
			} else {
				cg.setCookieName("tsm_id");
				cg.addCookie(response, "");
			}
			
			session.setAttribute("aidx", adminID);
			session.setAttribute("admin_info", admin_info);
						
			model.addAttribute("returnMsg", "success");
			model.addAttribute("returnUrl", "campaign.do");
			
		}
		return "/common/link";
	}

	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(@ModelAttribute("mainVO") TsmVO mainVO, ModelMap model, HttpSession session, HttpServletRequest request) throws Exception {

		session.setAttribute("aidx", "");
		session.invalidate();	//세션값 삭제
		
		model.addAttribute("returnMsg", "success");
		model.addAttribute("returnUrl", "login.do");
		
		return "/common/link";
	}
}

