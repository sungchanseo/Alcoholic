package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO{

	private static final Logger logger = LoggerFactory.getLogger(OrderDAOImpl.class);
	
	//DB연결을 위한 xml 객체 주입(의존성 주입)
	@Inject
	private SqlSession sqlSession;
	
	
	// mapper식별을 위한 NAMESPACE
	private static final String NAMESPACE ="com.itwillbs.mappers.orderMapper";

	// 발주목록 보기
	@Override
	public List<OrderVO> getOrderList() {
		logger.debug("@@@@@@@@@DAO 발주 목록을 조회합니다 @@@@@");
		return sqlSession.selectList(NAMESPACE+".getOrderList");
	}
    
    // 발주등록하기
	@Override
	public void orderInsert(OrderVO vo) {
	
		logger.debug("@@@@@@DAO 발주 등록해봅시다.... ㅠㅠ");
		sqlSession.insert(NAMESPACE+".orderInsert",vo);
		
	}

	// 발주수정하기 
	@Override
	public Integer modifyOrder(OrderVO vo) {
	
		return null;
	}

	// 발주번호 최대값
	@Override
	public String getMaxNumber() {
		String maxNumber = sqlSession.selectOne(NAMESPACE + ".getMaxNumber"); // 230620001
		logger.debug("############## maxNumber : " + maxNumber);
		return maxNumber;
	}
   // 발주번호 최대날짜
	@Override
	public String getMaxDate() {
		String maxDate = sqlSession.selectOne(NAMESPACE + ".getMaxDate"); // 230620
		logger.debug("############## maxDate : " + maxDate);
		return maxDate;
	}
   
	

}
