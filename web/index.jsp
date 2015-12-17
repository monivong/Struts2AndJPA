<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
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
            <s:include value="menu.jsp"></s:include>	            
            <div class="well well-sm">
                <h1 style="text-align:center">Mon gestionnaire des livres</h1>
                <h3>Cette application vous permet d'effectuer un meilleur suivi des différents livres.</h3>
                <p>Utilisez le menu pour accéder aux fonctionnalités.</p>
            </div>
        </div>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
              <li data-target="#myCarousel" data-slide-to="1"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
              <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
              <div class="item active">
                <img src="http://i.imgur.com/E3AnvRt.jpg" alt="Bootstrap">
                <div class="carousel-caption">
                  <h3>Bootstrap</h3>
                  <p>Pour un site professionel !!</p>
                </div>
              </div>
              <div class="item">
                  <img src="http://i.imgur.com/Gjy6fsT.jpg" alt="AngularJS" height="10">
                <div class="carousel-caption">
                  <h3>AngularJS</h3>
                  <p>AJAX n'a jamais été aussi facile !!</p>
                </div>
              </div>
              <div class="item">
                <img src="http://i.imgur.com/QVAfhl5.jpg" height="20" alt="Struts 2">
                <div class="carousel-caption">
                  <h3>Struts 2</h3>
                  <p>Un autre Framework à apprendre...</p>
                </div>
              </div>
                <div class="item">
                    <img src="http://i.imgur.com/B1f79pQ.jpg" alt="Java">
                    <div class="carousel-caption">
                        <h3>Java</h3>
                        <p>Le nouveau langage au-dessus du trône !!</p>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        <div class="container-fluid">
            <h1>Message des programmeurs</h1> 
            <div class="row">
                <div class="span6">
                    <div class="panel-heading panel-primary">Alex Caumartin</div>
                    <div class="panel-body panel-success">Message d'Alex</div>
                </div>
                <div class="span6">
                    <div class="panel-heading panel-primary">Samnang Suon</div>
                    <div class="panel-body panel-success">Je suis très fier de notre travail !!</div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $(".panel-body").css("background-color", "white!important"); 
                $(".well").css("background-color", "#ffffcc").css("color", "black");
            });
        </script>
        <script type="text/css">
            /*CSS*/
            div.c-wrapper{
                width: 80%; /* for example */
                margin: auto;
            }
            .carousel-inner > .item > img, 
            .carousel-inner > .item > a > img{
                width: 100%; /* use this, or not */
                margin: auto;
            }
            // source de : http://stackoverflow.com/questions/19582340/make-bootstraps-carousel-both-center-and-responsive
                        
        </script>
    </body>
</html>
