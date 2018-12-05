package egovframework.rte.cms.service;

import java.util.List;

import org.springframework.stereotype.Service;

@Service("tsmService")
public interface TsmService {


	/**
	 * 로그인체크
	 * @param vo(AIDX, PASSWD)
	 * @return
	 * @throws Exception
	 */
	TsmVO loginCheck(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 리스트 총 수
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return totalCount
	 * @throws Exception
	 */
	int msgStandardCnt(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 리스트 조회
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE
	 * @throws Exception
	 */
	List msgStandard(TsmVO vo) throws Exception;
	
	
	/**
	 * 메시지 규격 상세 조회
	 * @param vo
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE, MOD_DATE
	 * @throws Exception
	 */
	TsmVO msgStandardDetail(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 등록
	 * @param vo
	 * @throws Exception
	 */
	String msgStandardInsert(TsmVO vo) throws Exception;
	
	/**
	 * 배치 규격등록(일괄등록)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	String msgStandardInsertBatch(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 발송 순서 조회
	 * @param vo 
	 * @return AIDX, PRIORITY, T_REQ, REG_DATE
	 * @throws Exception
	 */
	TsmVO msgSendPriority(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 히스토리 등록
	 * @param vo
	 * @throws Exception
	 */
	String msgStandardInsertHistory(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 히스토리 수정
	 * @param vo
	 * @throws Exception
	 */
	void msgStandardUpdate(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 규격 삭제
	 * @param vo
	 * @throws Exception
	 */
	void msgStandardDelete(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 이력 수 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	int msgHistoryCnt(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 이력 수 2
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	int msgHistoryCnt2(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 이력관리리스트 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	List msgHistory(TsmVO vo) throws Exception;

	/**
	 * 메시지 이력관리 상세 
	 * @param vo PIDX
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	TsmVO msgHistoryDetail(TsmVO vo) throws Exception;	

	/**
	 * 메시지 기간별 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	List msgChart(TsmVO vo) throws Exception;
	
	
	/**
	 * 메시지 기간별 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	List msgChartDetail(TsmVO vo) throws Exception;
	
	
	
	/**
	 * 메시지 문구별 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	List msgCodeChart(TsmVO vo) throws Exception;
	
	/**
	 * 메시지 코드별 이력 통계 상세보기
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	List msgCodeChartDetail(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	List adminList(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 전체 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	int adminListCnt(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 상세 정보 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	TsmVO adminInfoDetail(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 상세 등록 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void agentInsert(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 상세 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void agentUpdate(TsmVO vo) throws Exception;
	
	/**
	 * 관리자 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void agentDelete(TsmVO vo) throws Exception;
	
	
	/**
	 * 수신거부 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	List<?> refuseList(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	int refuseListCnt(TsmVO vo) throws Exception;
	
	
	/**
	 * 수신거부 등록여부 확인
	 * @param vo (RECEIVE_NUM)
	 * @return	COUNT
	 * @throws Exception
	 */
	int checkRefuseNum(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 상세보기
	 * @param vo
	 * @throws Exception
	 */
	TsmVO refuseDetail(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 리스트 등록
	 * @param vo
	 * @throws Exception
	 */
	String refuseInsert(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 등록 히스토리
	 * @param vo
	 * @throws Exception
	 */
	void refuseInsertHistory(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 상세 수정
	 * @param vo
	 * @throws Exception
	 */
	void refuseModify(TsmVO vo) throws Exception;
	
	/**
	 * 수신거부 삭제
	 * @param vo
	 * @throws Exception
	 */
	void refuseDelete(TsmVO vo) throws Exception;
	
	
	/**
	 * 통계 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List msgChartGraph(TsmVO vo) throws Exception;
	
	/**
	 * 통계 상세 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List msgChartGraphDetail(TsmVO vo) throws Exception;
	
	/**
	 * 실시간 발송 현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List realTimeData(TsmVO vo) throws Exception;
	
	/**
	 * 실시간 발송 현황 TOTAL
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List realTimeDataTotal(TsmVO vo) throws Exception;
	
	/**
	 * 실시간 발송 현황 UMS
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	List realTimeDataUMS(TsmVO vo) throws Exception;
	
	/**
	 * 코드 중복값 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int isCodeCheck(TsmVO vo ) throws Exception;
	
	/**
	 * 자동응답관리 - 문의내역 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int callCenterHelpListCnt(TsmVO vo) throws Exception;
	List callCenterHelpList(TsmVO vo ) throws Exception;
	TsmVO callCenterHelpDetail(TsmVO vo ) throws Exception;
	void callCenterHelpUpdate(TsmVO vo ) throws Exception;
	
	/**
	 * 자동응답관리 - 시나리오답변관리 리스트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	int callCenterScenarioListCnt(TsmVO vo) throws Exception;
	List callCenterScenarioList(TsmVO vo ) throws Exception;
	List callCenterScenarioManageList(TsmVO vo ) throws Exception;
	TsmVO callCenterScenarioDetail(TsmVO vo ) throws Exception;
	String callCenterScenarioInsert(TsmVO vo ) throws Exception;
	void callCenterScenarioHistoryInsert(TsmVO vo) throws Exception;
	void callCenterScenarioUpdate(TsmVO vo ) throws Exception;
	void callCenterScenarioDelete(TsmVO vo ) throws Exception;
	
	/**
	 * 자동응답관리 - 자동응답통계 - 일간통계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	TsmVO callCenterDayStats(TsmVO vo ) throws Exception;
	
	/**
	 * 자동응답관리 - 자동응답통계 - 월간통계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	TsmVO callCenterMonthStats(TsmVO vo ) throws Exception;
	
	/**
	 * 문의한 사용자의 전화번호 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	TsmVO select_question_cuphone(TsmVO vo ) throws Exception;
	
	/**
	 * 메세지 전송
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	void insert_total(TsmVO vo) throws Exception;
	
	
	/**
	 * 캠페인 리스트 총 수
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return totalCount
	 * @throws Exception
	 */
	int campaignTotalCnt(TsmVO vo) throws Exception;
	
	/**
	 * 캠페인 리스트 조회
	 * @param vo ()
	 * @return SEQ, AIDX, SUBJECT, WRTDATE, LINK_LIMIT, LINK_CNT, USE_YN
	 * @throws Exception
	 */
	List campaignList(TsmVO vo) throws Exception;
	
	/**
	 * 캠페인  상세 조회
	 */
	TsmVO campaignDetail(TsmVO vo) throws Exception;
	
	

	int metaTotalCnt(TsmVO vo) throws Exception;
	List metaList(TsmVO vo) throws Exception;
	TsmVO metaDetail(TsmVO vo) throws Exception;
	List metaValidList(TsmVO vo) throws Exception;
	void metaValidUpdate(TsmVO vo) throws Exception;
	void metaTranUpdate(TsmVO vo) throws Exception;
	
}
