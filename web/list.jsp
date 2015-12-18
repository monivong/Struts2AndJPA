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
            <table id="table" class="table table-hover table-bordered">
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
                    <tr class="livre">
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
                            <s:a href="%{url}"><i class="fa fa-pencil-square"></i></s:a>
                        </td>
                    </tr>
                </s:iterator>     
            </table>
            <div style="text-align: center;">
                <ul class="pagination"></ul>
            </div>
            <s:url id="url" action="AddBook" />
            <s:a href="%{url}">Ajouter un livre</s:a>  
        </div>
    </body>
    <script>        
        $("document").ready(function() {
            var nombreDeLivres = $(".livre").length;
            $(".livre:lt("+nombreDeLivres+")").hide();
            showBooks(1);
            //$("#myPagination").append("<ul class=\"pagination\">");
            var nombreDeLivresParPage = nombreDeLivres/5;
            for (i=1; i<nombreDeLivresParPage+1; i++)
            {
                $(".pagination").append("<li><a href=\"#table\" onclick=\"showBooks("+i+")\"\">"+i+"</a></li>");
            }
            $('a[href*=#]:not([href=#])').click(function() {
                if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                  var target = $(this.hash);
                  target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                  if (target.length) {
                    $('html,body').animate({
                      scrollTop: target.offset().top
                    }, 500);
                    return false;
                  }
                }
              });
        });    
        function showBooks(i) {
            $(".livre").hide();
            var show = i*5 ;
            $(".livre:lt("+show+")").show();
            if (i > 1){
                var hide = show - 5;
                $(".livre:lt("+hide+")").hide();
            }
        }
    </script>
</html>
