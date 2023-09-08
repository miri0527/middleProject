<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<c:forEach items="${importantList}" var="importantList">
	<tr style="background-color: #fbfae1; text-align: center; line-height: 22.5px;">
		<td style="color : red;">[공지]</td>
		<td>
			<a class="title" href="./detail?num=${importantList.num}">${importantList.title}</a>
		</td>
		<td>${importantList.id}</td>
		<td>${importantList.regDate}</td>
		<td>${importantList.hit}</td>
	</tr>
</c:forEach>