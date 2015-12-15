<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="not #session['connecte']">
    <jsp:forward page="login.jsp"></jsp:forward>
</s:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddBookCopy</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
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
            <h3>MyBooKs manager</h3>
            <s:include value="menu.jsp"></s:include>	
            Ajoutez un exemplaire :
            <s:actionmessage/>
            <s:form action="SubmitBookCopy">
                <s:textfield name="monLivre.isbn" placeholder="ISBN" required="true" class="form-control" />
                <s:textfield name="monExemplaire.proprietaire.username" placeholder="Propriétaire" class="form-control" />
                <s:textfield name="monExemplaire.detenteur.username" placeholder="Détenteur" class="form-control" required="true"/>
                <s:submit class="form-control" value="Ajouter l'exemplaire"/>   	  
            </s:form>
        </div>
    </body>
</html>
