<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	
	<!-- 刪除彈跳視窗 -->
	<input id="deleteCommunityUUID" type="hidden" />
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">刪除社區</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	刪除社區，會連帶刪除社區路段資料，請問有確定刪除嗎?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
	        <button id="deleteBtnConfirm" type="button" class="btn btn-danger" data-bs-dismiss="modal">確定刪除</button>
	      </div>
	    </div>
	  </div>
	</div>
	<div id="alert" class="alert alert-danger fade" role="alert"></div>
	<h1>社區資料總表</h1>
	<div class="row">
	  <div class="col-sm-1 mb-3" style="width: 12%">
	    <div class="card text-center border-success">
			<div class="card-header">
				<h5>查詢筆數</h5>
			</div>
			<div class="card-body text-success fw-bold">
				<p class="card-text">${communitiesListSize}</p>
			</div>
	    </div>
	  </div>
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
          <th data-sortable="true">社區名稱</th>
          <th data-sortable="true">縣/市</th>
          <th data-sortable="true">區</th>
          <th data-sortable="true">更新時間</th>
          <th data-sortable="true">更新者</th>
          <th data-sortable="true">刪除</th>
        </tr>
      </thead>
      <tbody>
		<c:forEach items="${communitiesList}" var="community" begin="0" end="20">
	        <tr>
	          <td>${community[0]}</td>
	          <td>${community[1]}</td>
	          <td>${community[2]}</td>
	          <td>${community[3]}</td>
	          <td>${community[4]}</td>
	          <td>
	          	<input id="${community[5]}" name="communityUUID" type="hidden" value="${community[5]}" />
	          	<button name="deleteBtn" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
	  					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
	  					<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8"></path>
					</svg>
                	刪除
              	</button>
              </td>
	        </tr>
		</c:forEach>
      </tbody>
    </table>
</div>

<%@ include file="common/footer.jspf" %>

<script>

$( document ).ready(function(){
	
	$('button[name="deleteBtn"]').on('click',function(){
		var communityUUID = $(this).parent().children('input[name=communityUUID]').val();
		$('#deleteCommunityUUID').val(communityUUID);
	});
	
	$('button#deleteBtnConfirm').on('click',function(){
		var deleteCommunityUUID = $('#deleteCommunityUUID').val()
		const formData = new FormData();
		formData.append('communityUUID', deleteCommunityUUID);
		//執行刪除
		fetch('/community/communities',{method:'DELETE',body:formData})
		.then( response => {
			//成功
			if (response.status == 200){
				alertSwitchAndContent(true,'刪除成功')
				$('#'+deleteCommunityUUID).parent().parent().remove();
			}else{
				alertSwitchAndContent(true,'刪除失敗')
			}
		})
		.catch(error => alert('Error:',error));
		
	});
	
});	
	
</script>
