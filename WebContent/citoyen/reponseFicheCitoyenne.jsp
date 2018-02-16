<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="ouvreBase1.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" >
  </head>
  <body   class= "CaseGrise" >
  <%@ include file="accesmenuFicheAdministration.jspf" %>  

  
 <!-- 
* Sur une   ligne vous mettez le numéro de la fiche et son objet.
*    Puis sa description
*    Puis un " TEXTAREA" pour écrire la réponse.
*            Enfin deux boutons, un pour "validez" et l'autre pour "abandonner".
*     Le bouton "validez" appelle la page "gereBaseReponse" qui écrit tout simplement la réponse 
*           dans la table fiche de la base de données.
*     Le bouton "abandonner" appelle la page gereDemandeCitoyen.jsp
-->
<c:set var = "id" value="${param.numeroDemande}" />

<sql:query var="result" dataSource="${conn1}">
	select * from fiche where id="${id}"
</sql:query>

<c:forEach items="${result.rows}" var="row">
<form action="gestionBaseReponse.jsp" method="post">
<table width="800" class="CaseGrise1" style ="border:0px">
	<tr>
		<td>
			<input type="hidden" name=numFiche value=<c:out value="${id}"></c:out> />
			Id:&nbsp;<c:out value="${id}"></c:out>
			&nbsp;&nbsp;Objet:&nbsp;<c:out value="${row.objet}"></c:out>
		</td>
	</tr>
	<tr>
		<td>
			Description:<c:out value="${row.description}"></c:out>
		</td>
	</tr>
	<tr>
		<td>
			<h2>Réponse: </h2><textarea rows="15" cols="100" name="reponse"></textarea>
		</td>
	</tr>
</table>
<button type="submit" name="valider" value="true" style="width: 90px">valider</button>

</form>
<a href="gereDemandeCitoyen.jsp"><button style="width: 90px">abandonner</button></a>
</c:forEach>
</body>
</html>
