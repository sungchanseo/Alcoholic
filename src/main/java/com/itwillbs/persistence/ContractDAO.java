package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ContractVO;
import com.itwillbs.domain.PagingVO;
import com.itwillbs.domain.ProductionVO;

public interface ContractDAO {
	
	//수주 상세보기 
	public ContractVO readContractInfo(String cont_id) throws Exception;
	
	//수주 등록하기 
	public void insertContract(ContractVO cvo) throws Exception;
	
	//수주등록 번호 자동 카운트
	public String getLastGeneratedNumber() throws Exception;
	
	//수주 수정하기 
	public Integer updateContract(ContractVO cvo) throws Exception;
	
	//수주 삭제하기 
	public Integer deleteContract(String cont_id) throws Exception;
	
	//cont_id 를 out_product 테이블에 넣기 
	public void contIdInsert(String cont_id) throws Exception;
	
	//product_id로 상품정보 조회하기 
	public ProductionVO readProductInfo(String product_id) throws Exception;
	
	///////////////////페이징처리 서비스 ////////////////////////
	//전체 수주목록 갯수 계산하기 
	public int getListAll(PagingVO pvo) throws Exception; 
	
	//검색어 없을 때 페이징처리 수주목록 갯수 계산하기 
	public int getListPageSizeAll(PagingVO pvo) throws Exception;
	
	//검색어 있을 때 페이징처리 수주목록 갯수 계산하기 
	public int getListSearchAll(PagingVO pvo) throws Exception;
	
	//검색어 없을 때 페이징처리 수주목록 가져오기 
	public List<ContractVO> getListPageSizeObjectContractVO(PagingVO pvo) throws Exception;
	
	// 검색어 있을 때 페이징처리 수주목록 가져오기 
	public List<ContractVO> getListSearchObjectContractVO(PagingVO pvo) throws Exception;
	///////////////////페이징처리 서비스 ////////////////////////
}
