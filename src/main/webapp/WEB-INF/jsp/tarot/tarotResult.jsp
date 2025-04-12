<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../common/header.jspf" %>
<%@ include file="../common/navigation.jspf" %>

<div class="container">
    <%--    <h1>Tarot Result ${tarotNum}</h1>--%>


    <%--抽排結果    --%>
    <div class="mt-3">


        <%--    單張牌--%>
        <c:if test="${tarotNum == 1}">
            <div class="row justify-content-around">
                <div class="col-lg-4">
                    <div class="card text-center">
                        <div class="card-header">現況</div>
                        <div class="card-body">
                            <h5 class="card-title">${randomTarotCards[0].name}</h5>
                            <img width="190" height="330" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[0].number}.jpg">
                        </div>
                        <c:if test="${randomTarotCards[0].positive == true}">
                            <div class="card-footer text-muted bg-primary-subtle">正位</div>
                        </c:if>
                        <c:if test="${randomTarotCards[0].positive == false}">
                            <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                        </c:if>
                        <div class="card-footer text-muted">屬性：${randomTarotCards[0].property}</div>
                        <div class="card-footer text-muted">元素：${randomTarotCards[0].element}</div>
                        <c:if test="${not empty randomTarotCards[0].people}">
                            <div class="card-footer text-muted">人物：${randomTarotCards[0].people}</div>
                        </c:if>
                        <c:if test="${not empty randomTarotCards[0].planet}">
                            <div class="card-footer text-muted">行星或星座：${randomTarotCards[0].planet}</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>


        <%--    三張牌--%>
        <c:if test="${tarotNum == 3}">
        <div class="row">
            <c:forEach items="${randomTarotCards}" var="tarotCard">
                <div class="col-lg-4">
                    <div class="card text-center">
                        <div class="card-header">${tarotCard.cardPosition}</div>
                        <div class="card-body">
                            <h5 class="card-title">${tarotCard.name}</h5>
                            <img width="190" height="330" src="${pageContext.request.contextPath}/static/pic/tarot/${tarotCard.number}.jpg">
                        </div>
                        <c:if test="${tarotCard.positive == true}">
                            <div class="card-footer text-muted bg-primary-subtle">正位</div>
                        </c:if>
                        <c:if test="${tarotCard.positive == false}">
                            <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                        </c:if>
                        <div class="card-footer text-muted">屬性：${tarotCard.property}</div>
                        <div class="card-footer text-muted">元素：${tarotCard.element}</div>
                        <c:if test="${not empty tarotCard.people}">
                            <div class="card-footer text-muted">人物：${tarotCard.people}</div>
                        </c:if>
                        <c:if test="${not empty tarotCard.planet}">
                            <div class="card-footer text-muted">行星或星座：${tarotCard.planet}</div>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
            </c:if>


            <%--    二擇一--%>
            <c:if test="${tarotNum == 5}">
                <div class="row justify-content-around">
                    <div class="col-lg-3">
                        <div class="card text-center border-info">
                            <div class="card-header text-info fw-bold">A選擇結果</div>
                            <div class="card-body">
                                <h5 class="card-title">${randomTarotCards[3].name}</h5>
                                <img width="95" height="165" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[3].number}.jpg">
                            </div>
                            <c:if test="${randomTarotCards[3].positive == true}">
                                <div class="card-footer text-muted bg-primary-subtle">正位</div>
                            </c:if>
                            <c:if test="${randomTarotCards[3].positive == false}">
                                <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                            </c:if>
                            <div class="card-footer text-muted">屬性：${randomTarotCards[3].property}</div>
                            <div class="card-footer text-muted">元素：${randomTarotCards[3].element}</div>
                            <c:if test="${not empty randomTarotCards[3].people}">
                                <div class="card-footer text-muted">人物：${randomTarotCards[3].people}</div>
                            </c:if>
                            <c:if test="${not empty randomTarotCards[3].planet}">
                                <div class="card-footer text-muted">行星或星座：${randomTarotCards[3].planet}</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card text-center border-success">
                            <div class="card-header text-success fw-bold">B選擇結果</div>
                            <div class="card-body">
                                <h5 class="card-title">${randomTarotCards[4].name}</h5>
                                <img width="95" height="165" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[4].number}.jpg">
                            </div>
                            <c:if test="${randomTarotCards[4].positive == true}">
                                <div class="card-footer text-muted bg-primary-subtle">正位</div>
                            </c:if>
                            <c:if test="${randomTarotCards[4].positive == false}">
                                <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                            </c:if>
                            <div class="card-footer text-muted">屬性：${randomTarotCards[4].property}</div>
                            <div class="card-footer text-muted">元素：${randomTarotCards[4].element}</div>
                            <c:if test="${not empty randomTarotCards[4].people}">
                                <div class="card-footer text-muted">人物：${randomTarotCards[4].people}</div>
                            </c:if>
                            <c:if test="${not empty randomTarotCards[4].planet}">
                                <div class="card-footer text-muted">行星或星座：${randomTarotCards[4].planet}</div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-around mt-3">
                    <div class="col-lg-3">
                        <div class="card text-center border-info">
                            <div class="card-header text-info fw-bold">A選擇過程</div>
                            <div class="card-body">
                                <h5 class="card-title">${randomTarotCards[1].name}</h5>
                                <img width="95" height="165" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[1].number}.jpg">
                            </div>
                            <c:if test="${randomTarotCards[1].positive == true}">
                                <div class="card-footer text-muted bg-primary-subtle">正位</div>
                            </c:if>
                            <c:if test="${randomTarotCards[1].positive == false}">
                                <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                            </c:if>
                            <div class="card-footer text-muted">屬性：${randomTarotCards[1].property}</div>
                            <div class="card-footer text-muted">元素：${randomTarotCards[1].element}</div>
                            <c:if test="${not empty randomTarotCards[1].people}">
                                <div class="card-footer text-muted">人物：${randomTarotCards[1].people}</div>
                            </c:if>
                            <c:if test="${not empty randomTarotCards[1].planet}">
                                <div class="card-footer text-muted">行星或星座：${randomTarotCards[1].planet}</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card text-center border-success">
                            <div class="card-header text-success fw-bold">B選擇過程</div>
                            <div class="card-body">
                                <h5 class="card-title">${randomTarotCards[2].name}</h5>
                                <img width="95" height="165" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[2].number}.jpg">
                            </div>
                            <c:if test="${randomTarotCards[2].positive == true}">
                                <div class="card-footer text-muted bg-primary-subtle">正位</div>
                            </c:if>
                            <c:if test="${randomTarotCards[2].positive == false}">
                                <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                            </c:if>
                            <div class="card-footer text-muted">屬性：${randomTarotCards[2].property}</div>
                            <div class="card-footer text-muted">元素：${randomTarotCards[2].element}</div>
                            <c:if test="${not empty randomTarotCards[2].people}">
                                <div class="card-footer text-muted">人物：${randomTarotCards[2].people}</div>
                            </c:if>
                            <c:if test="${not empty randomTarotCards[2].planet}">
                                <div class="card-footer text-muted">行星或星座：${randomTarotCards[2].planet}</div>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-around mt-3">
                    <div class="col-lg-3">
                        <div class="card text-center">
                            <div class="card-header">環境</div>
                            <div class="card-body">
                                <h5 class="card-title">${randomTarotCards[0].name}</h5>
                                <img width="95" height="165" src="${pageContext.request.contextPath}/static/pic/tarot/${randomTarotCards[0].number}.jpg">
                            </div>
                            <c:if test="${randomTarotCards[0].positive == true}">
                                <div class="card-footer text-muted bg-primary-subtle">正位</div>
                            </c:if>
                            <c:if test="${randomTarotCards[0].positive == false}">
                                <div class="card-footer text-muted bg-danger-subtle">逆位</div>
                            </c:if>
                            <div class="card-footer text-muted">屬性：${randomTarotCards[0].property}</div>
                            <div class="card-footer text-muted">元素：${randomTarotCards[0].element}</div>
                            <c:if test="${not empty randomTarotCards[0].people}">
                                <div class="card-footer text-muted">人物：${randomTarotCards[0].people}</div>
                            </c:if>
                            <c:if test="${not empty randomTarotCards[0].planet}">
                                <div class="card-footer text-muted">行星或星座：${randomTarotCards[0].planet}</div>
                            </c:if>
                        </div>
                    </div>
                </div>

            </c:if>
        </div>



<%--        塔羅牌分析    --%>
        <jsp:include page="tarotAnalyze.jsp">
            <jsp:param value="${randomTarotCards}" name="randomTarotCards"/>
        </jsp:include>
    </div>
</div>

<%@ include file="../common/footer.jspf" %>
