package com.spring.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.spring.command.SearchCriteriaByPA;
import com.spring.command.SearchCriteriaByPro;
import com.spring.dto.PAVO;
import com.spring.dto.PIVO;
import com.spring.dto.PjmVO;
import com.spring.dto.ProEmpVO;
import com.spring.dto.ProLogVO;
import com.spring.dto.ProPjmVO;
import com.spring.dto.ProVO;
import com.spring.dto.RelegateVO;

public class ProDAOImpl implements ProDAO{

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public List<ProPjmVO> getlistProById(String empId) throws SQLException {
		List<ProPjmVO> pro = session.selectList("Pro-Mapper.getListProById", empId);
		return pro;
	}

	@Override
	public List<ProVO> getListDoProById(SearchCriteriaByPro cri) throws SQLException {
		
		List<ProVO> pro = session.selectList("Pro-Mapper.getListDoProById", cri);
		
		return pro;
	}
	
	
	@Override
	public List<ProVO> getListAopProById(SearchCriteriaByPro cri) throws SQLException {

		List<ProVO> pro = session.selectList("Pro-Mapper.getListAopProById", cri);
		
		return pro;
	}
	
	@Override
	public List<ProVO> getListNotProById(SearchCriteriaByPro cri) throws SQLException {

		List<ProVO> pro = session.selectList("Pro-Mapper.getListNotProById", cri);
		
		return pro;
	}
	
	
	@Override
	public void insertProject(ProVO pro) throws SQLException {
		session.update("Pro-Mapper.insertProject",pro);
		
	}
	
	
	@Override
	public void updateProject(ProVO pro) throws SQLException {
		session.update("Pro-Mapper.updateProject",pro);
		
	}
	
	
	@Override
	public void DoProject(String pCode) throws SQLException {
		session.update("Pro-Mapper.onProjectEnabled",pCode);
		
	}
	
	@Override
	public void notDoProject(String  pCode) throws SQLException {
		session.update("Pro-Mapper.updateProjectEnabled",pCode);
		
	}


	@Override
	public void insertPL(PjmVO pjm) throws SQLException {
		
		session.update("Pro-Mapper.insertPjmember",pjm);
		
	}


	@Override
	public String getPcode() throws SQLException {
		
		String pCode=session.selectOne("Pro-Mapper.getPcode");
		
		return pCode;
	}


	@Override
	public ProVO getProInfo(String  pCode) throws SQLException {
		
		ProVO proInfo = session.selectOne("Pro-Mapper.getProInfo", pCode);
		
		return proInfo;
	}

	@Override
	public void insertPA(PAVO pa) throws SQLException {
		session.update("PA-Mapper.insertPA",pa);
	}


	@Override
	public int getPASeqNextValue() throws SQLException {
		int pano = session.selectOne("PA-Mapper.selectPASeqNext");
		return pano;
	}

	@Override
	public List<PAVO> selectPACriteria(SearchCriteriaByPA cri) throws SQLException {
		
		int offset=cri.getStartRowNum();
		int limit=cri.getPerPageNum();
		RowBounds rowBounds=new RowBounds(offset,limit);
		
		List<PAVO> paList=
		   session.selectList("PA-Mapper.selectSearchPAList",cri,rowBounds);	
			
		return paList;
	}

	@Override
	public int selectPACriteriaTotalCount(SearchCriteriaByPA cri) throws SQLException {
		
		int count=session.selectOne("PA-Mapper.selectSearchPAListCount",cri);
		return count;
	}


	@Override
	public PAVO selectPAByPACode(String pacode) throws SQLException {
		PAVO pa = session.selectOne("PA-Mapper.selectPAByPACode",pacode);
		return pa;
	}

	@Override
	public void updatePA(PAVO pa) throws SQLException {
		session.update("PA-Mapper.updatePA",pa);
	}


	@Override
	public void deletePds(String pacode) throws SQLException {
		// TODO Auto-generated method stub
		session.update("PA-Mapper.deletePA", pacode);
	}


	@Override
	public List<ProEmpVO> selectProMemberList(String pCode) throws SQLException {
		
		
		 List<ProEmpVO> pjmList= session.selectList("Pro-Mapper.getProMemberList", pCode);
		
		return pjmList;
	}


	@Override
	public void insertRelegate(RelegateVO rlvo) throws SQLException {
		session.update("Pro-Mapper.insertRelegate", rlvo);
	}

	@Override
	public void insertMember(PjmVO pjm) throws SQLException {
		
		session.update("Pro-Mapper.insertPjm",pjm);
		
	}


	@Override
	public RelegateVO selectRelegate(String pCode) throws SQLException {
		RelegateVO relegate = session.selectOne("Pro-Mapper.selectRelegate", pCode);
		return relegate;
	}


	@Override
	public void deleteRelegate(String pCode) throws SQLException {
		session.update("Pro-Mapper.deleteRelegate",pCode);
	}


	@Override
	public void updateAu(PjmVO pjm) throws SQLException {
		
		session.update("Pro-Mapper.updateAu", pjm);
		
		
	}


	@Override
	public List<ProVO> getCompletionDateProList() throws SQLException {
		List<ProVO> cdList = session.selectList("Pro-Mapper.getCompletionDateProList");
		return cdList;
	}


	@Override
	public void updateService(ProVO pro) throws SQLException {
		
		session.update("Pro-Mapper.updateService", pro);
		
		
	}

	
	// 프로젝트 이슈
	@Override
	public List<PIVO> selectPIList(String pCode) throws SQLException{
		List<PIVO> piList = session.selectList("PI-Mapper.selectPIList",pCode);
		return piList;
	}
	@Override
	public List<Object> selectPIMileStoneList(String pCode) throws SQLException{
		List<Object> piMileStoneList = session.selectList("PI-Mapper.selectPIMileStoneList",pCode);
		return piMileStoneList;
	}
	
	@Override
	public PIVO selectPI(String piCode) throws SQLException{
		PIVO pi = session.selectOne("PI-Mapper.selectPI",piCode);
		return pi; 
	}
	
	@Override
	public void insertPI(PIVO pi) throws SQLException{
		session.update("PI-Mapper.insertPI", pi);
		
	}
	
	@Override
	public void updatePI(PIVO pi) throws SQLException{
		session.update("PI-Mapper.updatePI", pi);
	}
	
	@Override
	public void completePI(String piCode) throws SQLException{
		session.update("PI-Mapper.completePI", piCode);
	}


	@Override
	public void deletePI(String piCode) throws SQLException {
		session.update("PI-Mapper.deletePI",piCode);
	}


	@Override
	public void deleteMember(String empId) throws SQLException {
		
		session.update("Pro-Mapper.proDeleteMem", empId);
		
	}


	@Override
	public List<HashMap<String, Object>> getMainWorkByManager(String pCode) throws SQLException {
		return session.selectList("Pro-Mapper.selectMainWorkByManager", pCode);
	}
	@Override
	public List<HashMap<String, Object>> getMainWorkByCate(String pCode) throws SQLException {
		return session.selectList("Pro-Mapper.selectMainWorkByCate", pCode);
	}


	@Override
	public HashMap<String, Object> getTotalProgress(String pCode) throws SQLException {
		return session.selectOne("Pro-Mapper.selectTotalProgress", pCode);
	}

	@Override
	public void insertLog(Map<String, Object> log) throws SQLException {
		session.update("Pro-Mapper.insertLog",log);
	}


	@Override
	public List<ProLogVO> getLogList(String pCode) throws SQLException {
		return session.selectList("Pro-Mapper.selectLogList", pCode);
	}


	@Override
	public PjmVO projectPl(String pCode) throws SQLException {
		
		PjmVO pjm = session.selectOne("Pro-Mapper.projectPl", pCode);
		
		return pjm;
	}


	@Override
	public String selectPjmAuthById(PjmVO pjm) {
		String auth = session.selectOne("Pro-Mapper.selectPjmAuthById",pjm);
		return auth;
	}

}
