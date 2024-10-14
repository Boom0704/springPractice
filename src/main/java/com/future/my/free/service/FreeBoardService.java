package com.future.my.free.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.free.dao.IFreeBoardDAO;
import com.future.my.free.vo.FreeBoardSearchVO;
import com.future.my.free.vo.FreeBoardVO;

@Service
public class FreeBoardService {
	
	@Autowired
	IFreeBoardDAO dao;
	
	public ArrayList<FreeBoardVO> getBoardList(FreeBoardSearchVO searchVO){
		// 전체 건수 조회
		int totalRowCount = dao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		// 검색 조건으로 검색된 전체 건수를 기준으로 세팅!
		searchVO.pageSetting();
		return dao.getBoardList(searchVO);
	}
	
	public void getTest(FreeBoardSearchVO searchVO){
		// 전체 건수 조회
		int totalRowCount = dao.getTotalRowCount(searchVO);
		System.out.println(totalRowCount);
		searchVO.pageSetting();
		System.out.println(searchVO);
	}
	
	public FreeBoardVO getBoard(int boNo) throws Exception {
		FreeBoardVO board = dao.getBoard(boNo);
		if(board == null) {
			throw new Exception();
		}
		// 조회수 증가
		dao.updateHit(boNo);
		
		// 조회수 증가한걸 다시 조회
		//board = dao.getBoard(boNo);
		return board;
	}
	
	public void insertFreeBoard(FreeBoardVO vo) throws Exception {
		int result = dao.insertFreeBoard(vo);
		if(result == 0) {
			throw new Exception();
		}
	}

}
