<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>

<div class="container">
<%--    <h1>Welcome MemberIndex ${name} !</h1>--%>

    <div class="py-5 text-center">
        <h2>會員首頁</h2>
<%--        <p class="lead">加入會員可享有更多功能</p>--%>
    </div>


<%--    <form id="loginForm" class="needs-validation" novalidate>--%>
<%--        <div class="row g-3 mb-5" style="margin-left:30%;width:40%">--%>
<%--            <div class="col-12">--%>
<%--                <label for="userName" class="form-label">帳號：</label>--%>
<%--                <input type="text" id="userName" class="form-control" required="required">--%>
<%--                <div class="invalid-feedback">--%>
<%--                    請輸入帳號--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-12">--%>
<%--                <label for="password" class="form-label">密碼：</label>--%>
<%--                <div class="input-group">--%>
<%--                    <span id="passwordSwitch" class="input-group-text">--%>
<%--                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">--%>
<%--                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"></path>--%>
<%--                            <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"></path>--%>
<%--                        </svg>--%>
<%--                    </span>--%>
<%--                    <input id="password" name="password" type="password" class="form-control inputGroupRight" required="required">--%>
<%--                    <div class="invalid-feedback">--%>
<%--                        請輸入密碼--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <hr class="my-4">--%>
<%--            <div class="col-6">--%>
<%--                <button id="submitBtn" class="w-100 btn btn-primary btn-lg" type="submit">登入</button>--%>
<%--            </div>--%>
<%--            <div class="col-6">--%>
<%--                <button class="w-100 btn btn-success btn-lg">註冊會員</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>



</div>

<script src="/webjars/jquery/3.6.0/jquery.min.js"></script>
<%--<script>--%>

<%--//登入表單驗證--%>
<%--$("#loginForm").submit(function(event){--%>
<%--    event.preventDefault();--%>
<%--    $("#loginForm").addClass('was-validated');--%>

<%--    var isValid = true;--%>
<%--    $("#loginForm input").each(function(){--%>
<%--        if ($(this).val() === "") {--%>
<%--            isValid = false;--%>
<%--        }--%>
<%--    });--%>
<%--    if (isValid) {--%>
<%--        alert("驗證通過，準備送出");--%>
<%--        this.submit();--%>
<%--    }--%>
<%--});--%>

<%--//密碼顯示關閉轉換--%>
<%--$('#passwordSwitch').click(function(){--%>
<%--    var inputField = $("#password");--%>
<%--    var inputType = inputField.attr("type");--%>

<%--    if (inputType === "password") {--%>
<%--        inputField.attr("type", "text");--%>
<%--    } else {--%>
<%--        inputField.attr("type", "password");--%>
<%--    }--%>
<%--});--%>

<%--</script>--%>


<%@ include file="../common/footer.jspf" %>
