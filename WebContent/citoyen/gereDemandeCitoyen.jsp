<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="ouvreBase1.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzan�</title>
  <link type="text/css" href="../style/deco.css" rel="stylesheet" >
  <style>
	tr:nth-child(even) {
    background-color: #dddddd;
	}
  </style>
</head>
<body   class= "CaseGrise" >
 <%@ include file="accesmenuFicheAdministration.jspf" %>  
  <%  
String ajoutdoc = request.getParameter("ajoutdoc");
String docmise = request.getParameter("docmise");

String identifiant= (String)session.getAttribute("identifiant");
String reponse = null;
String objet = null;
boolean traite = false;
String description = null;
int numboucle = 0;
  
%>


<br/>

  <!--
*	  une liste des fiches qui n'ont pas �t� trait�es (champs r�ponse inexistant),
*	  une liste des fiches trait�es.  
*  Dans ces deux listes vous mettez :
*	  une ligne par fiche, cette  ligne comprend : le num�ro de la fiche (id), l'objet de la fiche, la date de cr�ation de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*  Avec le num�ro de la fiche vous mettez un lien vers la page "reponseFicheCitoyenne.jsp" qui permet d'�crire la r�ponse �  la fiche, 
-->
<sql:query var="fiches" dataSource="${conn1}">
	select * from fiche
</sql:query>

<!-- une liste des fiches qui n'ont pas �t� trait�es (champs r�ponse inexistant) -->
<h1>Fiches non trait�es:</h1>
<table border="1" width="800" class="Casebleu0">
	<tr>
	   <th>Num�ro</th>
	   <th>Objet</th>
	   <th>Date de cr�ation</th>
	 </tr>
	<c:forEach items="${fiches.rows}" var="row"> 
	  <tr>
	  	<c:if test = "${empty row.reponse}">
		<c:url var="url" scope="session" value="reponseFicheCitoyenne.jsp">
	   		<c:param name="numeroDemande" value="${row.id}" />
	    </c:url>
	    <td><a href="${url}">${row.id}</a></td>
	    <td>${row.objet}</td>
	    <td>${row.datedemande}</td>
	    </c:if>
	  </tr>
	</c:forEach>
</table>

<br/>

<!-- une liste des fiches trait�es -->
<h1>Fiches trait�es:</h1>
<table border="1" width="800" class="Casebleu1">
	<tr>
	   <th>Num�ro</th>
	   <th>Objet</th>
	   <th>Date de cr�ation</th>
	 </tr>
	<c:forEach items="${fiches.rows}" var="row"> 
	  <tr>
	  	<c:if test = "${not empty row.reponse}">
		<c:url var="url" scope="session" value="reponseFicheCitoyenne.jsp">
	   		<c:param name="numeroDemande" value="${row.id}" />
	    </c:url>
	    <td><a href="${url}">${row.id}</a></td>
	    <td>${row.objet}</td>
	    <td>${row.datedemande}</td>
	    </c:if>
	  </tr>
	</c:forEach>
</table>

</body>
</html>
