<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.card, .alert {
	width: 60%;
	left: 50%;
	transform: translate(-50%, 0);
}

</style>

<div class="container">
	<div id="alert" class="alert alert-danger fade" role="alert"></div>
	<div class="card mt-4 p-3">
		<h1 class="card-title ms-2 mt-2 text-center">社區查詢</h1>
		<div class="card-body bg-light-subtle">
			<!-- 查詢條件 -->
			<form:form id="communityForm" name="communityForm" action="/community/communities" modelAttribute="communityBuildForm" method="get" autocomplete="off">
				<div class="row mb-3">
					<!-- 縣/市 -->
					<div class="col">
						<label for="hsnCd" class="form-label">
<!-- 							<span class="text-danger me-2">*</span> -->
							縣/市
<!-- 							<span class="text-danger ms-2">(必填)</span>  -->
						</label>
						<select id="hsnCd" name="hsnCd" class="form-select"></select>
					</div>
					<!-- 區/鄉/鎮 -->
					<div class="col">
						<label for="townCd" class="form-label">區/鄉/鎮</label> 
						<select id="townCd" name="townCd" class="form-select" ></select>
					</div>
				</div>
				<div class="row mb-3">
					<!-- 社區名稱 -->
					<div class="col">
						<label for="communityNm" class="form-label">社區名稱</label> 
						<input id="communityNm" name="communityNm" class="form-control">
					</div>
				</div>
				<div class="row mt-5">
					<div class="text-center">
						<button id="submit" type="submit" class="btn btn-primary me-3">社區查詢</button>
						<button id="reset" type="reset" class="btn btn-secondary me-3">重設</button>
						<button id="create" type="button" class="btn btn-success">社區新增</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>

<%@ include file="common/footer.jspf" %>

<script>
$( document ).ready(function(){
	//縣市選擇下拉選單事件(同houseIndex.jsp)
	$('#hsnCd').on('change',function(){
		if($('#hsnCd').val() != ''){
			//查詢鄉鎮區
			var data ={ 
				hsnCd : $('#hsnCd').val()
			};
			//城市中文名稱
			$('#hsnNm').val($('#hsnCd option:selected').text());
			//執行鄉鎮查詢
			doQuery('/org/findTown','town',data);
		}else{
			//清除鄉鎮區
			$('#townCd').empty().append('<option value=""></option>');
			//清除城市中文名稱
			$('#hsnNm').val('');
			
		}
	});
	
	//區鄉鎮下拉選單確認縣市是否選擇(同houseIndex.jsp)
	$('#townCd').on('click',function(){
		if($('#hsnCd').val() ==''){
			//新增提示文字
			alertSwitchAndContent(true,'請先選擇 【縣/市】 再選擇 【區/鄉/鎮】');
		}else{
			//清除提示區
			alertSwitchAndContent(false,'');
		}
	});
	
	//轉半形
	$('#communityNm').on('change',function(){
		this.value=toHalfWidth(this.value)
	});
	
	//清除按鈕(同houseIndex.jsp)
	$('#reset').on('click',function(){
		//清除鄉鎮區
		$('#townCd').empty().append('<option value=""></option>');
		//清除提示區
		$("#alert").removeClass("show");
		$('#alert').empty();
	});
	
	//新增按鈕
	$('#create').on('click',function(){
		//取得表單物件
		const communityForm =new FormData(document.querySelector('#communityForm'));
		//執行新增
		fetch('/community/communities',{method:'POST',body:communityForm})
		.then(response => {
			//成功
			if (response.status == 200){
				$('#reset').click();
				alertSwitchAndContent(true,'新增成功')
			//失敗
			}else{
				alertSwitchAndContent(true,'新增失敗')
			}
		})
		.catch(error => alert('Error:',error));
	});
	
// 	//表單檢核(同houseIndex.jsp)
// 	$('#submit').on('click',function() {
// 		if(checkAtLeastOneVal()){
// 			return true;
// 		}
// 		return false;	
// 	});
	
});

/*-----初始化------*/
 //新增縣市下拉選單
doQuery('/org/findHsn','hsn',{});
 
 
/*-----初始化結束------*/

//(同houseIndex.jsp)
function doQuery(url,type,data){
	$.ajax({
		type:'GET',
		url:url,
		contentType: "application/json",
		data:data,
		success:function(json){
			if(json.length > 0){
				switch (type){
					case('hsn'):
						addHsnSelect(json);
						break;
					case('town'):
						addTownSelect(json);
						break;
					default:
						break;
				}
			}
		},
		error:function(json){
			alert("發生錯誤:"+json.status+" "+json.statusText);
		}
	});
}

// function doCreate(url,type,data){
// 	$.ajax({
// 		type:'POST',
// 		url:url,
// 		contentType: "application/json",
// 		data:data,
// 		success:function(json){
// 			if(json.length > 0){
// 				alertSwitchAndContent(true,'新增成功');
// 			}
// 		},
// 		error:function(json){
// 			alert("發生錯誤:"+json.status+" "+json.statusText);
// 		}
// 	});
// }


//縣市下拉式選單(同houseIndex.jsp)
function addHsnSelect(content){
	$('#hsnCd').empty().append('<option value="">請選擇縣/市</option>');
	
	content.forEach((e)=> {
		$('#hsnCd').append('<option value='+ e[0] +'>'+ e[1] +'</option>');
	});
}

//區域下拉式選單(同houseIndex.jsp)
function addTownSelect(content){
	$('#townCd').empty().append('<option value="">請選擇區/鄉/鎮</option>');
	
	content.forEach((e)=> {
		$('#townCd').append('<option value='+ e.townCd +'>'+ e.townNm +'</option>');
	});
}

//檢核方法_至少一個值(同houseIndex.jsp)
function checkAtLeastOneVal(){
	var formValid = false;
	$('form').find('input:text,input[type="number"],select,input:checkbox:checked').each(function() {
	  if ($(this).val() != '' && $(this).val() != null) {
		formValid = true;
	  }
	});
	if(!formValid)
		alertSwitchAndContent(true,'請至少選擇一個條件');
	return formValid;
}


</script>