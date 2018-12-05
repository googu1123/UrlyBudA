package egovframework.rte.cmmn.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import egovframework.rte.cms.service.TsmVO;

public class Common {
	
	public final static String DEFAULT_PATH="/Users/cgkang/Desktop/FILE_DIR";
	public final static String ING_PATH="/Users/cgkang/Desktop/FILE_DIR/ing";
	public final static String BAK_PATH="/Users/cgkang/Desktop/FILE_DIR/bak";
	public final static String FR_PATH="/Users/cgkang/Desktop/FILE_DIR/fr";
	public final static String LAST_PATH="/Users/cgkang/Desktop/FILE_DIR/last";
	public final static String SHORT_URL_SERVER="http://125.131.140.89:2020";
	
//	public final static String DEFAULT_PATH="/product/icmsAgent/file_dir";
//	public final static String ING_PATH="/product/icmsAgent/file_dir/ing";
//	public final static String BAK_PATH="/product/icmsAgent/file_dir/bak";
//	public final static String FR_PATH="/product/icmsAgent/file_dir/fr";
//	public final static String LAST_PATH="/product/icmsAgent/file_dir/last";
//	public final static String SHORT_URL_SERVER="http://40.1.7.158:18991";
	
	
	public final static String IMAGE_UPLOAD_PATH = "D:/Source/tsis/SmartMessageWebAdmin/src/main/webapp/upload/";
	public final static String IMAGE_URL = "http://127.0.0.1:8080/upload/";
	
	/**
	 * 세션 체크 함수
	 * @param session
	 * @return
	 */
	public static boolean sessionCheck(HttpSession session){
		TsmVO admin = (TsmVO) session.getAttribute("admin_info");
		if(admin!=null){
			return true;
		} else {
			return false;			
		}
	}
	
	/**
	 * 세션 체크 함수
	 * @param session
	 * @return
	 */
	public static boolean authCheck(HttpSession session,String currentUrl){
		TsmVO admin = (TsmVO) session.getAttribute("admin_info");
		
		String auth = admin.getAuth();
		
		if(admin!=null){
			if(auth.equals("A") || auth.equals("M")){
				return true;
			} else if(auth.equals("W") && currentUrl.equals("msgStandard")){
				return true;
			} else if(auth.equals("H") && currentUrl.equals("msgHistory")) { 
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 페이징 처리 함수
	 * @param totalCount
	 * @param tsmVO
	 * @param model
	 * @param request
	 * @return
	 */
	public static boolean pagingOrder(int totalCount, TsmVO tsmVO, Model model, HttpServletRequest request){
		
		try {
			String searchAppName = request.getParameter("name");
			
			if(tsmVO.getRecordCount() == 0) tsmVO.setRecordCount(20);
			
			//paging
			int tmpPageCnt = (int) totalCount/tsmVO.getRecordCount();
			if(totalCount%tsmVO.getRecordCount() > 0) {
				tmpPageCnt = tmpPageCnt+1;
			}
			tsmVO.setTotalPage(tmpPageCnt);	//총 페이지 수
			System.out.println("totalPage = " +  tsmVO.getTotalPage());
			
			tsmVO.setBlockCount(5);		//보여질 페이지 수
			
			if(tsmVO.getNowPage() <= 0) tsmVO.setNowPage(1);
			tsmVO.setStartNum((tsmVO.getNowPage()-1) * tsmVO.getRecordCount());	//시작번호
			
			int prePage = tsmVO.getNowPage()-1;		//이전페이지
			int nowPage = tsmVO.getNowPage();			//현재페이지
			int nextPage = tsmVO.getNowPage()+1;		//다음페이지
			int totalPage = tsmVO.getTotalPage();		//마지막 페이지 수
			int blockCount = tsmVO.getBlockCount();	//보여질 페이지 수
			
			//페이지 리스트
			List<Integer> pageList = new ArrayList<Integer>();
			if(nowPage <= 3) {	//현재페이지가 3페이지 이하일 경우
				if(totalPage >= blockCount) {		//총페이지수가 보여질 페이지 수보다 크거나 같을 경우
					for(int i=1; i <= blockCount; i++) {
						pageList.add(i);
					}
				}
				else {
					for(int i=1; i <= totalPage; i++) {	//총페이지수가 보여질 페이지 수보다 작을 경우
						pageList.add(i);
					}
				}
			} else if(nowPage >= totalPage-1) {	//현재페이지가 마지막페이지 보다 1작거나 같을 경우
				if(totalPage < blockCount) {
					for(int i=1; i <= totalPage; i++) {
						pageList.add(i);
					}
				}
				else {
					for(int i=totalPage-4; i <= totalPage; i++) {
						pageList.add(i);
					}
				}
			} else {
				for(int i=nowPage-2; i <= nowPage+2; i++) {
					pageList.add(i);
				}
			}
			
			model.addAttribute("pageList", pageList);
			model.addAttribute("prePage", prePage);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("totalPage", totalPage);
			model.addAttribute("totalCount", totalCount);
			
			model.addAttribute("blockCount", blockCount);
			
			model.addAttribute("recordCount", tsmVO.getRecordCount());
			model.addAttribute("searchAppName", searchAppName);
			
			model.addAttribute("orderColumn", tsmVO.getOrderColumn());
			model.addAttribute("orderMethod", tsmVO.getOrderMethod());
			return true;
		} catch (Exception e) {
			//e.printStackTrace();
			return false;
		}
	}
	
	
	public static void download(HttpServletResponse response, File excel, String url, String replace_fileName) throws IOException{

			
        File file = new File(url+"/"+excel.getName());
        response.setContentType("application/octet-stream;charset=utf-8");
        //response.setHeader("Content-Disposition","attachment; filename=" + new String(replace_fileName.getBytes("UTF8"), "8859_1") + ";");
        response.setHeader("Content-Disposition","attachment; filename=" + URLEncoder.encode(replace_fileName,"UTF-8").replaceAll("\\+", "%20") + ";");
        response.setHeader("Connection", "close");
        response.setContentLength((int)file.length());
        FileInputStream inputStream = new FileInputStream(excel);
        IOUtils.copyLarge(inputStream, response.getOutputStream());
        inputStream.close();

    }
	
	@SuppressWarnings("unchecked")
	public static String getScenarioJson(TsmVO tsmVO) throws Exception {
		JSONParser parser = new JSONParser();
		JSONObject json = new JSONObject();
		
		if (!Util.isNull(tsmVO.getRes_message())) {
			json = (JSONObject) parser.parse(tsmVO.getRes_message());
		}
		
		//------------------------------------------
		// MESSAGE
		//------------------------------------------
		JSONObject jsonMessage = new JSONObject();
		
		if (!Util.isNull(tsmVO.getContent())) {
			jsonMessage.put("text", tsmVO.getContent());
		}

		if (!Util.isNull(tsmVO.getImage_url())) {
			JSONObject jsonPhoto = new JSONObject();
			jsonPhoto.put("url", tsmVO.getImage_url());
			jsonPhoto.put("width", "640");
			jsonPhoto.put("height", "480");
			jsonMessage.put("photo", jsonPhoto);
		}
		
		if (!Util.isNull(tsmVO.getLink_btn_name())) {
			JSONObject jsonMessageButton = new JSONObject();
			jsonMessageButton.put("label", tsmVO.getLink_btn_name());
			jsonMessageButton.put("url", Util.getNullReplace(tsmVO.getLink_btn_url(), ""));
			jsonMessage.put("message_button", jsonMessageButton);
		}
		
		json.remove("message");
		json.put("message", jsonMessage);
		
		//------------------------------------------
		// KEYBOARD
		//------------------------------------------
		JSONObject jsonKeyboard = new JSONObject();
		
		if (!Util.isNull(tsmVO.getRes_message())) {
			jsonKeyboard = (JSONObject) json.get("keyboard");
		}
		jsonKeyboard.remove("type");
		jsonKeyboard.put("type", tsmVO.getSend_type());
		
		json.remove("keyboard");
		json.put("keyboard", jsonKeyboard);
		return json.toString();
	}
	
	public static String fileUpload(HttpServletRequest request, String path,
			String inputName) {

		String imageUrl = null;
		
		try {
			MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;

			if (ServletFileUpload.isMultipartContent(request)) {

				System.out.println("image path:" + path);
				File dir = new File(path);
				if (!dir.isDirectory()) {
					dir.mkdirs();
				}
				
				CommonsMultipartFile mFile = (CommonsMultipartFile) mRequest.getFile(inputName);

				if (mFile != null) {

					String originalFileName = mFile.getOriginalFilename();

					if (originalFileName != null && !originalFileName.equals("")) {

						// 한글꺠짐 방지
						// originalFileName = new String(mFile
						// .getOriginalFilename().getBytes("8859_1"),
						// "UTF-8");

						// String originalContentType = mFile.getContentType();
						// file_type

						// 파일 명 변경(uuid로 암호화)
						String ext = originalFileName.substring(originalFileName.lastIndexOf('.')); // 확장자
						String saveFileName = getUuid() + ext;

						File serverFile = new File(path + File.separator + saveFileName);

						// 파일 존재하는지 검증
						if (serverFile.exists()) {
							saveFileName = System.currentTimeMillis() + "_" + saveFileName;
							serverFile = new File(path + File.separator + saveFileName);
						}

						// 파일 저장
						mFile.transferTo(serverFile);
						imageUrl = IMAGE_URL + saveFileName;
					}
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return imageUrl;
	}

	// uuid생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
