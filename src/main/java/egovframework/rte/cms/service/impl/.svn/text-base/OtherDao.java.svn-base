package egovframework.rte.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import egovframework.rte.cms.service.TsmVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;


@Repository("otherDAO")
public class OtherDao extends EgovAbstractDAO {
    /**
     * DB별 sqlMapClient 지정
     */
    @Resource(name = "sqlMapClient2")
    public void setSuperSqlMapClient2(SqlMapClient sqlMapClient) {
        super.setSuperSqlMapClient(sqlMapClient);
    }
    
    /**
	 * 실시간 발송 현황 UMS
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List realTimeDataUMS(TsmVO vo) throws Exception{
		return list("umsDAO.realTimeDataUMS", vo);
	}
}
