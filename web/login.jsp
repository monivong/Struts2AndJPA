<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>MyBooKs</title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/jquery-2.1.4.min.js"></script>
</head>
<body>
    <h3>Correction Labo Struts 2 :</h3>
    <ul>
        <li>
            <s:url id="url" action="connexion/Login">
                <s:param name="request_locale">en</s:param>
            </s:url>
            <s:a href="%{url}">English</s:a>
        </li>
        <li>
            <s:url id="url" action="connexion/Login">
                <s:param name="request_locale">fr</s:param>
            </s:url>
            <s:a href="%{url}">Français</s:a>
        </li>
    </ul>
    <s:text name="Form.login.title" />
    <s:form action="connexion/Login">
              <s:textfield name="username" label="%{getText('username')}" required="true" />
              <s:textfield name="password" label="%{getText('password')}" required="true" />
              <s:submit value="Log in"/>   	  
    </s:form>	
    <ul>
        <li>
            <s:url id="url" action="Register" />
            <s:a href="%{url}"><s:text name="Form.registration.title" /></s:a>
        </li>
    </ul>
    <script>
        $("document").ready(function() {
           $(".errorMessage")
                   .css("font-weight", "bold")
                   .css("color", "red");
        });
    </script>
</body>
</html>