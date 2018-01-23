<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
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

 



  </body>
</html>
