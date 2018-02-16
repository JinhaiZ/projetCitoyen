<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.swing.JFileChooser"%>
<%@ page import="java.io.File"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="ouvreBase1.jsp" %> 
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE HTML>
<html>
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Document transférés par un citoyen</title>
	<link type="text/css" href="../style/deco.css" rel="stylesheet" >
	 <style>
	table {
	    font-family: arial, sans-serif;
	    border-collapse: collapse;
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
 <%!
 String trouveSuffixe (String fichier) {	
	 String suffixe;
	 int pos = fichier.lastIndexOf(".");
      if (pos > -1) 
      	     suffixe= fichier.substring(pos);
       else 
      	suffixe= fichier;
      return suffixe ;
 } 
 %>
</head>
  
<body   class= "CaseGrise" >
  <%@ include file="accesmenuFiche.jspf" %>  
  <%   
String  placeDocument = "../images/";
String nom= (String)session.getAttribute("nom");
int idfiche = 0;
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee();
String savefileDir = "file:///D:/JSP%202018/travail%202018/corrigeCitoyen/WebContent/images/";
request.setAttribute("imgPlace", placeDocument);
request.setAttribute("docPlace", savefileDir);
%>
    
<table border="1" style= "width:400;" class="Casebleu1" >  
<tr>
<td width="400"> Demandeur ou service :  nom : <%=  nom %>  </td>
<td>Date :  <%=dateDemande%> </td>
</tr>
</table>

<sql:query var="documents" dataSource="${conn1}">
	select * from document
</sql:query>
<!--  
* Donner la liste, des documents que la personne a téléchargés, un document par ligne.
*
* Sur cette ligne, vous mettez d'abord un icône donnant le type de document, par exemple pour le pdf : pdf.jpg ,
* pour une image une vignette de l'image (petite image), inutile de le faire pour tous les documents possibles.
* Puis le nom du fichier de ce document, associé à un lien html sur le fichier, 
* de façon qu'en cliquant dessus on puisse lire le document. 
-->
<table>
  <tr>
    <th>Type</th>
    <th>Nom</th>
  </tr>
  <c:forEach items="${documents.rows}" var="row"> 
  <c:set var="filename" value="${row.nom}" scope="session" />
  <c:set var="imgPath" value="${imgPlace}"></c:set>
  <c:set var="docPath" value="${docPlace}"></c:set>
  <tr>
    <td>
    <c:choose>
    <c:when  test = "${filename.substring(filename.lastIndexOf('.'), filename.length()).toLowerCase()  == '.pdf'}">
    	<img src=<c:out value="${imgPath.concat('pdf.jpg')}" /> alt="PDF" height="42" width="42"/>
	</c:when>
	<c:otherwise>
		file
	</c:otherwise>
    </c:choose>
   </td>
    <td><a href=<c:out value="${docPath}${filename}"/>>${filename}</a></td>
  </tr>
</c:forEach>
</table>


</body>
</html>
