<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
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
		<h1 class="card-title ms-2 mt-2 text-center">實價登錄查詢</h1>
		<div class="card-body bg-light-subtle">
			<div class="from formDiv card-text">
				<form:form id="searchBuildForm" name="searchBuildForm" action="/house/houseDetail" modelAttribute="searchBuildForm"
					method="Get" autocomplete="off">
					<!-- 城市中文名稱 -->
					<input type="hidden" id="hsnNm" name="hsnNm" />
					<!-- 查詢條件 -->
					<div class="row mb-3">
						<div class="col-3">
							<span class="text-danger me-2">*</span>
							<label class="form-label">交易民國年</label><br/> 
							<span class="text-danger ms-2">(必填)</span>
						</div>
						<div class="col-8">
							<div class="input-group mb-3">
							  <input type="number" id="dataYearStart" name="dataYearStart" class="form-control" placeholder="年" min=101 >
							  <span class="input-group-text">至</span>
							  <input type="number" id="dataYearEnd" name="dataYearEnd" class="form-control" placeholder="年" min=101 >
							</div>					
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="hsnCd" class="form-label">
								<span class="text-danger me-2">*</span>
								縣/市
								<span class="text-danger ms-2">(必填)</span> 
							</label>
							<select id="hsnCd" name="hsnCd" class="form-select"></select>
						</div>
						<div class="col">
							<label for="townNm" class="form-label">區/鄉/鎮</label> 
							<select id="townNm" name="townNm" class="form-select" ></select>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="position" class="form-label">路段關鍵字</label> 
							<input id="position" name="position" class="form-control">
						</div>
						<div class="col">
							<label for="buildState" class="form-label">建築型態</label> 
							<select id="buildState" name="buildState" class="form-select" ></select>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label class="form-label">單價區間</label>
							<div class="input-group mb-3">
							  <input type="number" class="form-control" placeholder="萬" id="minUnitPrice" name="minUnitPrice" min=0>
							  <span class="input-group-text">至</span>
							  <input type="number" class="form-control" placeholder="萬" id="maxUnitPrice" name="maxUnitPrice" min=0>
							</div>
						</div>
						<div class="col">
							<label class="form-label">總價區間</label>
							<div class="input-group mb-3">
							  <input type="number" class="form-control" placeholder="萬" id="minTotalPrice" name="minTotalPrice" min=0>
							  <span class="input-group-text">至</span>
							  <input type="number" class="form-control" placeholder="萬" id="maxTotalPrice" name="maxTotalPrice" min=0>
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class="col">
							<label for="tranSign" class="form-label me-3">交易標的</label>
							<div id="tranSign" class="bg-white"></div>
						</div>
						<div class="col">
							<label for="excludeSpecialDeal" class="form-label me-3">排除特殊交易</label>
							<input class="form-check-input" type="checkbox" name="excludeSpecialDeal" value=TRUE>
						</div>
					</div>
					<div class="row mt-5">
						<div class="text-center">
							<button id="submit" type="submit" class="btn btn-primary me-3">送出</button>
							<button id="reset" type="reset" class="btn btn-secondary">重設</button>
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>

<%@ include file="common/footer.jspf"%>

<script>
$( document ).ready(function(){
	
	//縣市選擇下拉選單事件
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
			$('#townNm').empty().append('<option value=""></option>');
			//清除城市中文名稱
			$('#hsnNm').val('');
			
		}
	});
	
	//區鄉鎮下拉選單確認縣市是否選擇
	$('#townNm').on('click',function(){
		if($('#hsnCd').val() ==''){
			//新增提示文字
			alertSwitchAndContent(true,'請先選擇 【縣/市】 再選擇 【區/鄉/鎮】');
		}else{
			//清除提示區
			alertSwitchAndContent(false,'');
		}
	});
	
	//清除按鈕
	$('#reset').on('click',function(){
		//清除鄉鎮區
		$('#townNm').empty().append('<option value=""></option>');
		//清除提示區
		$("#alert").removeClass("show");
		$('#alert').empty();
	});
	
	//轉半形
	$('#position').on('change',function(){
		this.value=toHalfWidth(this.value)
	});
	
	
	//表單檢核
	$('#submit').on('click',function() {
		//民國年區間
		var dataYearStart=$('#dataYearStart').val();
		var dataYearEnd=$('#dataYearEnd').val();
		//總價區間
		var minTotalPrice=$('#minTotalPrice').val();
		var maxTotalPrice=$('#maxTotalPrice').val();
		//單價區間
		var minUnitPrice=$('#minUnitPrice').val();
		var maxUnitPrice=$('#maxUnitPrice').val();
		
		if(checkAtLeastOneVal() 
			&& checkInterval(dataYearStart,dataYearEnd,'【民國年】') 
			&& checkInterval(minTotalPrice,maxTotalPrice,'【總價】') 
			&& checkInterval(minUnitPrice,maxUnitPrice,'【單價】') 
		){
			return true;
		}
		
		return false;	
		
		
	});
});


/*-----初始化------*/
//新增縣市下拉選單
doQuery('/org/findHsn','hsn',{});
//新增建築型態下拉選單
doQuery('/house/findBuildState','buildState',{});
//新增交易標的下拉選單
doQuery('/house/findTranSign','tranSign',{});

/*-----初始化結束------*/

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
					case('buildState'):
						addbuildStateSelect(json);
						break;
					case('tranSign'):
						addTranSignSelect(json);
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

//彈跳視窗開關及內容
function alertSwitchAndContent(alertSwitch,content){
	if(alertSwitch == true){
		$("#alert").addClass("show");
		$('#alert').empty().append(content);
	}else{
		$("#alert").removeClass("show");
		$('#alert').empty();
	}
}

//縣市下拉式選單
function addHsnSelect(content){
	$('#hsnCd').empty().append('<option value="">請選擇縣/市</option>');
	
	content.forEach((e)=> {
		$('#hsnCd').append('<option value='+ e[0] +'>'+ e[1] +'</option>');
	});
}

//區域下拉式選單
function addTownSelect(content){
	$('#townNm').empty().append('<option value="">請選擇區/鄉/鎮</option>');
	
	content.forEach((e)=> {
		$('#townNm').append('<option value='+ e.townNm +'>'+ e.townNm +'</option>');
	});
}

//建築型態下拉式選單
function addbuildStateSelect(content){
	$('#buildState').empty().append('<option value="">請選擇建築型態</option>');
	
	content.forEach((e)=> {
		$('#buildState').append('<option value='+ e[0] +'>'+ e[0] +'</option>');
	});
}

//交易標的下拉選單
function addTranSignSelect(content){
	$('#tranSign').empty();
	
	content.forEach((e)=> {
		$('#tranSign').append(
		'<div class="form-check form-check-inline">'
			+'<input class="form-check-input" type="checkbox" name="tranSign" value="'+e[0]+'">'
			+'<label class="form-check-label">'+e[0]+'</label></div>'
		);
	});
}
//檢核方法_至少一個值
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


//檢核方法_區間
function checkInterval(minVal,maxVal,colName){
	if(minVal != '' || maxVal != ''){
		if(minVal == '' || maxVal == ''){
			alertSwitchAndContent(true,'如使用'+ colName +'區間篩選條件，最大最小值都要填寫');
			return false;
		}else if(parsInt(minVal) > parseInt(maxVal)){
			alertSwitchAndContent(true,colName +'起始欄位要小於等於結束欄位');
			return false;
		}
	}
	return true;
}

</script>


