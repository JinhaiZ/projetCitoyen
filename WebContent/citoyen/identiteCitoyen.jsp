<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"  scope="session" />

<!--- 
  **** les 4 propriétés du bean nom, identifiant, mail, motPasse doivent être initialisées 
        par la page, en utilisant le "jsp:setProperty "
-->


 <%!
	ResultSet rset = null;
 %>
 <!--  definition de la base dans le bean et recherche du Citoyen  dans la base par le bean -->
<%
 	gerelesCitoyen.ouverture("demandecitoyen");
 /*
**  Recherche de la personne dans la base par le bean, méthode recherchePersonne()
**
**      s'il n'est pas   trouvé et que le mail et le nom ne sont pas présents
**                         appel à la page d'inscription "index.jsp"
**      s'il n'est pas   trouvé et que le mail et le nom sont présents
**                         inscription méthode inscrireUtilisateur()
*/               
 







/*
** Arrivé ici, on sait que la personne est inscrite, on recherche ses caractéristiques par recherchePersonne()
** et on met en variable de session, (gardez les mêmes noms pour la suite)
**              id, nom, prenom, mobile, fixe, rue, ville, eidentifiant, mail, fonction
*/







/*
** si c'est un administrateur : appel à la page  "gereDemandeCitoyen.jsp"
** si c'est un citoyen appel à la page  mesInformationsPersonnelles.jsp
*/




 	
%>
