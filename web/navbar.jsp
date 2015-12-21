<%@ taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="./">Gestionnaire de livre Rosemont</a>
      </div>
      <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <s:if test="#session['connecte']">
                <li>
                    <s:url id="url" action="ListBooks" />
                    <s:a href="%{url}">Liste des livres</s:a>
                </li>
                <li>
                    <s:url id="url" action="AddBook" />
                    <s:a href="%{url}">Ajouter un livre</s:a>
                </li>
                <li>
                    <s:url id="url" action="AddBookCopy" />
                    <s:a href="%{url}">Ajouter un exemplaire</s:a>
                </li>
                <li>
                    <s:url id="url" action="Logout" />
                    <s:a href="%{url}">Logout</s:a>
                </li>
            </s:if>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
                Langue<span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
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
          </li>
        </ul>
      </div><!--/.nav-collapse -->
    </div>
    <img src="http://i.imgur.com/77eUFed.png" class="img-responsive" style="position: absolute; height:35px; right:6%; top:8px; z-index: -1;" alt="Conxole Admin"/>
</nav>
