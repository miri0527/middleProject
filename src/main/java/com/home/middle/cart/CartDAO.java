package com.home.middle.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.middle.member.MemberDTO;
import com.home.middle.product.ProductDTO;
import com.home.middle.product.ProductOptionDTO;
import com.home.middle.util.Pager;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.home.middle.cart.CartDAO.";
	
	
	public Long getTotalCount(Pager pager) throws Exception {
		Long l= sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
		return l;
	}
	
	public CartDTO getPaymentCheck(CartDTO cartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getPaymentCheck", cartDTO);
	}
	public Long setCartOptionRef(Long optionNum) throws Exception{
	      return sqlSession.selectOne(NAMESPACE+"setCartOptionRef", optionNum);
	}
	public String setCartOptionName(Long optionNum) throws Exception{
	      return sqlSession.selectOne(NAMESPACE+"setCartOptionName", optionNum);
	}
	public List<CartDTO> getCartList(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectList(NAMESPACE + "getCartList", memberDTO);
	}
	
	public List<CartDTO> getMemberCartList(Pager pager) throws Exception {
		List<CartDTO> ar =  sqlSession.selectList(NAMESPACE + "getMemberCartList", pager);
		
		return ar;
	}
	
	
	public int setCartAdd(CartDTO cartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "setCartAdd", cartDTO);
	}
	
	public int setCartDelete(CartDTO cartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "setCartDelete", cartDTO);
	}
	
	public int setCartClear(CartDTO cartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE + "setCartClear", cartDTO);
	}
	
	public int setCartPayment(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setCartPayment", cartDTO);
	}
	public ProductOptionDTO getOptionDetail(CartDTO cartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getOptionDetail", cartDTO);
	}
	public int setOptionUpdate(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setOptionUpdate", cartDTO);
	}
	
	public int setCartPaymentCancel(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setCartPaymentCancel", cartDTO);
	}
	
	public CartDTO getCartPaymentDetail(CartDTO cartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getCartPaymentDetail", cartDTO);
	}
	public int getCartUpdate(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "getCartUpdate", cartDTO);
	}
	public List<CartDTO> getCartPaymentList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE + "getCartPaymentList", memberDTO);
	}
	
	public Long getPaymentNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE + "getPaymentNum");
	}
	
	public int setPaymentInsert(ProductPaymentDTO productPaymentDTO) throws Exception{
		return sqlSession.insert(NAMESPACE + "setPaymentInsert", productPaymentDTO);
	}
	
	public int setCartUpdate(CartDTO cartDTO) throws Exception{
		return sqlSession.update(NAMESPACE + "setCartUpdate", cartDTO);
	}
	
	
}
