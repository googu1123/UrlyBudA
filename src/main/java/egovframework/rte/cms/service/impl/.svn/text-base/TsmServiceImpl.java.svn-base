package egovframework.rte.cms.service.impl;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.cms.service.TsmService;
import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

@Service("tsmService")
public class TsmServiceImpl extends AbstractServiceImpl implements TsmService {
	
	/** MainDAO */
    @Resource(name="tsmDAO")
    private TsmDAO tsmDAO;
    
    /** OtherDAO */
    @Resource(name="otherDAO")
    private OtherDao otherDAO;
    
    /** ID Generation */
    @Resource(name="egovIdGnrService")    
    private EgovIdGnrService egovIdGnrService;

    
    /**
	 * 로그인체크
	 * @param vo(AIDX, PASSWD)
	 * @return
	 * @throws Exception
	 */
    public TsmVO loginCheck(TsmVO vo) throws Exception {
		return tsmDAO.loginCheck(vo);
	}
    
    /**
	 * 메시지 규격 리스트 총 수
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return totalCount
	 * @throws Exception
	 */
	public int msgStandardCnt(TsmVO vo) throws Exception{
		return tsmDAO.msgStandardCnt(vo);
	}
    
    /**
	 * 메시지 규격 리스트 조회
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE
	 * @throws Exception
	 */
	public List<?> msgStandard(TsmVO vo) throws Exception{
		return tsmDAO.msgStandard(vo);
	}
	
	/**
	 * 메시지 규격 상세 조회
	 * @param vo
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE, MOD_DATE
	 * @throws Exception
	 */
	public TsmVO msgStandardDetail(TsmVO vo) throws Exception{
		return tsmDAO.msgStandardDetail(vo);
	}
	
	/**
	 * 메시지 규격 등록
	 * @param vo
	 * @throws Exception
	 */
	public String msgStandardInsert(TsmVO vo) throws Exception{
		return tsmDAO.msgStandardInsert(vo);
	}
	
	/**
	 * 메시지 규격 등록(일괄)
	 * @param vo
	 * @throws Exception
	 */
	public String msgStandardInsertBatch(TsmVO vo) throws Exception{
		return tsmDAO.msgStandardInsertBatch(vo);
	}
	
	
	/**
	 * 메시지 규격 히스토리 수정
	 * @param vo
	 * @throws Exception
	 */
	public void msgStandardUpdate(TsmVO vo) throws Exception{
		tsmDAO.msgStandardUpdate(vo);
	}
	
	/**
	 * 메시지 규격 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void msgStandardDelete(TsmVO vo) throws Exception{
		tsmDAO.msgStandardDelete(vo);
	}
	
	/**
	 * 메시지 발송 순서 조회
	 * @param vo 
	 * @return AIDX, PRIORITY, T_REQ, REG_DATE
	 * @throws Exception
	 */
	public TsmVO msgSendPriority(TsmVO vo) throws Exception{
		return tsmDAO.msgSendPriority(vo);
	}
	
	/**
	 * 메시지 규격 히스토리 등록
	 * @param vo
	 * @throws Exception
	 */
	public String msgStandardInsertHistory(TsmVO vo) throws Exception{
		return tsmDAO.msgStandardInsertHistory(vo);
	}

	/**
	 * 메시지 이력 수 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	public int msgHistoryCnt(TsmVO vo) throws Exception{
		return tsmDAO.msgHistoryCnt(vo);
	}
	
	/**
	 * 메시지 이력관리리스트 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	public List<?> msgHistory(TsmVO vo) throws Exception{
		return tsmDAO.msgHistory(vo);
	}
	
	/**
	 * 메시지 이력관리 상세 
	 * @param vo PIDX
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	public TsmVO msgHistoryDetail(TsmVO vo) throws Exception{
		return tsmDAO.msgHistoryDetail(vo);
	}
	
	/**
	 * 메시지 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgChart(TsmVO vo) throws Exception{
		return tsmDAO.msgChart(vo);
	}
	
	/**
	 * 메시지 기간별 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgChartDetail(TsmVO vo) throws Exception{
		return tsmDAO.msgChartDetail(vo);
	}
	
	/**
	 * 메시지 문구별 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgCodeChart(TsmVO vo) throws Exception{
		return tsmDAO.msgCodeChart(vo);
	}
	
	/**
	 * 메시지 코드별 이력 통계 상세보기
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgCodeChartDetail(TsmVO vo) throws Exception{
		return tsmDAO.msgCodeChartDetail(vo);
	}
	
	
	/**
	 * 관리자 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public List<?> adminList(TsmVO vo) throws Exception{
		return tsmDAO.adminList(vo);
	}
	
	/**
	 * 관리자 전체 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public int adminListCnt(TsmVO vo) throws Exception{	
		return tsmDAO.adminListCnt(vo);
	}
	
	/**
	 * 관리자 상세 정보 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TsmVO adminInfoDetail(TsmVO vo) throws Exception{
		return tsmDAO.adminInfoDetail(vo);
	}
	
	/**
	 * 관리자 상세 등록 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentInsert(TsmVO vo) throws Exception{
		tsmDAO.agentInsert(vo);
	}
	
	/**
	 * 관리자 상세 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentUpdate(TsmVO vo) throws Exception{
		tsmDAO.agentUpdate(vo);
	}
	
	/**
	 * 관리자 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentDelete(TsmVO vo) throws Exception{
		tsmDAO.agentDelete(vo);
	}
	
	
	/**
	 * 수신거부 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public List<?> refuseList(TsmVO vo) throws Exception{
		return tsmDAO.refuseList(vo);
	}
	
	/**
	 * 수신거부 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public int refuseListCnt(TsmVO vo) throws Exception{
		return tsmDAO.refuseListCnt(vo);
	}
	
	/**
	 * 수신거부 등록여부 확인
	 * @param vo (RECEIVE_NUM)
	 * @return	COUNT
	 * @throws Exception
	 */
	public int checkRefuseNum(TsmVO vo ) throws Exception{
		return tsmDAO.checkRefuseNum(vo);
	}
	
	/**
	 * 수신거부 리스트 상세보기
	 * @param vo
	 * @throws Exception
	 */
	public TsmVO refuseDetail(TsmVO vo) throws Exception{
		return tsmDAO.refuseDetail(vo);
	}
	
	
	/**
	 * 수신거부 리스트 등록
	 * @param vo
	 * @throws Exception
	 */
	public String refuseInsert(TsmVO vo) throws Exception{
		return tsmDAO.refuseInsert(vo);
	}
	
	/**
	 * 수신거부 등록 히스토리
	 * @param vo
	 * @throws Exception
	 */
	public void refuseInsertHistory(TsmVO vo) throws Exception{
		tsmDAO.refuseInsertHistory(vo);
	}
	
	/**
	 * 수신거부 상세 수정
	 * @param vo
	 * @throws Exception
	 */
	public void refuseModify(TsmVO vo) throws Exception{
		tsmDAO.refuseModify(vo);
	}
	
	/**
	 * 수신거부 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void refuseDelete(TsmVO vo) throws Exception{
		tsmDAO.refuseDelete(vo);
	}
	
	/**
	 * 통계 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List msgChartGraph(TsmVO vo) throws Exception{
		return tsmDAO.msgChartGraph(vo);
	}
	
	/**
	 * 통계 상세 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List msgChartGraphDetail(TsmVO vo) throws Exception{
		return tsmDAO.msgChartGraphDetail(vo);
	}
	
	/**
	 * 코드 중복값 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int isCodeCheck(TsmVO vo ) throws Exception{
		return tsmDAO.isCodeCheck(vo);
	}

	/**
	 * 메시지 이력 수2
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	@Override
	public int msgHistoryCnt2(TsmVO vo) throws Exception {
		return tsmDAO.msgHistoryCnt2(vo);
	}

	/**
	 * 실시간 발송 현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public List realTimeData(TsmVO vo) throws Exception {
		return tsmDAO.realTimeData(vo);
	}

	/**
	 * 실시간 발송 현황 TOTAL
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public List realTimeDataTotal(TsmVO vo) throws Exception {
		return tsmDAO.realTimeDataTotal(vo);
	}

	/**
	 * 실시간 발송 현황 UMS
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@Override
	public List realTimeDataUMS(TsmVO vo) throws Exception {
		return otherDAO.realTimeDataUMS(vo);
	}

	@Override
	public int callCenterHelpListCnt(TsmVO vo) throws Exception{
		return tsmDAO.callCenterHelpListCnt(vo);
	}
	@Override
	public List callCenterHelpList(TsmVO vo) throws Exception {
		return tsmDAO.callCenterHelpList(vo);
	}
	@Override
	public TsmVO callCenterHelpDetail(TsmVO vo) throws Exception {
		return tsmDAO.callCenterHelpDetail(vo);
	}
	@Override
	public void callCenterHelpUpdate(TsmVO vo) throws Exception {
		tsmDAO.callCenterHelpUpdate(vo);
	}
	
	@Override
	public int callCenterScenarioListCnt(TsmVO vo) throws Exception{
		return tsmDAO.callCenterScenarioListCnt(vo);
	}
	@Override
	public List callCenterScenarioList(TsmVO vo ) throws Exception{
		return tsmDAO.callCenterScenarioList(vo);
	}
	@Override
	public List callCenterScenarioManageList(TsmVO vo ) throws Exception{
		return tsmDAO.callCenterScenarioManageList(vo);
	}
	@Override
	public TsmVO callCenterScenarioDetail(TsmVO vo ) throws Exception{
		return tsmDAO.callCenterScenarioDetail(vo);
	}
	@Override
	public String callCenterScenarioInsert(TsmVO vo) throws Exception{
		return tsmDAO.callCenterScenarioInsert(vo);
	}
	@Override
	public void callCenterScenarioHistoryInsert(TsmVO vo) throws Exception{
		tsmDAO.callCenterScenarioHistoryInsert(vo);
	}
	@Override
	public void callCenterScenarioUpdate(TsmVO vo) throws Exception{
		tsmDAO.callCenterScenarioUpdate(vo);
	}
	@Override
	public void callCenterScenarioDelete(TsmVO vo) throws Exception{
		tsmDAO.callCenterScenarioDelete(vo);
	}
	
	@Override
	public TsmVO callCenterDayStats(TsmVO vo) throws Exception {
		return tsmDAO.callCenterDayStats(vo);
	}
	@Override
	public TsmVO callCenterMonthStats(TsmVO vo) throws Exception {
		return tsmDAO.callCenterMonthStats(vo);
	}
	
	@Override
	public TsmVO select_question_cuphone(TsmVO vo ) throws Exception{
		return tsmDAO.select_question_cuphone(vo);
	}
	
	@Override
	public void insert_total(TsmVO vo) throws Exception{
		tsmDAO.insert_total(vo);
	}
	
	/**
	 * 캠페인 리스트 총 카운
	 */
	public int campaignTotalCnt(TsmVO vo) throws Exception{
		return tsmDAO.campaignTotalCnt(vo);
	}
	
	/**
	 * 캠페인 리스트 조회
	 */
	public List<?> campaignList(TsmVO vo) throws Exception{
		return tsmDAO.campaignList(vo);
	}
	
	/**
	 * 캠페인  상세 조회
	 */
	public TsmVO campaignDetail(TsmVO vo) throws Exception{
		return tsmDAO.campaignDetail(vo);
	}
	
	
	
	
	
	
	
	public int metaTotalCnt(TsmVO vo) throws Exception{
		return tsmDAO.metaTotalCnt(vo);
	}
	
	public List<?> metaList(TsmVO vo) throws Exception{
		return tsmDAO.metaList(vo);
	}
	
	public TsmVO metaDetail(TsmVO vo) throws Exception{
		return tsmDAO.metaDetail(vo);
	}
	
	
	public List<?>  metaValidList(TsmVO vo) throws Exception{
		return tsmDAO.metaValidList(vo);
	}
	
	public void metaValidUpdate(TsmVO vo) throws Exception{
		tsmDAO.metaValidUpdate(vo);
	}
	
	public void metaTranUpdate(TsmVO vo) throws Exception{
		tsmDAO.metaTranUpdate(vo);
	}
	
}

