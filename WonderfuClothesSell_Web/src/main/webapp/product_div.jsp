<%@page import="com.wcs.entity.Product"%>
<%@page import="com.wcs.service.ProductService" %>
<%@ page pageEncoding="UTF-8"%>
<%--TODO考慮放header --%>
<%--這裡的css是用來控制product_data的，用在產品id查詢的ajax中 --%>
<style>
	#theProductPhoto{

		height: 300px;
		background-position: 50%;
		background-size: cover;
		border-radius: 10px 10px 0px 0px;
		
	}
</style>

<!-- <a href='/wcs/member/cart.jsp'>購物車</a> -->
<!-- <span style='float:right' class='cartQuantitySpan' >  -->
<%-- 	${empty sessionScope.cart?"":String.format("(%d)",sessionScope.cart.totalQuantity)} --%>
<!-- </span>  -->
<%@include file='/subviews/product_data.jsp' %>
