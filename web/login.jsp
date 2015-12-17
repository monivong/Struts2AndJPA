<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="#session['connecte']">
<jsp:forward page="index.jsp"></jsp:forward>
</s:if>
<html>
<head>
    <title>MyBooKs</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- jQuery -->
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/hereIam.css" rel="stylesheet">    
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    <script src="../js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../css/hereIam.css" rel="stylesheet">    
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../../js/jquery-2.1.4.min.js"></script>
    <!-- Bootstrap Core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../../css/hereIam.css" rel="stylesheet">    
    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
</head>
<body>
    <s:include value="navbar.jsp" />                                           
    <div class="container">
        <div class="row vertical-offset-100">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">                                
                        <div class="row-fluid user-row">
                            <img src="http://i.imgur.com/77eUFed.png" class="img-responsive" style="height:20%;" alt="Conxole Admin"/>
                        </div>
                    </div>
                    <div class="panel-body">
                        <s:form action="connexion/Login" theme="bootstrap" cssClass="form-signin">
                            <fieldset>
                                <label class="panel-login">
                                    <div class="login_result"></div>
                                </label>
                                <!--<s:text name="Form.login.title" />-->
                                <s:textfield name="username"  placeholder="%{getText('username')}" id="username" required="true" />
                                <s:password name="password"  placeholder="%{getText('password')}" id="password" required="true" />
                                <s:submit class="btn btn-lg btn-success btn-block" id="login" value="Log in"/>
                                <s:url id="url" action="Register" />
                                <s:a href="%{url}"><s:text name="Form.registration.title" /></s:a>
                            </fieldset>
                        </s:form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $("document").ready(function() {
           $(".errorMessage")
                   .css("font-weight", "bold")
                   .css("color", "red");
        });
    </script>
</body>
</html>