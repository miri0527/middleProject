package com.home.middle.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.middle.product.ProductDTO;
import com.home.middle.util.Pager;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.home.middle.member.MemberDAO.";
	
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}
	
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberJoin",memberDTO);
	}
	
	public List<MemberDTO> getMemberList(Pager pager) throws Exception {
		List<MemberDTO> ar = sqlSession.selectList(NAMESPACE + "getMemberList", pager);
		return ar;
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO) throws Exception{
		
		memberDTO = sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
		return memberDTO;
	}
	public int setMemberUpdate(MemberDTO memberDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	public List<String> getMemberIdFind(String email)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getMemberIdFind", email);
	}
	public int setMemberPwChange(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberPwChange", memberDTO);
	}
	
	public int setAdminMemberUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setAdminMemberUpdate", memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setMemberDelete", memberDTO);
	}
	public int setMemberAuto(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setMemberAuto", memberDTO);
	}
	
	public int setSellerApprove(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setSellerApprove", memberDTO);
	}
	
	public int setSellerRefuse(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setSellerRefuse", memberDTO);
	}
}
