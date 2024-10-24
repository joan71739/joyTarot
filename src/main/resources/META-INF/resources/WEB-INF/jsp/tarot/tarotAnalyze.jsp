<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">


<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <h2 class="h2">塔羅牌詳細資訊</h2>
    <div class="btn-toolbar mb-2 mb-md-0">
        <div class="btn-group me-2">
            <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
            <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
        </div>
    </div>
</div>
<div class="border-bottom mb-3">
    <table class="table table-striped table-sm">
        <thead>
        <tr>
            <th scope="col">牌陣含意</th>
            <th scope="col">卡牌名稱</th>
            <th scope="col">關鍵字</th>
            <th scope="col">一句話形容</th>
            <th scope="col">正逆位思考</th>
            <th scope="col">代表工作</th>
            <th scope="col">健康</th>
            <th scope="col">含意</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${randomTarotCards}" var="tarotCard">
            <tr>
                <td>${tarotCard.cardPosition}</td>
                <td class="tarotCardName">${tarotCard.name}</td>
                <td>${tarotCard.keyWord}</td>
                <td>${tarotCard.oneWord}</td>
                <td>${tarotCard.thinking}</td>
                <td>${tarotCard.job}</td>
                <td>${tarotCard.health}</td>
                <td>${tarotCard.meaning}</td>
            </tr>
            <input type="hidden" class="elementData" value="${tarotCard.element}"/>
            <input type="hidden" class="propertyData" value="${tarotCard.property}"/>
            <input type="hidden" class="positiveData" value="${tarotCard.positive}"/>
            <input type="hidden" class="peopleData" value="${tarotCard.people}"/>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="border-bottom mb-3">
    <h2 class="h2">各元素比例</h2>
    <div class="row mb-2">
        <div class="col-md-4">
            <canvas id="elementChart"></canvas>
        </div>
        <div class="col-md-4">
            <canvas id="propertyChart"></canvas>
        </div>
        <div class="col-md-4">
            <canvas id="positiveChart"></canvas>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-6">
            <canvas id="numberChart"></canvas>
        </div>
        <div class="col-md-6">
            <canvas id="peopleChart"></canvas>
        </div>
    </div>
</div>
<script src="/vendor/jQuery/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>


    /* 圖表用 開始 */
    let element = {
        fire: 0,
        air: 0,
        water: 0,
        earth: 0
    };

    let property = {
        major: 0,
        minor: 0
    };

    let positive = {
        true: 0,
        false: 0
    };

    let cardNumber = {
        ONE:0,
        TWO:0,
        THREE:0,
        FOUR:0,
        FIVE:0,
        SIX:0,
        SEVEN:0,
        EIGHT:0,
        NINE:0,
        TEN:0
    }

    let people ={
        PAGE:0,
        KINGHT:0,
        QUEEN:0,
        KING:0
    }

    // 元素
   $('.elementData').map(function(){
       if ($(this).val().includes("火")) {
           element.fire += 1;
       }
       if ($(this).val().includes("水")) {
           element.water += 1;
       }
       if ($(this).val().includes("風")) {
           element.air += 1;
       }
       if ($(this).val().includes("土")) {
           element.earth += 1;
       }
    });

    // 屬性
   $('.propertyData').map(function(){
       if ($(this).val().includes("大牌")) {
           property.major += 1;
       }else{
           property.minor += 1;
       }

    });

    // 正逆位
   $('.positiveData').map(function(){
       if ($(this).val().includes(true)) {
           positive.true += 1;
       }else{
           positive.false += 1;
       }
    });

   //數字
   $('td.tarotCardName').each(function(){

       if ($(this).text().includes(1) && !$(this).text().includes(10)) {
           cardNumber.ONE +=1;
       }
       if ($(this).text().includes(2)) {
           cardNumber.TWO +=1;
       }
       if ($(this).text().includes(3)) {
           cardNumber.THREE +=1;
       }
       if ($(this).text().includes(4)) {
           cardNumber.FOUR +=1;
       }
       if ($(this).text().includes(5)) {
           cardNumber.FIVE +=1;
       }
       if ($(this).text().includes(6)) {
           cardNumber.SIX +=1;
       }
       if ($(this).text().includes(7)) {
           cardNumber.SEVEN +=1;
       }
       if ($(this).text().includes(8)) {
           cardNumber.EIGHT +=1;
       }
       if ($(this).text().includes(9)) {
           cardNumber.NINE +=1;
       }
       if ($(this).text().includes(10)) {
           cardNumber.TEN +=1;
       }

   });

    // 人物
    $('.peopleData').map(function(){
        if ($(this).val().includes("國王")) {
            people.KING += 1;
        }
        if ($(this).val().includes("皇后")) {
            people.QUEEN += 1;
        }
        if ($(this).val().includes("騎士")) {
            people.KINGHT += 1;
        }
        if ($(this).val().includes("侍者")) {
            people.PAGE += 1;
        }
    });

    const elementChart = document.getElementById('elementChart');

    new Chart(elementChart, {
        type: 'bar',
        data: {
            labels: ['土', '水', '火', '風'],
            datasets: [{
                label: '元素',
                data: [element.earth, element.water, element.fire, element.air],
                borderColor: '#36A2EB',
                backgroundColor: '#9BD0F5',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });

    const propertyChart = document.getElementById('propertyChart');

    new Chart(propertyChart, {
        type: 'bar',
        data: {
            labels: ['大阿爾克納', '小阿爾克納'],
            datasets: [{
                label: '屬性',
                data: [property.major, property.minor],
                borderColor: '#FF6384',
                backgroundColor: '#FFB1C1',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });

    const positiveChart = document.getElementById('positiveChart');

    new Chart(positiveChart, {
        type: 'bar',
        data: {
            labels: ['正位', '逆位'],
            datasets: [{
                label: '正逆位',
                data: [positive.true, positive.false],
                borderColor: '#FFC107',
                backgroundColor: '#FFF3CD',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });

    const numberChart = document.getElementById('numberChart');
    new Chart(numberChart, {
        type: 'bar',
        data: {
            labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
            datasets: [{
                label: '數字',
                data: [cardNumber.ONE, cardNumber.TWO, cardNumber.THREE, cardNumber.FOUR, cardNumber.FIVE, cardNumber.SIX, cardNumber.SEVEN, cardNumber.EIGHT, cardNumber.NINE,cardNumber.TEN],
                borderColor: '#ADCAF0',
                backgroundColor: '#CFF4FC',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });

    //人物
    const peopleChart = document.getElementById('peopleChart');
    new Chart(peopleChart, {
        type: 'bar',
        data: {
            labels: ['侍者', '騎士', '皇后', '國王'],
            datasets: [{
                label: '人物',
                data: [people.PAGE, people.KINGHT, people.QUEEN, people.KING],
                borderColor: '#198754',
                backgroundColor: '#D1E7DD',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks:{
                        stepSize:1
                    }
                }
            }
        }
    });



    /* 圖表用 結束 */

</script>


