<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<style>
<!--
#menu li {display : inline; padding : 5px; border : solid 1px blue; margin : 1px; background-color : #339;}
ul a {text-decoration:none;color : white;}
a:hover {color : red;}
-->
</style>
<div class="alert alert-warning">
    <s:actionmessage />
</div> 
<s:if test="#session['connecte']">
    
</s:if>
<s:else>
<ul>
    <li>
        <s:url id="url" action="Login" />
        <s:a href="%{url}">Login</s:a>
    </li>
</ul>
</s:else>
