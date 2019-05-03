<%@ page contentType="text/html; charset=euc-kr"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>판매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetUserList(currentPage) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<form name="detailForm" action="/purchase/listSalePurchase" method="post">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">거래중 목록조회</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="13">전체 ${resultPage.totalCount} 건수, 현재
						${resultPage.currentPage} 페이지</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="7%">거래번호</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="15%">제품명</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="10%">가격</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="7%">회원ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="25%">배송주소</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="15%">배송요청사항</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b"width="20%">물품현황</td>
					<td class="ct_line02"></td>
				</tr>
				<tr>
					<td colspan="13" bgcolor="808285" height="1"></td>
				</tr>

			<c:forEach var="i" items="${list}">
				<tr class="ct_list_pop">
					<td align="center"><a href="/purchase/getPurchase?tranNo=${i.tranNo}">${i.tranNo}</a>
					</td>
					<td></td>
					<td align="left">${i.purchaseProd.prodName}</td>
					<td></td>
					<td align="left">${i.purchaseProd.price}</td>
					<td></td>
					<td align="left"><a href="/user/getUser?userId=${i.buyer.userId}">${i.buyer.userId}</a>
					</td>
					<td></td>
					<td align="left">
					${i.divyAddr}</td>
					<td></td>
					<td align="left">
					${i.divyRequest}</td>
					<td></td>
					<td align="left">
					<c:if test="${i.tranCode=='1  ' }">
						구매완료 <a href="/purchase/updateTranCode?tranNo=${i.tranNo}&tranCode=2">배송하기</a>
						<a href="/purchase/updateTranCode?tranNo=${i.tranNo}&tranCode=4">거래취소</a>
					</c:if>
					 <c:if test="${i.tranCode=='2  ' }">
					배송중
					</c:if> 
					<c:if test="${i.tranCode=='3  ' }">
					배송완료 
					</c:if>
					<c:if test="${i.tranCode=='4  ' }">
						주문취소됨
					</c:if>
					</td>	
					
					</tr>
					<tr>
						<td colspan="13" bgcolor="D6D7D6" height="1"></td>
					</tr>
			</c:forEach>
					
			</table>
					
			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" /><jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>
<!-- PageNavigation End... -->

</form>
</div>

</body>
</html>