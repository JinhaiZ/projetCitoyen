
<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML >
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzanéé</title>
     <link type="text/css" href="../style/deco.css" rel="stylesheet" >
  </head> 
  <body   class= "CaseGrise" >
  <%@ include file="accesmenuFiche.jspf" %>  
  <%  
int numFiche = Integer.parseInt( request.getParameter("numeroDemande") );  
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String mail=(String)session.getAttribute("mail");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
request.setAttribute("id", numFiche);
%>
  <%@ include file="ligneIdentification.jspf" %> 
  <%@ include file="ouvreBase1.jsp" %>  



<!-- 
*  recherche des caractéristiques de la fiche dans la base 
-->

<sql:query var="result" dataSource="${conn1}">
	select * from fiche where id="${id}"
</sql:query>

<c:forEach items="${result.rows}" var="row">
<table style= "width:400;"    class="Casebleu" >
	
	<tr>
	  <td width="100"  class="Casebleu1" > <p> <b> Objet : ${row.objet}</b>  </p>  </td>
	<!-- 
	*              affichage  objet
	-->
	</tr>
</table>
	<p>Détail de votre demande </p>
	<table style= "width:400;"    class="Casebleu">
		 <!-- 
	* et affichage  description et réponse
	-->
	<tr>
		<td width="500"  class="Casebleu1">  <p> <b> Description : ${row.description} </b>  </p></td>	
	</tr>
	<tr>
		<td width="500"  class="Casebleu1"> <p> <b> Réponse : ${row.response} </b>  </p> </td>	
	</tr>

</table>    
</c:forEach>
</body>
</html>
