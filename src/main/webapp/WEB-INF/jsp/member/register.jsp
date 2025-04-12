<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>

<div class="container">
    <div class="py-5">
        <div class="text-center mb-3">
            <h2 class="text-center">會員註冊</h2>
        </div>
        <c:if test="${registerMsg}">
            <div class="row g-5 dataFormRow">
                <div class="col-12">
                    <div class="alert alert-warning" role="alert">
                        A simple warning alert—check it out!
                    </div>
                </div>
            </div>
        </c:if>
        <div class="row g-5 mt-2 dataFormRow">
            <form id="rigsterForm" name="rigsterForm" action="${pageContext.request.contextPath}/register" method="post" modelAttribute="registerForm"  class="needs-validation mt-0" novalidate="novalidate">
                <div class="row g-3">
                    <div class="col-12">
                        <label for="name" class="form-label">姓名：</label>
                        <input type="text" id="name" name="name" class="form-control required" required="required">
                        <div class="invalid-feedback">
                            請填入姓名
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="username" class="form-label">帳號：</label>
                        <input type="text" id="username" name="username" class="form-control required" required="required">
                        <div class="invalid-feedback">
                            請填入帳號
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="password" class="form-label">密碼：</label>
                        <div class="input-group">
                                <span id="passwordSwitch" class="input-group-text">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-eye-fill" viewBox="0 0 16 16">
                                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"></path>
                                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"></path>
                                    </svg>
                                 </span>
                            <input type="password" id="password" name="password" class="form-control inputGroupRight required" required="required"/>
                            <div class="invalid-feedback">
                                請輸入密碼
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <label for="email" class="form-label">Email：</label>
                        <input type="email" id="email" name="email" class="form-control required" required="required">
                        <div class="invalid-feedback">
                            請輸入Email
                        </div>
                    </div>

                    <hr class="my-4">

                    <div class="form-check">
                        <input type="checkbox" id="privacy" name="privacy" class="form-check-input required" value="true" required="required">
                        <label class="form-check-label" for="privacy">同意本站的<a href="${pageContext.request.contextPath}/privacy">隱私權政策</a></label>
                        <div class="invalid-feedback">
                            請閱讀並勾選同意
                        </div>
                    </div>

                    <div class="form-check">
                        <input type="checkbox" id="subscription" name="subscription" class="form-check-input" value="true">
                        <label class="form-check-label" for="subscription">同意收到優惠資訊或是電子報</label>
                    </div>

                    <hr class="my-4">
                    <button class="w-100 btn btn-primary btn-lg" type="submit">送出</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>


    //登入表單驗證
    $("#rigsterForm").submit(function(event){
        event.preventDefault();
        $('#rigsterForm').addClass('was-validated');
        var isValid = true;
        //驗證input
        $("#rigsterForm input.required").each(function(){
            if ($(this).val() == "" || typeof($(this).val()) == "undefined" || $(this).val().length==0) {
                isValid = false;
            }
        });
        //驗證checkbox
        $("#rigsterForm input:checkbox.required").each(function(){

            if ($(this).is(":checked") == false) {
                isValid = false;
            }
        });
        if (isValid) {
            alert("驗證通過，準備送出");
            this.submit();
        }
    });

    //密碼顯示關閉轉換
    $('#passwordSwitch').click(function () {
        var inputField = $("#password");
        var inputType = inputField.attr("type");

        if (inputType === "password") {
            inputField.attr("type", "text");
        } else {
            inputField.attr("type", "password");
        }
    });

</script>


<%@ include file="../common/footer.jspf" %>
