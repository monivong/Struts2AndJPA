<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="not #session['connecte']">
<jsp:forward page="login.jsp"></jsp:forward>
</s:if>
<html>
<head>
    <title>MyBooKs</title>    
</head>

<body>
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
        <s:textfield name="uneNote" label="Note" required="true" />
        <s:textfield name="unCommentaire" label="Commentaire" required="true" />          
        <s:hidden name="livre.isbn" />
        <s:submit value="Go"/>   	  
    </s:form>
    
    <hr />
    
    <h4>Commentaires du livre <s:property value="monLivre.isbn" />[<s:property value="monLivre.titre" />] </h4>
    <table border="1">
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
        <s:textfield name="uneNote" label="Note" required="true" />
        <s:textfield name="unCommentaire" label="Commentaire" required="true" />          
        <s:hidden name="monLivre.isbn" />
        <s:submit value="Soumettre évaluation"/>   	  
    </s:form>
</body>
</html>
