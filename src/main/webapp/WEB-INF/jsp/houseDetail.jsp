<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<h1>資料總表</h1>
	<div class="row">
	  <div class="col-sm-1 mb-3" style="width: 12%">
	    <div class="card text-center border-success">
			<div class="card-header">
				<h5>查詢筆數</h5>
			</div>
			<div class="card-body text-success fw-bold">
				<p class="card-text">${buildListSize}</p>
			</div>
	    </div>
	  </div>
	  <c:if test="${not empty searchBuildForm.hsnNm}">
		  <div class="col-sm-1 mb-3" style="width: 12%">
		    <div class="card text-center border-success">
				<div class="card-header">
					<h5>城市</h5>
				</div>
				<div class="card-body text-success fw-bold">
					<p class="card-text">${searchBuildForm.hsnNm}</p>
				</div>
		    </div>
		  </div>
	  </c:if>
	  <c:if test="${not empty searchBuildForm.townNm}">
		  <div class="col-sm-1 mb-3" style="width: 12%">
		    <div class="card text-center border-success">
				<div class="card-header">
					<h5>鄉/鎮/區</h5>
				</div>
				<div class="card-body text-success fw-bold">
					<p class="card-text">${searchBuildForm.townNm}</p>
				</div>
		    </div>
		  </div>
	  </c:if>
	</div>
	<table 
		data-toggle="table" 
		data-pagination="true" 
		data-page-list="[10, 25, 50, 100, all]"
		data-sortable="true"
		data-sort-class="table-active"
		>
      <thead>
        <tr>
          <th data-sortable="true">年</th>
          <th data-sortable="true">交易日期</th>
          <th data-sortable="true">縣/市</th>
          <th data-sortable="true">區</th>
          <th data-sortable="true">門牌</th>
          <th data-sortable="true">建築型態</th>
          <th data-sortable="true">交易標的</th>
          <th data-sortable="true">交易筆棟數</th>
          <th data-sortable="true">單價<br/>(萬元/坪)</th>
          <th data-sortable="true">建物坪數<br/>(坪)</th>
          <th data-sortable="true">總價<br/>(萬元)</th>
          <th data-sortable="true">屋齡</th>
          <th data-sortable="true">備註</th>
        </tr>
      </thead>
      <tbody>
		<c:forEach items="${buildList}" var="build" begin="0" end="20">
	        <tr>
	          <td>${build[0]}</td>
	          <td>${build[1]}</td>
	          <td>${build[2]}</td>
	          <td>${build[3]}</td>
	          <td>${build[4]}</td>
	          <td>${build[5]}</td>
	          <td>${build[6]}</td>
	          <td>${build[7]}</td>
	          <td>${build[8]}</td>
	          <td>${build[9]}</td>
	          <td>${build[10]}</td>
	          <td>${build[11]}</td>
	          <td>${build[12]}</td>
	        </tr>
		</c:forEach>
      </tbody>
    </table>
</div>

<%@ include file="common/footer.jspf" %>
