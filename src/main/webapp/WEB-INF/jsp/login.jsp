<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<div class="container">
    <div class="py-4 text-center">
        <h2>會員登入</h2>
        <p class="lead">加入會員可享有更多功能</p>
    </div>
    <form action="${pageContext.request.contextPath}/login" class="needs-validation" method="post">
        <div class="row g-3 mb-5 dataFormRow">
            <%--            <div th:if="${param.error}" class="alert alert-error">Invalid username and password.</div>--%>
            <%--            <div th:if="${param.logout}" class="alert alert-success">You have been logged out.</div>--%>
            <%--            <c:if test="${not empty param.error}">--%>
            <%--                <div class="col-12">--%>
            <%--                    <div class="alert alert-success">error</div>--%>
            <%--                </div>--%>
            <%--            </c:if>--%>
            <%--            <c:if test="${param.logout}">--%>
            <%--                <div class="col-12">--%>
            <%--                    <div class="alert alert-success">logout</div>--%>
            <%--                </div>--%>
            <%--            </c:if>--%>
            <div class="col-12">
                <label for="username" class="form-label">帳號：</label>
                <input type="text" id="username" name="username" class="form-control" required="required"/>
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
                    <input type="password" id="password" name="password" class="form-control" required="required"/>
                </div>
            </div>
            <hr class="my-4">
            <div class="col-12">
                <button class="w-100 btn btn-primary btn-lg" type="submit">登入</button>
            </div>
        </div>
    </form>
    <div class="row g-3 mb-5" style="margin-left:30%;width:40%">
        <div class="col-6">
            <p class="lead text-end mt-2">還不是會員?</p>
        </div>
        <div class="col-6">
            <button id="registerBtn" class="w-100 btn btn-success btn-lg">建立帳戶</button>
        </div>
    </div>
</div>
</div>

<script>

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


    //導至註冊頁面

    $('#registerBtn').click(function () {
        window.location.href = "${pageContext.request.contextPath}/register";
    });

</script>


<%@ include file="common/footer.jspf" %>

