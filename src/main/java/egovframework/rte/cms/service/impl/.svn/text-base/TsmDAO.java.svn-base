package egovframework.rte.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("tsmDAO")
public class TsmDAO extends EgovAbstractDAO {

	/**
     * DB별 sqlMapClient 지정
     */
    @Resource(name = "sqlMapClient")
    public void setSuperSqlMapClient(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }
    
	/**
	 * 로그인체크
	 * @param vo(AIDX, PASSWD)
	 * @return
	 * @throws Exception
	 */
	public TsmVO loginCheck(TsmVO vo) throws Exception {
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.loginCheck", vo);
	}
	
	/**
	 * 메시지 규격 리스트 총 수
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return totalCount
	 * @throws Exception
	 */
	public int msgStandardCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.msgStandardCnt", vo);
	}
	
	/**
	 * 메시지 규격 리스트 조회
	 * @param vo (AIDX, CODE, CONTENT)
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE
	 * @throws Exception
	 */
	public List<?> msgStandard(TsmVO vo) throws Exception{
		return list("tsmDAO.msgStandard", vo);
	}
	
	/**
	 * 메시지 규격 상세 조회
	 * @param vo (PIDX, CODE)
	 * @return PIDX, AIDX, CODE, CONTENT, SUBJECT, REG_DATE, MOD_DATE
	 * @throws Exception
	 */
	public TsmVO msgStandardDetail(TsmVO vo) throws Exception{
		return (TsmVO)getSqlMapClientTemplate().queryForObject("tsmDAO.msgStandardDetail", vo);
	}
	
	/**
	 * 메시지 발송 순서 조회
	 * @param vo 
	 * @return AIDX, PRIORITY, T_REQ, REG_DATE
	 * @throws Exception
	 */
	public TsmVO msgSendPriority(TsmVO vo) throws Exception{
		return (TsmVO)getSqlMapClientTemplate().queryForObject("tsmDAO.msgSendPriority", vo);
	}
	
	/**
	 * 메시지 규격 상세 등록
	 * @param vo (PIDX, CODE)
	 * @throws Exception
	 */
	public String msgStandardInsert(TsmVO vo) throws Exception{
		return (String) insert("tsmDAO.msgStandardInsert", vo);
	}
	
	/**
	 * 메시지 규격 상세 등록
	 * @param vo (PIDX, CODE)
	 * @throws Exception
	 */
	public String msgStandardInsertBatch(TsmVO vo) throws Exception{
		return (String) insert("tsmDAO.msgStandardInsertBatch", vo);
	}
	
	/**
	 * 메시지 규격 상세 히스토리 조회
	 * @param vo (PIDX, CODE)
	 * @throws Exception
	 */
	public String msgStandardInsertHistory(TsmVO vo) throws Exception{
		return (String) insert("tsmDAO.msgStandardInsertHistory", vo);
	}
	
	/**
	 * 메시지 규격 히스토리 수정
	 * @param vo
	 * @throws Exception
	 */
	public void msgStandardUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.msgStandardUpdate", vo);
	}
	
	/**
	 * 메시지 규격 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void msgStandardDelete(TsmVO vo) throws Exception{
		delete("tsmDAO.msgStandardDelete", vo);
	}
	
	
	/**
	 * 메시지 이력 수 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	public int msgHistoryCnt(TsmVO vo) throws Exception{
		return (Integer) getSqlMapClientTemplate().queryForObject("tsmDAO.msgHistoryCnt", vo);
	}
	
	/**
	 * 메시지 이력 수2 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  CNT
	 * @throws Exception
	 */
	public int msgHistoryCnt2(TsmVO vo) throws Exception{
		return (Integer) getSqlMapClientTemplate().queryForObject("tsmDAO.msgHistoryCnt2", vo);
	}
	
	/**
	 * 메시지 이력관리리스트 
	 * @param vo SENDER, RECEIVE_NUM, MTYPE, SEND_TYPE, REPORT_DATE
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	public List<?> msgHistory(TsmVO vo) throws Exception{
		return list("tsmDAO.msgHistory", vo);
	}
	
	/**
	 * 메시지 이력관리 상세 
	 * @param vo PIDX
	 * @return  PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
	 * @throws Exception
	 */
	public TsmVO msgHistoryDetail(TsmVO vo) throws Exception{
		return (TsmVO)getSqlMapClientTemplate().queryForObject("tsmDAO.msgHistoryDetail", vo);
	}

	/**
	 * 메시지 이력 통계-발송자 별
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgChart(TsmVO vo) throws Exception{
		return list("tsmDAO.msgChart", vo);
	}
	
	
	/**
	 * 메시지 기간별 이력 통계-발송자 별 상세보기
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgChartDetail(TsmVO vo) throws Exception{
		return list("tsmDAO.msgChartDetail", vo);
	}
	
	/**
	 * 메시지 코드별 이력 통계
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgCodeChart(TsmVO vo) throws Exception{
		return list("tsmDAO.msgCodeChart", vo);
	}
	
	/**
	 * 메시지 코드별 이력 통계 상세보기
	 * @param vo START_DATE, LAST_DATE
	 * @return  SENDER, N_SUCC, N_FAIL, A_SUCC, A_FAIL, S_SUCC, S_FAIL
	 * @throws Exception
	 */
	public List<?> msgCodeChartDetail(TsmVO vo) throws Exception{
		return list("tsmDAO.msgCodeChartDetail", vo);
	}
	
	
	/**
	 * 관리자 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public List<?> adminList(TsmVO vo) throws Exception{
		return list("tsmDAO.adminInfo", vo);
	}
	
	/**
	 * 관리자 전체 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public int adminListCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.adminInfoCnt", vo);
	}
	
	
	/**
	 * 관리자 상세 정보 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TsmVO adminInfoDetail(TsmVO vo) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.adminInfoDetail", vo);
	}
	
	/**
	 * 관리자 상세 등록 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentInsert(TsmVO vo) throws Exception{
		insert("tsmDAO.agentInsert", vo);
	}
	
	/**
	 * 관리자 상세 수정
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.agentUpdate", vo);
	}
	
	/**
	 * 관리자 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void agentDelete(TsmVO vo) throws Exception{
		update("tsmDAO.agentDelete", vo);
	}
	
	
	/**
	 * 수신거부 리스트 
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public List<?> refuseList(TsmVO vo) throws Exception{
		return list("tsmDAO.refuseList", vo);
	}
	
	/**
	 * 수신거부 수
	 * @param vo 
	 * @return  
	 * @throws Exception
	 */
	public int refuseListCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.refuseListCnt", vo);
	}
	
	/**
	 * 수신거부 등록여부 확인
	 * @param vo (RECEIVE_NUM)
	 * @return	COUNT
	 * @throws Exception
	 */
	public int checkRefuseNum(TsmVO vo ) throws Exception{
		return (Integer) getSqlMapClientTemplate().queryForObject("tsmDAO.checkRefuseNum", vo);
	}
	
	/**
	 * 수신거부 리스트 상세보기
	 * @param vo
	 * @throws Exception
	 */
	public TsmVO refuseDetail(TsmVO vo) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.refuseDetail", vo);
	}
	
	/**
	 * 수신거부 리스트 등록
	 * @param vo
	 * @throws Exception
	 */
	public String refuseInsert(TsmVO vo) throws Exception{
		return (String) insert("tsmDAO.refuseInsert", vo);
	}
	
	/**
	 * 수신거부 등록 히스토리
	 * @param vo
	 * @throws Exception
	 */
	public void refuseInsertHistory(TsmVO vo) throws Exception{
		insert("tsmDAO.refuseInsertHistory", vo);
	}
	
	/**
	 * 수신거부 상세 수정
	 * @param vo
	 * @throws Exception
	 */
	public void refuseModify(TsmVO vo) throws Exception{
		update("tsmDAO.refuseModify",vo);
	}
	
	/**
	 * 수신거부 삭제
	 * @param vo
	 * @throws Exception
	 */
	public void refuseDelete(TsmVO vo) throws Exception{
		update("tsmDAO.refuseDelete", vo);
	}
	
	/**
	 * 통계 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List msgChartGraph(TsmVO vo) throws Exception{
		return list("tsmDAO.msgChartGraph", vo);
	}
	
	/**
	 * 통계 상세 그래프 표시 - 실패 이력
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List msgChartGraphDetail(TsmVO vo) throws Exception{
		return list("tsmDAO.msgChartGraphDetail", vo);
	}
	
	/**
	 * 실시간 발송 현황
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List realTimeData(TsmVO vo) throws Exception{
		return list("tsmDAO.realTimeData", vo);
	}
	
	/**
	 * 실시간 발송 현황 TOTAL
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List realTimeDataTotal(TsmVO vo) throws Exception{
		return list("tsmDAO.realTimeDataTotal", vo);
	}
	
	/**
	 * 실시간 발송 현황 UMS
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List realTimeDataUMS(TsmVO vo) throws Exception{
		return list("tsmDAO.realTimeDataUMS", vo);
	}
	
	/**
	 * 코드 중복값 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int isCodeCheck(TsmVO vo ) throws Exception{
		return (Integer) getSqlMapClientTemplate().queryForObject("tsmDAO.isCodeCheck", vo);
	}
	
	/**
	 * 자동응답관리 - 문의내역 리스트
	 * @param vo
	 * @return totalCount
	 * @throws Exception
	 */
	public int callCenterHelpListCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterHelpListCnt", vo);
	}
	public List callCenterHelpList(TsmVO vo ) throws Exception{
		return list("tsmDAO.callCenterHelpList", vo);
	}
	public TsmVO callCenterHelpDetail(TsmVO vo ) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterHelpDetail", vo);
	}
	public void callCenterHelpUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.callCenterHelpUpdate", vo);
	}
	
	/**
	 * 자동응답관리 - 시나리오 답변관리
	 * @param vo
	 * @throws Exception
	 */
	public int callCenterScenarioListCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterScenarioListCnt", vo);
	}
	public List callCenterScenarioList(TsmVO vo ) throws Exception{
		return list("tsmDAO.callCenterScenarioList", vo);
	}
	public List callCenterScenarioManageList(TsmVO vo ) throws Exception{
		return list("tsmDAO.callCenterScenarioManageList", vo);
	}
	public TsmVO callCenterScenarioDetail(TsmVO vo ) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterScenarioDetail", vo);
	}
	public String callCenterScenarioInsert(TsmVO vo) throws Exception{
		return (String) insert("tsmDAO.callCenterScenarioInsert", vo);
	}
	public void callCenterScenarioHistoryInsert(TsmVO vo) throws Exception{
		update("tsmDAO.callCenterScenarioHistoryInsert", vo);
	}
	public void callCenterScenarioUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.callCenterScenarioUpdate", vo);
	}
	public void callCenterScenarioDelete(TsmVO vo) throws Exception{
		update("tsmDAO.callCenterScenarioDelete", vo);
	}
	
	/**
	 * 자동응답관리 - 자동응답통계
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TsmVO callCenterDayStats(TsmVO vo ) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterDayStats", vo);
	}
	public TsmVO callCenterMonthStats(TsmVO vo ) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.callCenterMonthStats", vo);
	}
	
	/**
	 * 문의한 사용자의 전화번호 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TsmVO select_question_cuphone(TsmVO vo ) throws Exception{
		return (TsmVO) getSqlMapClientTemplate().queryForObject("tsmDAO.select_question_cuphone", vo);
	}
	
	/**
	 * 메세지 전송
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public void insert_total(TsmVO vo) throws Exception{
		update("tsmDAO.insert_total", vo);
	}
	
	/**
	 * 캠페인 리스트 총 수
	 */
	public int campaignTotalCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.campaignTotalCnt", vo);
	}
	
	/**
	 * 캠페인 리스트 조회
	 */
	public List<?> campaignList(TsmVO vo) throws Exception{
		return list("tsmDAO.campaignList", vo);
	}
	
	/**
	 * 캠페인 상세 조회
	 */
	public TsmVO campaignDetail(TsmVO vo) throws Exception{
		return (TsmVO)getSqlMapClientTemplate().queryForObject("tsmDAO.campaignDetail", vo);
	}
	
	
	/*
	 * cgkang add 2017.12.11
	 */
	
	public int metaTotalCnt(TsmVO vo) throws Exception{
		return (Integer)getSqlMapClientTemplate().queryForObject("tsmDAO.metaTotalCnt", vo);
	}
	
	public List<?> metaList(TsmVO vo) throws Exception{
		return list("tsmDAO.metaList", vo);
	}
	
	public TsmVO metaDetail(TsmVO vo) throws Exception{
		return (TsmVO)getSqlMapClientTemplate().queryForObject("tsmDAO.metaDetail", vo);
	}
	
	public List<?> metaValidList(TsmVO vo) throws Exception{
		return list("tsmDAO.metaValidList", vo);
	}
	
	public void metaValidUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.metaValidUpdate", vo);
	}
	
	public void metaTranUpdate(TsmVO vo) throws Exception{
		update("tsmDAO.metaTranUpdate", vo);
	}
	
}
