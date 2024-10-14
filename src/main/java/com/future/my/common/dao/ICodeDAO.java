package com.future.my.common.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.future.my.common.vo.CodeVO;

// 인터페이스를 만들면 꼭 @Mapper 해줘야함
@Mapper
public interface ICodeDAO {
	
	public ArrayList<CodeVO> getCodeList(String commParent);
	
	public int addCode(CodeVO vo);
	
	public int deleteCode(String commCd);

}
