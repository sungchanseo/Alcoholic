package com.itwillbs.persistence;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderVO;

@Repository
public interface OrderDAO {

	// 발주 목록보기
	public List<OrderVO> getOrderList();
	
	// 발주 등록하기
	public void orderInsert(OrderVO vo);
	
	// 발주 수정하기
	public Integer modifyOrder(OrderVO vo);
	
	// 발주번호 최대값 (maxNumber) 230620004
	public String getMaxNumber();
	
	// 발주번호 최대날짜 (maxDate) 230620
	public String getMaxDate();
}
