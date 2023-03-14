package com.home.middle.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.home.middle.util.Pager;


@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.home.middle.product.ProductDAO.";
	
	public Long getProductNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getProductNum");
	}
	
	public List<ProductDTO> getProductList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getProductList",pager);
	}
	
//	public Long getProductCount(Pager pager) throws Exception {
//		return sqlSession.selectOne(NAMESPACE+"getProductCount");
//	}
	
	
}
