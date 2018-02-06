<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="ouvreBase1.jsp" %>  

<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML >
<html>
<head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" >
</head>
 <body   class= "CaseGrise" >

<%@ include file="accesmenuFiche.jspf" %>  
<%    
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee(); 
%>
<%@ include file="ligneIdentification.jspf" %> 




<!-- 
*	 une ligne par fiche, 
*   cette  ligne comprend : le numéro de la fiche (id), l'objet de la fiche, 
*               la date de création de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*	Avec le numéro de la fiche vous mettez 
*          un lien vers la page d'affichage du contenu de la fiche : ficheCitoyenne.jsp
-->
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

<sql:query var="fiches" dataSource="${conn1}">
	select * from fiche
</sql:query>

<table>
  <tr>
    <th>Numéro</th>
    <th>Objet</th>
    <th>Date de création</th>
  </tr>
  <c:forEach items="${fiches.rows}" var="row"> 
  <tr>
	<c:url var="url" scope="session" value="ficheCitoyenne.jsp">
   		<c:param name="numeroDemande" value="${row.id}" />
    </c:url>
    <td><a href="${url}">${row.id}</a></td>
    <td>${row.objet}</td>
    <td>${row.datedemande}</td>
  </tr>
</c:forEach>
</table>

  </body>
</html>
