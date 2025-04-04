<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

<article>
    <h2> Cart List </h2>
    <form name="formm" method="post">
        <c:choose>
            <c:when test="${cartList.size() == 0}">
                <h3 style="color: red; text-align: center">장바구니가 비었습니다</h3>
            </c:when>
            <c:otherwise>
            <table id="cartList">
                <tr>
                    <th>상품명</th><th>수 량</th><th>가 격</th><th>주문일</th><th>삭 제</th>
                </tr>
                <c:forEach var="cart" items="${list}">
                <tr>
                    <td>
                        <a href="/product/productdetail?pseq=${cart.pseq}">
                            <h3> ${cart.pname} </h3>
                        </a>
                    </td>
                    <td> ${cart.quantity} </td>
                    <td>
                        <fmt:formatNumber value="${cart.price2*cart.quantity}" type="currency"/>
                    </td>
                    <td> <fmt:formatDate value="${cart.indate}" type="date"/> </td>
                    <td> <input type="checkbox" name="cseq" value= "${cart.cseq}"> </td>
                </tr>
                </c:forEach>

                <tr>
                    <th colspan="2"> 총 액 </th>
                    <th colspan="2">
                        <fmt:formatNumber value="${totalPrice}" type="currency"/><br>
                    </th>
                    <th><a href="#" onclick="go_cart_delete()"><h3>삭제하기</h3></a></th>
                </tr>
            </table>
            </c:otherwise>
        </c:choose>

        <div id="buttons" style="float: right">
            <input type="button" value="쇼핑 계속하기" class="cancel" onclick="location.href='/main'">
            <c:if test= "${cartList.size() != 0}">
                <input type="button" value="주문하기"  class="submit" onclick="go_order_insert()">
            </c:if>
        </div>
    </form>
</article>

<%@include file="../includes/footer.jsp"%>