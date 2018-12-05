package egovframework.rte.cms.service;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class TsmVO extends TsmDefaultVO {
	
	private static final long serialVersionUID = 1L;
	
	/** log table name */
	private String table_name;
    
	/** 관리자 ID */
	private String aidx;
	
	/** 회사 명 */
	private String company_name;
	
	/** AGENT PWD */
	private String passwd;
	
	/** 관리자 Phone */
	private String phone;
	
	/** 관리자 이름 */
	private String name;
	
	/** 관리자 회사 코드 */
	//private String cp_id;	
	private String cidx;
	private String cp_id;
	
	/** 관리자 부서명 */
	private String dept;
	
	/** 리스트 인덱스 */
	private String pidx;
	
	/** 메시지 규격 or 내용 */
	private String content;
	
	/** 제목 */
	private String subject;
	
	/** 메시지 규격 코드 */
	private String code;
	
	/** 등록일 */
	private String reg_date;
	
	/** 수정일 */
	private String mod_date;
	
	/** 총 수*/
	private int cnt;
	
	/** 메시지 발송 타입 */
	private String mtype;
	
	/** 에러코드 설명 */
	private String description;
	
	/** 메시지 UMS 키값 고유값 */
	private String ukey;
	
	/** 메시지 내용 */
	private String message;
	
	/** 수신번호 */
	private String receive_num;
	
	/** 발송번호 or 발송자 */
	private String sender;
	
	/** 요청 날짜 */
	private String req_date;
	
	/** 예약 날짜 */
	private String reserve_date;
	
	/** 결과 수신일 */
	private String report_date;
	
	/** 메시지 결과 값 */
	private String req_result;
	
 	/** 첨부 파일명 */
	private String fax_file;
	
	/** 검색 발송 구분값	 */
	private String send_type;

	/** 검색 번호 */
	private String search_num;
	
	/** 검색 시작일 */
	private String start_date;
	
	/** 검색 종료일 */
	private String last_date;
	
	/** 발송 순서*/
	private String priority;
	
	/** 타발송 여부 */
	private String t_req;
	
	/** 알림톡 사용 유무 */
	private String use_yn;
	
	/** 사용자 계정 권한 */
	private String auth;
	
	/** 페이징 인덱스 */
	private String idx;
	
	/** 월별 일별 데이터 구분값(월별 : M, 일별 :D)*/
	private String day_type;
	
	/** 성공 실패유무 검색조건 */
	private String result_value;
	
	/** 실시간/배치 테이블 구분 값*/
	private String table_div;
	
	/** 정보성 유무 */
	private String info_yn;
	
	/** 요청자 부서 정보*/
	private String div_nm;
	
	/** 변경 상태 값 추가*/
	private String status;
	
	/** 진행상태 값 */
	private String process;
	
	/** 심의 번호 */
	private String deli_no;
	
	/** 문구 사용유무 */
	private String use;
	
	/** 엑셀업로드	 */
	private CommonsMultipartFile upload_data; 
	
	private String send_date;
	
	/** 승인 아이디 */
	private String proc_aidx;
	
	/** 수신거부 승인여부 */
	private String refuse;
	
	/** 요청처 구분 설명 */
	private String src_desc;
	
	/** 삭제 사유 */
	private String del_desc;
	
	private String src_table;
	
	
	private String fail_yn;
	
	/** 메신저별 성공 실패값 정의 */
	private int n_succ;
	private int n_fail;
	private int a_succ;
	private int a_fail;
	private int s_succ;
	private int s_fail;
	private int l_succ;
	private int l_fail;
	
	/** 발송 제한유무 */
	private String limit_yn;
	
	/** 발송 제한 구분 (분, 시, 일:M, H, D) */
	private String limit_type;
	
	/** 발송 제한 건수 */
	private int limit_count;
	
	/** 제한발송 시작시간 */
	private String limit_start_hour;
	
	/** 제한발송 종료 시간 */
	private String limit_end_hour;
	
	/**   */
	private String realtime_type;
	
	/**    */
	private String realtime_status;
	
	/** */
	private String realtime_cnt;
	
	/** 추가 종료문구 사용여부 */
	private String add_content_yn;
	
	/** 추가 종료문구 */
	private String add_content;
	
	/** 고객 ID */
	private String cust_id;
	
	private String stats_total_cnt;
	private String stats_finish_cnt;
	private String stats_question_cnt;
	private String stats_wait_cnt;
	
	/** 답변 */
	private String res_message;
	
	/** 링크관리 버튼 */
	private String link_btn_name;
	private String link_btn_url;
	
	private String image_url;
	
	private String etc1;
	private String etc2;
	private String etc3;
	
	/** LONG URL */
	private String long_link;

	/**SHORT URL */
	private String short_link;

		
	
	//campaign table
	private String wrtdate;
	private String link_limit_day;
	
	
	public String getLink_limit_day() {
		return link_limit_day;
	}
	public void setLink_limit_day(String link_limit_day) {
		this.link_limit_day = link_limit_day;
	}
	
	public String getWrtdate() {
		return wrtdate;
	}
	public void setWrtdate(String wrtdate) {
		this.wrtdate = wrtdate;
	}
	public String getLong_link() {
		return long_link;
	}
	public void setLong_link(String long_link) {
		this.long_link = long_link;
	}
	public String getShort_link() {
		return short_link;
	}
	public void setShort_link(String short_link) {
		this.short_link = short_link;
	}
	
	
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getEtc3() {
		return etc3;
	}
	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
	/** 정렬순서 */
	private String order_num;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getLink_btn_name() {
		return link_btn_name;
	}
	public void setLink_btn_name(String link_btn_name) {
		this.link_btn_name = link_btn_name;
	}
	public String getLink_btn_url() {
		return link_btn_url;
	}
	public void setLink_btn_url(String link_btn_url) {
		this.link_btn_url = link_btn_url;
	}
	public String getRes_message() {
		return res_message;
	}
	public void setRes_message(String res_message) {
		this.res_message = res_message;
	}
	public String getStats_total_cnt() {
		return stats_total_cnt;
	}
	public void setStats_total_cnt(String stats_total_cnt) {
		this.stats_total_cnt = stats_total_cnt;
	}
	public String getStats_finish_cnt() {
		return stats_finish_cnt;
	}
	public void setStats_finish_cnt(String stats_finish_cnt) {
		this.stats_finish_cnt = stats_finish_cnt;
	}
	public String getStats_question_cnt() {
		return stats_question_cnt;
	}
	public void setStats_question_cnt(String stats_question_cnt) {
		this.stats_question_cnt = stats_question_cnt;
	}
	public String getStats_wait_cnt() {
		return stats_wait_cnt;
	}
	public void setStats_wait_cnt(String stats_wait_cnt) {
		this.stats_wait_cnt = stats_wait_cnt;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getLimit_yn() {
		return limit_yn;
	}
	public void setLimit_yn(String limit_yn) {
		this.limit_yn = limit_yn;
	}
	public String getLimit_type() {
		return limit_type;
	}
	public void setLimit_type(String limit_type) {
		this.limit_type = limit_type;
	}
	public int getLimit_count() {
		return limit_count;
	}
	public void setLimit_count(int limit_count) {
		this.limit_count = limit_count;
	}
	public String getLimit_start_hour() {
		return limit_start_hour;
	}
	public void setLimit_start_hour(String limit_start_hour) {
		this.limit_start_hour = limit_start_hour;
	}
	public String getLimit_end_hour() {
		return limit_end_hour;
	}
	public void setLimit_end_hour(String limit_end_hour) {
		this.limit_end_hour = limit_end_hour;
	}
	public String getAidx() {
		return aidx;
	}
	public void setAidx(String aidx) {
		this.aidx = aidx;
	}	
	public String getCompany_name() {
		return company_name;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCidx() {
		return cidx;
	}
	public void setCidx(String cidx) {
		this.cidx = cidx;
	}
	public String getCp_id() {
		return cp_id;
	}
	public void setCp_id(String cp_id) {
		this.cp_id = cp_id;
	}
	public String getPidx() {
		return pidx;
	}
	public void setPidx(String pidx) {
		this.pidx = pidx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getUkey() {
		return ukey;
	}
	public void setUkey(String ukey) {
		this.ukey = ukey;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getReceive_num() {
		return receive_num;
	}
	public void setReceive_num(String receive_num) {
		this.receive_num = receive_num;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReq_date() {
		return req_date;
	}
	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}
	public String getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(String reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReq_result() {
		return req_result;
	}
	public void setReq_result(String req_result) {
		this.req_result = req_result;
	}
	public String getSend_type() {
		return send_type;
	}
	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}
	public String getSearch_num() {
		return search_num;
	}
	public void setSearch_num(String search_num) {
		this.search_num = search_num;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getLast_date() {
		return last_date;
	}
	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}
	public int getN_succ() {
		return n_succ;
	}
	public void setN_succ(int n_succ) {
		this.n_succ = n_succ;
	}
	public int getN_fail() {
		return n_fail;
	}
	public void setN_fail(int n_fail) {
		this.n_fail = n_fail;
	}
	public int getA_succ() {
		return a_succ;
	}
	public void setA_succ(int a_succ) {
		this.a_succ = a_succ;
	}
	public int getA_fail() {
		return a_fail;
	}
	public void setA_fail(int a_fail) {
		this.a_fail = a_fail;
	}
	public int getS_succ() {
		return s_succ;
	}
	public void setS_succ(int s_succ) {
		this.s_succ = s_succ;
	}
	public int getS_fail() {
		return s_fail;
	}
	public void setS_fail(int s_fail) {
		this.s_fail = s_fail;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getT_req() {
		return t_req;
	}
	public void setT_req(String t_req) {
		this.t_req = t_req;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getDay_type() {
		return day_type;
	}
	public void setDay_type(String day_type) {
		this.day_type = day_type;
	}
	public int getL_succ() {
		return l_succ;
	}
	public void setL_succ(int l_succ) {
		this.l_succ = l_succ;
	}
	public int getL_fail() {
		return l_fail;
	}
	public void setL_fail(int l_fail) {
		this.l_fail = l_fail;
	}
	public String getResult_value() {
		return result_value;
	}
	public void setResult_value(String result_value) {
		this.result_value = result_value;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTable_div() {
		return table_div;
	}
	public void setTable_div(String table_div) {
		this.table_div = table_div;
	}
	public String getInfo_yn() {
		return info_yn;
	}
	public void setInfo_yn(String info_yn) {
		this.info_yn = info_yn;
	}
	public String getDiv_nm() {
		return div_nm;
	}
	public void setDiv_nm(String div_nm) {
		this.div_nm = div_nm;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
	public String getDeli_no() {
		return deli_no;
	}
	public void setDeli_no(String deli_no) {
		this.deli_no = deli_no;
	}
	public String getProc_aidx() {
		return proc_aidx;
	}
	public void setProc_aidx(String proc_aidx) {
		this.proc_aidx = proc_aidx;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public CommonsMultipartFile getUpload_data() {
		return upload_data;
	}
	public void setUpload_data(CommonsMultipartFile upload_data) {
		this.upload_data = upload_data;
	}
	public String getRefuse() {
		return refuse;
	}
	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}
	public String getSrc_desc() {
		return src_desc;
	}
	public void setSrc_desc(String src_desc) {
		this.src_desc = src_desc;
	}
	public String getDel_desc() {
		return del_desc;
	}
	public void setDel_desc(String del_desc) {
		this.del_desc = del_desc;
	}
	public String getSrc_table() {
		return src_table;
	}
	public void setSrc_table(String src_table) {
		this.src_table = src_table;
	}
	public String getFail_yn() {
		return fail_yn;
	}
	public void setFail_yn(String fail_yn) {
		this.fail_yn = fail_yn;
	}
	public String getFax_file() {
		return fax_file;
	}
	public void setFax_file(String fax_file) {
		this.fax_file = fax_file;
	}
	public String getSend_date() {
		return send_date;
	}
	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}
	public String getRealtime_type() {
		return realtime_type;
	}
	public void setRealtime_type(String realtime_type) {
		this.realtime_type = realtime_type;
	}
	public String getRealtime_status() {
		return realtime_status;
	}
	public void setRealtime_status(String realtime_status) {
		this.realtime_status = realtime_status;
	}
	public String getRealtime_cnt() {
		return realtime_cnt;
	}
	public void setRealtime_cnt(String realtime_cnt) {
		this.realtime_cnt = realtime_cnt;
	}
	public String getAdd_content_yn() {
		return add_content_yn;
	}
	public void setAdd_content_yn(String add_content_yn) {
		this.add_content_yn = add_content_yn;
	}
	public String getAdd_content() {
		return add_content;
	}
	public void setAdd_content(String add_content) {
		this.add_content = add_content;
	}
	
	private String btch_key ="";
	private String version ="";
	private String total_count ="";
	private String file_size ="";
	private String data_field_info ="";
	private String rsv_dtm ="";
	private String mms_sbjt ="";
	private String msg_cd ="";
	private String cmpg_cd ="";
	private String msg ="";
	private String send_no ="";
	private String file_name ="";
	private String regdate ="";
	private String tran_status ="";
	private String tran_date ="";


	private int seq;
	private String link_field= "";
	private String link_auth_type ="";
	private String link_auth ="";
	private String link_limit ="";
	private String link_cnt ="";
	
	
	public String getBtch_key() {
		return btch_key;
	}
	public void setBtch_key(String btch_key) {
		this.btch_key = btch_key;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getTotal_count() {
		return total_count;
	}
	public void setTotal_count(String total_count) {
		this.total_count = total_count;
	}
	public String getFile_size() {
		return file_size;
	}
	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}
	public String getData_field_info() {
		return data_field_info;
	}
	public void setData_field_info(String data_field_info) {
		this.data_field_info = data_field_info;
	}
	public String getRsv_dtm() {
		return rsv_dtm;
	}
	public void setRsv_dtm(String rsv_dtm) {
		this.rsv_dtm = rsv_dtm;
	}
	public String getMms_sbjt() {
		return mms_sbjt;
	}
	public void setMms_sbjt(String mms_sbjt) {
		this.mms_sbjt = mms_sbjt;
	}
	public String getMsg_cd() {
		return msg_cd;
	}
	public void setMsg_cd(String msg_cd) {
		this.msg_cd = msg_cd;
	}
	public String getCmpg_cd() {
		return cmpg_cd;
	}
	public void setCmpg_cd(String cmpg_cd) {
		this.cmpg_cd = cmpg_cd;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getSend_no() {
		return send_no;
	}
	public void setSend_no(String send_no) {
		this.send_no = send_no;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTran_status() {
		return tran_status;
	}
	public void setTran_status(String tran_status) {
		this.tran_status = tran_status;
	}
	public String getTran_date() {
		return tran_date;
	}
	public void setTran_date(String tran_date) {
		this.tran_date = tran_date;
	}

	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getLink_field() {
		return link_field;
	}
	public void setLink_field(String link_field) {
		this.link_field = link_field;
	}
	public String getLink_auth_type() {
		return link_auth_type;
	}
	public void setLink_auth_type(String link_auth_type) {
		this.link_auth_type = link_auth_type;
	}
	public String getLink_auth() {
		return link_auth;
	}
	public void setLink_auth(String link_auth) {
		this.link_auth = link_auth;
	}
	public String getLink_limit() {
		return link_limit;
	}
	public void setLink_limit(String link_limit) {
		this.link_limit = link_limit;
	}
	public String getLink_cnt() {
		return link_cnt;
	}
	public void setLink_cnt(String link_cnt) {
		this.link_cnt = link_cnt;
	}
	
	
	
	
	
}
