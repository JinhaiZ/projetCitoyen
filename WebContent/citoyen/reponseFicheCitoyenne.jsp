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
String nom= (String)session.getAttribute("nom");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();    
%>
<table border="1" width="800" class="Casebleu1" >  
<tr>
<td><h2> Personne connectée : <%= nom %>  &nbsp;&nbsp; </h2>
 </td><td>
          <h2> Date courante:  <%=dateDemande%> </h2>
</td>
</tr>
</table>  
  
 <!-- 
* Sur une   ligne vous mettez le numéro de la fiche et son objet.
*    Puis sa description
*    Puis un " TEXTAREA" pour écrire la réponse.
*            Enfin deux boutons, un pour "validez" et l'autre pour "abandonner".
*     Le bouton "validez" appelle la page "gereBaseReponse" qui écrit tout simplement la réponse 
*           dans la table fiche de la base de données.
*     Le bouton "abandonner" appelle la page gereDemandeCitoyen.jsp
 
 

 
  --> 
  


</body>
</html>
