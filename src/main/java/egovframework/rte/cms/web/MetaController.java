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
import egovframework.rte.cmmn.util.FileUtil;
import egovframework.rte.cmmn.util.Util;
import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
//@SessionAttributes(types=BrochureVO.class)
public class MetaController {

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

								
	@RequestMapping("/metaList.do")
	public String metaDataList(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				
				//리스트 조회
//				int totalCount = tsmService.metaTotalCnt(tsmVO);
//				
//				//페이징 처리
//				if(Common.pagingOrder(totalCount, tsmVO, model, request)){
//					List<TsmVO> metaList = tsmService.metaList(tsmVO);
//					
//					model.addAttribute("tran_status", tsmVO.getTran_status());
//					model.addAttribute("subject", tsmVO.getSubject());
//					model.addAttribute("metaList", metaList);
//					
//				} else {
//					throw new Exception("ERR_PAGING_FAIL");
//				}
//				model.addAttribute("navi", NAVI_NUM);
				
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
	
	@RequestMapping("/metaDetail.do")
	public String metaDetail(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception 
	{
		if(Common.sessionCheck(session)){
			
			TsmVO metaDetail = tsmService.metaDetail(tsmVO);
			List<TsmVO> metaValidList = tsmService.metaValidList(tsmVO);
			
			model.addAttribute("navi", NAVI_NUM);
			model.addAttribute("view", metaDetail);
			model.addAttribute("metaValidList", metaValidList);
			
			return "/tsm/tsm_070101";
			
		} else {
			model.addAttribute("returnMsg", propertiesService.getString("sessionFail"));
			model.addAttribute("returnUrl", "login.do");
			return "/common/link";
		}
	}
	
	@RequestMapping("/metaValidUpdate.do")
	public String metaValidUpdate(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				
				tsmService.metaValidUpdate(tsmVO);
				
				model.addAttribute("navi", NAVI_NUM);
				model.addAttribute("returnMsg", "success");
				model.addAttribute("returnUrl", "metaDetail.do");
				model.addAttribute("returnData", "btch_key="+tsmVO.getBtch_key());
				return "/common/link";
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
	
	@RequestMapping("/metaFileTran.do")
	public String metaFileTran(@ModelAttribute("tsmVO") TsmVO tsmVO, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
	
		try {
			if(Common.sessionCheck(session)){
				
				List<TsmVO> metaValidList = tsmService.metaValidList(tsmVO);
				String ingPath = Common.ING_PATH;
				
				if(FileUtil.SetFR(metaValidList, ingPath))
				{
					tsmVO.setTran_status("1");
					tsmService.metaTranUpdate(tsmVO);
				}
				
				model.addAttribute("navi", NAVI_NUM);
				model.addAttribute("returnMsg", "success");
				model.addAttribute("returnUrl", "metaList.do");
				//model.addAttribute("returnData", "btch_key="+tsmVO.getBtch_key());
				return "/common/link";
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

}

