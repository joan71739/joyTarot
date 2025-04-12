<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>

<div class="container">

    <div class="p-4 p-md-5 mb-4 rounded text-body-emphasis bg-body-secondary mt-3">
        <div class="col-lg-6 px-0">
            <h1 class="display-4 fst-italic">偉特塔羅牌</h1>
            <p class="lead my-3 fw-normal">大阿爾克納22張，小阿爾克納56張，合計共78張牌。
                <br/>小阿爾克納牌有四種元素，分別為權杖、聖杯、寶劍及金幣，元素配對數字牌及宮廷牌，例如：權杖一、金幣皇后，可延伸出各種不同的含意。
            </p>
            <p class="lead mb-0"><a href="${pageContext.request.contextPath}/tarot" class="text-body-emphasis fw-bold">抽牌系統</a></p>
        </div>
    </div>


    <div class="row justify-content-start">
        <c:forEach items="${tarotCardList}" var="tarot">
            <div class="col-3 mt-3">
                <div class="card text-center" style="width: 18rem;">
                    <div class="card-header">${tarot.name}</div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <img height="330" width="190" src="${pageContext.request.contextPath}/static/pic/tarot/${tarot.number}.jpg" />

                        </li>
    <%--                    <li class="list-group-item">A second item</li>--%>
    <%--                    <li class="list-group-item">A third item</li>--%>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>



</div>

<%@ include file="../common/footer.jspf" %>
