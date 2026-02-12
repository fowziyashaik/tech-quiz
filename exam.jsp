<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String quizType = request.getParameter("quizType");
String stage = request.getParameter("stage");
boolean showQuiz = (quizType != null && stage != null && request.getParameter("submitQuiz")==null);
boolean showResult = request.getParameter("submitQuiz") != null;
int stageIndex = (stage != null) ? Integer.parseInt(stage)-1 : -1;

/* ================= STATIC QUESTIONS ================= */
String[][] logical1 = { {"2+3=?","5","6","4","7","5"}, {"Odd: 2,4,5,6","2","4","5","6","5"}, {"Next: 1,2,3,?","4","5","6","7","4"}, {"All A are B, B are C, A is C?","Yes","No","Maybe","Cannot Say","Yes"}, {"5+5=?","10","11","9","12","10"} };
String[][] logical2 = { {"Next: 2,4,8,?","16","14","12","10","16"}, {"Odd: 7,9,12,15","7","9","12","15","12"}, {"If 5+3=28, 2+4=?","12","14","10","16","12"}, {"Series: 1,2,4,8,?","16","12","10","14","16"}, {"Tallest: John>Mike>Sam","John","Mike","Sam","Cannot Say","John"} };
String[][] logical3 = { {"2+3*2=?","8","10","12","6","8"}, {"Series: 2,6,12,20,?","30","28","32","26","30"}, {"Next: 5,10,20,?","40","35","30","50","40"}, {"Tallest: J>M>S>B","John","Mike","Sam","Bob","John"}, {"Cube of 5?","125","25","75","100","125"} };

String[][] reasoning1 = { {"A>B, B>C, A>?","C","B","A","Cannot Say","A"}, {"Odd: Cat,Dog,Car,Rabbit","Cat","Dog","Car","Rabbit","Car"}, {"Series: 1,2,3,?","4","5","6","7","4"}, {"4th day of week?","Thursday","Wednesday","Friday","Tuesday","Thursday"}, {"Squares are rectangles?","True","False","Maybe","NA","True"} };
String[][] reasoning2 = { {"Series: 2,6,12,?","20","18","24","22","20"}, {"Odd: 11,14,17,?","17","14","11","18","17"}, {"Cats → Dogs logic","Cannot Say","Yes","No","Maybe","Cannot Say"}, {"10th day of week?","Wednesday","Friday","Tuesday","Thursday","Tuesday"}, {"Opposite of Light?","Dark","Bright","Dim","None","Dark"} };
String[][] reasoning3 = { {"Series: 3,6,12,24,?","48","42","36","50","48"}, {"Odd: 31,33,36,39","31","33","36","39","31"}, {"Smallest A>B>C>D","D","C","B","A","D"}, {"J,L,N,?","P","M","O","Q","P"}, {"Opposite of Hard?","Soft","Easy","Smooth","Light","Soft"} };

String[][] technical1 = { {"Java inheritance?","extends","implements","super","inherit","extends"}, {"HTML full form?","Hyper Text Markup Language","High Text","Hyper Tab","None","Hyper Text Markup Language"}, {"Python type?","Interpreted","Compiled","Both","None","Interpreted"}, {"Remove table SQL?","DROP","DELETE","TRUNCATE","REMOVE","DROP"}, {"CSS full form?","Cascading Style Sheet","Color Sheet","Creative Sheet","None","Cascading Style Sheet"} };
String[][] technical2 = { {"Java interface keyword?","interface","class","extends","implements","interface"}, {"HTML5 tag?","section","div","span","table","section"}, {"Python loop?","for","loop","do","repeat","for"}, {"Delete rows SQL?","DELETE","DROP","TRUNCATE","REMOVE","DELETE"}, {"CSS color property?","color","bg","font","style","color"} };
String[][] technical3 = { {"Java exception?","try-catch","handle","throw","error","try-catch"}, {"Python decorator?","@","$","#","&","@"}, {"Flexbox property?","justify-content","align","display-flex","flex","justify-content"}, {"SQL join?","INNER","LEFT","RIGHT","OUTER","INNER"}, {"Arrow function?","()=>{}","function()","fun()","{}=>","()=>{}"} };

String[][] L = stageIndex==0?logical1:stageIndex==1?logical2:logical3;
String[][] R = stageIndex==0?reasoning1:stageIndex==1?reasoning2:reasoning3;
String[][] T = stageIndex==0?technical1:stageIndex==1?technical2:technical3;

/* Score calculation */
int score=0;
int maxScore = 5;
if(showResult){
    if("Logical".equals(quizType) || "All".equals(quizType)){
        for(int i=0;i<5;i++){
            String ans = request.getParameter("L"+i);
            if(ans != null && ans.equals(L[i][5])) score++;
        }
    }
    if("Reasoning".equals(quizType) || "All".equals(quizType)){
        for(int i=0;i<5;i++){
            String ans = request.getParameter("R"+i);
            if(ans != null && ans.equals(R[i][5])) score++;
        }
    }
    if("Technical".equals(quizType) || "All".equals(quizType)){
        for(int i=0;i<5;i++){
            String ans = request.getParameter("T"+i);
            if(ans != null && ans.equals(T[i][5])) score++;
        }
    }
    if("All".equals(quizType)) maxScore = 15;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tech Quiz</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background:#eef2f7; font-family:'Segoe UI',sans-serif;}
.quiz-container { max-width:500px; margin:30px auto;  padding:15px;}
.section-header { background:linear-gradient(90deg,#0d6efd,#6610f2); color:#fff; padding:12px; border-radius:10px; text-align:center; margin:20px 0 10px; font-weight:600; }
.q-card { border-radius:15px; margin-bottom:15px; padding:20px; background:#fff; box-shadow:0 4px 8px rgba(0,0,0,0.1); transition:transform .3s, box-shadow .3s;}
.q-card:hover { transform:translateY(-5px); box-shadow:0 15px 25px rgba(0,0,0,0.2);}
.correct-answer { color:green; font-weight:bold; }
button { border-radius:25px; padding:10px 0; }
.timer { position:fixed; top:10px; right:10px; background:#fff; padding:10px 15px; border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.15); font-weight:600;}
</style>

<script>
var totalTime = 180; // 3 minutes
var timerInterval;

function startTimer(){
    var timer = document.getElementById('timer');
    timerInterval = setInterval(function(){
        var min = Math.floor(totalTime / 60);
        var sec = totalTime % 60;
        timer.innerHTML = min + ":" + (sec < 10 ? "0" + sec : sec);

        if(totalTime <= 0){
            clearInterval(timerInterval);
            alert("⏰ Time's up! Your quiz will be submitted automatically.");
            if(document.getElementById('quizForm')) document.getElementById('quizForm').submit();
        }
        totalTime--;
    }, 1000);
}

function stopTimer(){
    clearInterval(timerInterval);
}
</script>
</head>
<body>

<div class="quiz-container">
<h3 class="text-center text-primary mb-4">🧠 Tech Quiz</h3>

<% if(!showQuiz && !showResult){ %>
    <!-- Quiz Selection -->
    <div class="card shadow p-4">
        <h5 class="text-center mb-3">🎯 Select Quiz</h5>
        <form method="get">
            <select name="quizType" class="form-select mb-3" required>
                <option value="">Select Quiz Type</option>
                <option>Logical</option>
                <option>Reasoning</option>
                <option>Technical</option>
                <option>All</option>
            </select>
            <select name="stage" class="form-select mb-3" required>
                <option value="">Select Stage</option>
                <option value="1">Stage 1 – Easy</option>
                <option value="2">Stage 2 – Medium</option>
                <option value="3">Stage 3 – Hard</option>
            </select>
            <button class="btn btn-primary w-100 mt-2">🚀 Start Quiz</button>
        </form>
    </div>

<% } else if(showResult){ %>
    <!-- Quiz Result -->
    <div class="card p-4">
        <h2 class="text-center mb-3">🎉 Your Score: <%=score%> / <%=maxScore%></h2>

        <% if("Logical".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Logical</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=L[i][0]%></b><br>
                    <div class="correct-answer">Answer: <%=L[i][5]%></div>
                </div>
            <% } %>
        <% } %>

        <% if("Reasoning".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Reasoning</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=R[i][0]%></b><br>
                    <div class="correct-answer">Answer: <%=R[i][5]%></div>
                </div>
            <% } %>
        <% } %>

        <% if("Technical".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Technical</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=T[i][0]%></b><br>
                    <div class="correct-answer">Answer: <%=T[i][5]%></div>
                </div>
            <% } %>
        <% } %>

        <div class="text-center mt-3">
            <a href="exam.jsp" class="btn btn-primary">Retake Quiz</a>
        </div>
    </div>

<% } else if(showQuiz){ %>
    <!-- Timer shown ONLY during quiz -->
    <div class="timer" id="timer">3:00</div>

    <!-- Quiz Questions -->
    <form method="get" id="quizForm" onsubmit="stopTimer()">
        <script>startTimer();</script>
        <input type="hidden" name="quizType" value="<%=quizType%>">
        <input type="hidden" name="stage" value="<%=stage%>">
        <input type="hidden" name="submitQuiz" value="true">

        <% if("Logical".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Logical</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=L[i][0]%></b><br>
                    <% for(int o=1;o<=4;o++){ %>
                        <div class="form-check">
                            <input type="radio" name="L<%=i%>" value="<%=L[i][o]%>" required> <%=L[i][o]%>
                        </div>
                    <% } %>
                </div>
            <% } %>
        <% } %>

        <% if("Reasoning".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Reasoning</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=R[i][0]%></b><br>
                    <% for(int o=1;o<=4;o++){ %>
                        <div class="form-check">
                            <input type="radio" name="R<%=i%>" value="<%=R[i][o]%>" required> <%=R[i][o]%>
                        </div>
                    <% } %>
                </div>
            <% } %>
        <% } %>

        <% if("Technical".equals(quizType) || "All".equals(quizType)){ %>
            <div class="section-header">Technical</div>
            <% for(int i=0;i<5;i++){ %>
                <div class="q-card">
                    <b>Q<%=i+1%>. <%=T[i][0]%></b><br>
                    <% for(int o=1;o<=4;o++){ %>
                        <div class="form-check">
                            <input type="radio" name="T<%=i%>" value="<%=T[i][o]%>" required> <%=T[i][o]%>
                        </div>
                    <% } %>
                </div>
            <% } %>
        <% } %>

        <button class="btn btn-success w-100 mt-3">✅ Submit Quiz</button>
    </form>
<% } %>

</div>
</body>
</html>
