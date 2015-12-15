<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="not #session['connecte']">
<jsp:forward page="login.jsp"></jsp:forward>
</s:if>
<html>
<head>
    <title>MyBooKs</title>    
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
    <h4>Commentaires du livre <s:property value="livre.isbn" />[<s:property value="livre.titre" />] </h4>
    <ul>
            <s:iterator value="commentaires">
                <li><s:property /></li>
            </s:iterator>
    </ul>
    Ajouter une évaluation :
    <s:form action="CommentBook">
        <s:textfield name="uneNote" placeholder="Note" class="form-control" value="" required="true" />
        <s:textfield name="unCommentaire" placeholder="Commentaire" class="form-control" required="true" />          
        <s:hidden name="livre.isbn" />
        <s:submit class="form-control" value="Go"/>   	  
    </s:form>
    
    <hr />
    
    <h4>Commentaires du livre <s:property value="monLivre.isbn" />[<s:property value="monLivre.titre" />] </h4>
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
    Ajouter une évaluation :
    <s:form action="SubmitEvaluation">
        <s:textfield name="uneNote" placeholder="Note" class="form-control" value="" required="true" />
        <s:textfield name="unCommentaire" placeholder="Commentaire" class="form-control" required="true" />          
        <s:hidden name="monLivre.isbn" />
        <s:submit class="form-control" value="Soumettre évaluation"/>   	  
    </s:form>
</div>
</body>
</html>
