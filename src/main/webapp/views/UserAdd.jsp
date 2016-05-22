<%@ page import="com.vladshkerin.models.User" %>
<%@ page import="com.vladshkerin.services.UserService" %>
<%--
  The page for adding a user.

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

<div id="all_content">

    <jsp:include page="include/PageHead.jsp"></jsp:include>
    <%--<jsp:include page="include/PageLinks.jsp"></jsp:include>--%>

    <nav>
        <ul>
            <li><a href="<%=request.getContextPath()%>/index.jsp">HOME</a></li>
            <li class="selected"><a href="<%=request.getContextPath()%>/views/UserView.jsp">USERS</a></li>
            <li><a href="<%=request.getContextPath()%>/views/ItemView.jsp">ITEMS</a></li>
        </ul>
    </nav>

    <div id="main">

        <h1>Add user:</h1>
        <h2>Fill out the form below and click "add user" to add</h2>

        <form class="body_form" action="<%=request.getContextPath()%>/user_add"
              onsubmit="return validateFormUser()" method="post">
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
                    <%
                        if (UserService.getInstance().isRoleAdmin(session.getAttribute("login"))) {
                    %>
                    <input id="buttonSave" type="submit" value="Save change">
                    <%
                        }
                    %>
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

    </div> <%--main--%>

    <jsp:include page="include/PageFooter.jsp"></jsp:include>

</div>  <%--all_content--%>

<script src="<%=request.getContextPath()%>/scripts/handlerButton.js"></script>

</body>
</html>
