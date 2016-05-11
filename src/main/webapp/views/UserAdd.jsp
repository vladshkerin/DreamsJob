<%@ page import="com.vladshkerin.models.User" %>
<%--
  Page for add user.

  @author Vladimir Shkerin
  @since 12.04.2016
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dreams Job</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/index.css">
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/style/styleform.css">
</head>
<body>

<jsp:include page="include/UserRegistrationInfo.jsp"></jsp:include>

<h1>Add user:</h1>
<h2>Fill out the form below and click "add user" to add</h2>

<form action="<%=request.getContextPath()%>/useradd"
      onsubmit="return validateFormUser()" method="post">
    <input type="hidden" name="id" value="<%=User.getNextId()%>">
    <div class="tableRow">
        <p> Name </p>
        <p><input type="text" name="name" value="" placeholder="Ivan"></p>
    </div>
    <div class="tableRow">
        <p> Growth </p>
        <p><input type="number" name="growth" min="1.0" max="200.0" placeholder="176.5"></p>
    </div>
    <div class="tableRow">
        <p> Date </p>
        <p><input type="date" name="birthDay" value="date"></p>
    </div>
    <div class="tableRow">
        <p> Email </p>
        <p><input type="email" name="email" value="" placeholder="user@mail.ru"></p>
    </div>
    <div class="tableRow">
        <p> Children </p>
        <p><textarea name="children"></textarea></p>
    </div>
    <div class="tableRow">
        <p></p>
        <p>
            <input id="buttonSave" type="submit" value="Save change">
            <%--<input type="submit" value="Back"--%>
                   <%--formaction="<%=request.getContextPath()%>/views/UserView.jsp">--%>
            <input type="button" value="Back"
                   onclick="document.location.href=
                           '<%=request.getContextPath()%>/views/UserView.jsp'">
        </p>
    </div>
    <div class="tableRow">
        <p></p>
        <div id="message">
            <%if (session.getAttribute("message") != null) {%>
                <%=session.getAttribute("message")%>
                <%session.setAttribute("message", "");%>
            <%}%>
        </div>
    </div>
</form>

<script src="<%=request.getContextPath()%>/scripts/handlerButton.js"></script>

</body>
</html>
