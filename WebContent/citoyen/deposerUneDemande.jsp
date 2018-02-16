<%@ page import="java.util.*"%>
<%@ page import="utile.DateBean"%>
<jsp:useBean id="laDate" class="utile.DateBean" scope="session" />
<!DOCTYPE  HTML>
<html>
  <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Demande Citoyenne Mairie Loc-Maria-Plouzané</title>
  <link type="text/css" href="../style/deco.css" rel="stylesheet" />
  <script type="text/javascript" language="javascript">
	function ClearForm(){
    document.MyForm.reset();
	}
  </script>
  </head>
  <body   class= "CaseGrise" onload="ClearForm()">
  <%@ include file="accesmenuFiche.jspf" %>  
<%
String nom= (String)session.getAttribute("nom");
String identifiant= (String)session.getAttribute("identifiant");
String dateDemande = laDate.getJour() + "/" + laDate.getMois() + "/" + laDate.getAnnee(); 
String dateDemandemysql = laDate.getAnnee()+ "/" + laDate.getMois() + "/" + laDate.getJour();
System.out.format("deposerUneDemande, dateDemandemysql=%s\n", dateDemandemysql);

%>
<%@ include file="ligneIdentification.jspf" %> 


 <!--
*partie 1
* Vous   ajoutez une table comprenant un formulaire avec
*	un champ input texte "Objet"  (max 100 caractères).
*	Un champ textArea  "Description" ( 100 colonnes, 15 lignes) 
*	Et deux boutons "valider" et "abandonner"
* Le bouton "valider" appelle la page gestionBasedemande.jsp avec le contenu du formulaire, 
* cette page enregistre cette fiche dans la table "fiche", avec une référence au citoyen qui l'écrit.
* Le bouton "abandonner" vous ramène à une page d'accueil, par exemple "mesInformationsPersonelles.jsp", ou une autre
* vous passez aussi en paramètre : dateDemande et dateDemandemysql

 -->
 
<form action="gestionBaseDemande.jsp" method="get" name="MyForm">
<table width="800" class="CaseGrise1" style ="border:0px">
	<tr>
		<td>
			Objet <input type="text" name="objet" pattern=".{1,100}">
		</td>
	</tr>
	<tr>
		<td>
			Description
		</td>
	</tr>
	<tr>
		<td>
			<textarea rows="15" cols="100" name="description"></textarea>
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" name="dateDemande" value="<%= dateDemande %>" />
			<input type="hidden" name="dateDemandemysql" value="<%= dateDemandemysql %>" />
			<button type="submit" name="valider" value="true" style="width: 90px">valider</button>
			<button type="submit" name="valider" value="false" style="width: 90px">abandonner</button>
			<button type="submit" name="ajoutdoc" value="true">validez en ajoutant un document</button>
		</td>
	</tr>
</table>
</form>

 <!--
*partie 2
* Rajoutez  dans le formulaire de la page deposerUneDemande.jsp un bouton supplémentaire  
  " validez en ajoutant un document",  de nom "ajoutdoc"
   il appelle aussi la page gestionBasedemande.jsp
   il permettra de savoir qu'il faut joindre un document 
  (pdf, word, excel, jpg, etc..) à la  fiche.
*
-->





<table  class="CaseGrise1" style= "width:800;" > 
<tr> <td class="Casebleu14">
 Si vous voulez illustrer vos propos par une photo, vous cliquez sur "valider en ajoutant une photo".
Attention sa taille doit être inférieure à 200 koctets, vous avez des logiciels pour réduire la taille d'une image :
waibeImage, image resizer, light image resizer, etc.. Pour les documents, la limite est de 500 koctets.  
</td>
</tr>
 </table>   
  </body>
</html>
