<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"  scope="session" />

<!--- 
  **** les 4 propriétés du bean nom, identifiant, mail, motPasse doivent être initialisées 
        par la page, en utilisant le "jsp:setProperty "
-->
<jsp:setProperty property="*" name="gerelesCitoyen"/> 



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
	boolean isExist = gerelesCitoyen.recherchePersonne();
	System.out.println(isExist);
	if(!isExist) {
		// on n'a pas trouve utilisateur
		System.out.println(gerelesCitoyen.getNom());
		if(gerelesCitoyen.getNom() != null && gerelesCitoyen.getMail() != null) {
			// les champs de nom et mail sont present
			System.out.println("nom et email sont present");
			// inscrire utilisateur
			gerelesCitoyen.inscrireUtilisateur();
			// recuperer toutes les info sauf mot de passe
			HashMap<String, String> info = gerelesCitoyen.rechercheToutesInfoPersonne();
			for (Map.Entry<String, String> entry : info.entrySet())
			{
			    session.setAttribute(entry.getKey(), entry.getValue());
			}
			%>
			<jsp:forward page="mesInformationsPersonnelles.jsp" />
			<%
		} else {
			// les champs de nom et mail ne sont pas present
			System.out.println("nom et email ne sont pas present");%>
			<jsp:forward page="index.jsp" >
			 <jsp:param name="erreur" value="mauvaisIdentification" ></jsp:param>
			</jsp:forward> 
		<% }
	} else {
		// on a trouve l'utilisateur
		gerelesCitoyen.rechercheToutesInfoPersonne();
		// recuperer toutes les info sauf mot de passe
		HashMap<String, String> info = gerelesCitoyen.rechercheToutesInfoPersonne();
		for (Map.Entry<String, String> entry : info.entrySet())
		{
		    session.setAttribute(entry.getKey(), entry.getValue());
		}
		String monFonction = info.get("fonction");
		System.out.println(monFonction);
		if(monFonction.equals("citoyen")) {
			// appel mesInformationsPersonnelles.jsp 
		%>
			<jsp:forward page="mesInformationsPersonnelles.jsp" />
		<%}
		if(monFonction.equals("administrateur")) {
			// appel gereDemandeCitoyen.jsp %>
			<jsp:forward page="gereDemandeCitoyen.jsp" />
		<%}
	}
	

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
