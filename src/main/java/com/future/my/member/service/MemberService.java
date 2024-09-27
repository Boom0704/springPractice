package com.future.my.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.future.my.member.dao.IMemberDAO;
import com.future.my.member.vo.MemberVO;;

/**
 * @author 202-26
 *
 */
@Service
public class MemberService {
	
	@Autowired
	IMemberDAO dao;

	public void registMember(MemberVO vo) throws Exception {
		int result = dao.registMember(vo);
		if(result == 0) {
			throw new Exception();
		}
	}
	
	public MemberVO loginMember(MemberVO vo) throws Exception {
		MemberVO user = dao.loginMember(vo);
		if(user==null) {
			throw new Exception();
		}
		return user;
	}

}
