<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="not #session['connecte']">
<jsp:forward page="login.jsp"></jsp:forward>
</s:if>
<html>
<head>
    <title>MyBooKs</title>
    <link href="css/bootstrap.css" rel="stylesheet" />    
    <script src="js/bootstrap.js"></script>
</head>
<body>
<h3>MyBooKs manager</h3>
<s:include value="menu.jsp"></s:include>	
<h4>Liste des livres</h4>
<table border="1" cellspacing="0">
     <tr>
         <th>ISBN</th>
         <th>Titre</th>
         <th>Auteur(s)</th>
     </tr>
<s:iterator value="bookList">
     <tr>
         <td><s:property value="isbn" /></td>
         <td><s:property value="titre" /></td>
         <td><s:property value="auteur" /></td>
         <td>
	        <s:url id="url" action="CommentBook">
                    <s:param name="livre.isbn"><s:property value="isbn" /></s:param>
	        </s:url>
	        <s:a href="%{url}">Commentaires</s:a>
         </td>
     </tr>
</s:iterator>
</table>
    <table border="1" class="table table-striped table-hover">
        <tr>
            <th>ISBN</th>
            <th>Titre</th>
            <th>Edition</th>
            <th>Annee</th>
            <th>Mots-Cles</th>
            <th>Nom de l'auteur</th>
            <th>Etat</th>
            <th>Description</th>
            <th>NbPages</th>
            <th>Note</th>
        </tr>
        <s:iterator value="maListeDesLivres">
            <tr>
                <td><s:property value="isbn" /></td>
                <td><s:property value="titre" /></td>
                <td><s:property value="edition" /></td>
                <td><s:property value="annee" /></td>
                <td><s:property value="motsCles" /></td>
                <td><s:property value="nomAuteur" /></td>
                <td><s:property value="etat" /></td>
                <td><s:property value="description" /></td>
                <td><s:property value="nbPages" /></td>
                <td><s:property value="note" /></td>
                <td>
                    <s:url id="url" action="AddBookEvaluation">
                        <s:param name="monLivre.isbn"><s:property value="isbn" /></s:param>
                        <s:param name="monLivre.titre"><s:property value="titre" /></s:param>
                    </s:url>
                    <s:a href="%{url}">Évaluer</s:a>
                </td>
            </tr>
        </s:iterator>     
    </table>
    <s:url id="url" action="AddBook" />
    <s:a href="%{url}">Ajouter un livre</s:a>    
</body>
</html>
