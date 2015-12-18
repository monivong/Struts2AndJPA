<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="not #session['connecte']">
<jsp:forward page="login.jsp"></jsp:forward>
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
    <h2 style="font-size: 36px; ">Commentaires du livre <s:property value="monLivre.isbn" />[<s:property value="monLivre.titre" />] </h2>
    <table class="table table-bordered">
        <tr>
            <th>Note</th>
            <th>Commentaire</th>
        </tr>
	<s:iterator value="maListeDesCommentaires">
            <tr>
                <td><s:property value="note"/></td>
                <td><s:property value="commentaire" /></td>
            </tr>
	</s:iterator>
    </table>
    <div class="col-md-4">
    <div class="panel panel-default">                    
        <div class="panel-heading">          
            <h3>Ajouter une évaluation :</h3>
        </div>
        <div class="panel-body">
            <s:form action="SubmitEvaluation">
                <s:textfield name="uneNote" placeholder="Note" class="form-control" value="" required="true" />
                <s:textfield name="unCommentaire" placeholder="Commentaire" class="form-control" required="true" />          
                <s:hidden name="monLivre.isbn" />
                <s:submit class="form-control" value="Soumettre évaluation"/>   	  
            </s:form>
        </div>
    </div>
    </div>
</div>
</body>
</html>
