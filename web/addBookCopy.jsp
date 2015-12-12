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
    </head>
    <body>
        <h3>MyBooKs manager</h3>
        <s:include value="menu.jsp"></s:include>	
        Ajoutez un exemplaire :
        <s:actionmessage/>
        <s:form action="AddBookCopy">
                  <s:textfield name="livre.isbn" label="ISBN" required="true" />
                  <s:textfield name="livre.titre" label="Titre" />
                  <s:textfield name="livre.auteur" label="Auteur" />
                  <s:textfield name="livre.proprietaire" label="proprietaire" />
                  <s:submit value="Ajouter"/>   	  
        </s:form>
    </body>
</html>
