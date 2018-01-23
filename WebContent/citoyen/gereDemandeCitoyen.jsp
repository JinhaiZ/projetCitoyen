<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/dbtags" prefix="sql"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" >
</head>
<body   class= "CaseGrise" >
 <%@ include file="accesmenuFicheAdministration.jspf" %>  
  <%  
String ajoutdoc = request.getParameter("ajoutdoc");
String docmise = request.getParameter("docmise");
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String reponse = null;
String objet = null;
boolean traite = false;
String description = null;
int numboucle = 0;
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();    
%>

 


<table border="1" width="800" class="Casebleu1" >  
<tr>
<td>
 <h2> Personne connectée : <%= nom %>  &nbsp;&nbsp; </h2>
 </td><td>
<h2> Date courante:  <%=dateDemande%> </h2>
</td>
</tr>
</table>
<p>   

  <!--
*	  une liste des fiches qui n'ont pas été traitées (champs réponse inexistant),
*	  une liste des fiches traitées.  
*  Dans ces deux listes vous mettez :
*	  une ligne par fiche, cette  ligne comprend : le numéro de la fiche (id), l'objet de la fiche, la date de création de la fiche. 
*     Pour que ce soit plus lisible, alternez entre deux couleurs sur les lignes.
*  Avec le numéro de la fiche vous mettez un lien vers la page "reponseFicheCitoyenne.jsp" qui permet d'écrire la réponse à  la fiche, 
-->




</body>
</html>
