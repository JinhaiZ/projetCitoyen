<%@ page isELIgnored="false"%>
<%@ page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix ="tags" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>identification créateur de fiche d'intervention</title>
<link type="text/css" href="style/deco.css" rel="stylesheet">

</head>
<body>
	<img src="image/logo.jpg" width="500">
	<h3>Service de relation avec les Citoyens</h3>
	<h3>Gestion des fiches citoyens</h3>
	<!--  avant l'identification on efface toutes les données des sessions précédentes -->
	<%
	session.invalidate();
	%>
	<!-- 
   Affichage d'un message si le parametre "erreur" est présent
   Affichage d'un message si le parametre "finsession" est présent
-->

	<%
		if (request.getParameter("erreur") != null) {
			out.println("<p style='color:red;'> Mauvaise Identification.</p>");
		}
		if (request.getParameter("finsession") != null) {
			out.println("<p style='color:red;'> Mauvaise Session.</p>");
		}
	%>
	<%
	// use LinkedHashMap to keep the order of the form
	LinkedHashMap<String, String[]> ligneTexte = new LinkedHashMap<String, String[]>();
	ligneTexte.put("identifiant", new String[]{"text", "Identifiant", ".{4,10}"});
	ligneTexte.put("motPasse", new String[]{"password", "Mot de Passe"});
	ligneTexte.put("nom", new String[]{"text", "Nom", ".{4,10}"});
	ligneTexte.put("mail", new String[]{"text", "Mail", "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$"});
	ligneTexte.put("connexion", new String[]{"submit", "Envoyer"});

	request.setAttribute("ligneTexte", ligneTexte);
	%>
	<h2>Veuillez vous identifier ou créer un compte</h2>
	<tags:formulaire couleur="#c0ebe7" action="identiteCitoyen.jsp" 
	methode="get" taille="30" ligneTexte="${ligneTexte}" />
</body>
</html>
