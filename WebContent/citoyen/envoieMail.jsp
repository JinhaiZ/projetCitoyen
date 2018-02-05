<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"
	scope="session" />
<%
	/*
	
	Pour envoyer un mail, il faut en général disposer d'un opérateur (serveur et port) 
	  qui dispose d'un serveur d'envoi de mail (serveur SMTP), et d'un compte chez cet opérateur.
	   
	Une exception est parfois permise, par exemple si vous êtes sur un réseau local derrière une 
	 livebox (ou autre), dans ce cas vous avez la possibilité d'envoyer un mail 
	 sans vous identifier et sans donner l'opérateur, en effet la livebox a son opérateur, 
	 et si vous y êtes connecté c'est que vous y avez un compte. 
	 Dans ce cas, utilisez   la méthode  de GéreCitoyen.envoieMail :
	
	public static void envoieMail( String objet, String deLaPart, String pour , String contenu) 
	   ici deLaPart  est une adresse mail correcte, que vous pouvez donner. 
	
	Dans le cas plus général, par exemple si vous voulez passez par le serveur SMTP de l'école 
	c'est la méthode de GereCitoyen.envoieMailSecure :
	
	  public static void envoieMailSecure( String objet, String deLaPart, String pour , String contenu, String motpasse, String host, String port) {
	
	   Dans ce cas, 
	     host et port désignent le serveur smtp d'un opérateur et le port associé
	    deLaPart  et  motpasse désignent une adresse mail et son mot de passe chez cet opérateur;
	
	Dans cette méthode, au premier passage vous devrez donc donner ces indications.
	
	Par la suite ces informations (deLaPart , motpasse, serveur, port) sont stockées 
	  dans des variables de session et il est donc inutile de les demander.
	
	Voici donc les trois parties de cette page :
	
	   1) Si à l'appel de la page,  les variables de session qui représentent  
	   l'adresse mail et le mot de passe de l'expéditeur: ne sont pas connues 
	   et que ces informations ne sont pas en paramètre  (envoyeurconnu = null) , 
	     un formulaire est envoyé pour   demander 
	  l'adresse mail, 
	le mot de passe, 
	le serveur,  par defaut     "z.imt.fr"  et 
	le port   par defaut  "587" , 
	ce formulaire a un bouton submit, de nom envoyeurconnu, 
	l'action de ce formulaire est la page courante.
	   
	Attention, l'envoi d'un formulaire, c'est une autre requête, 
	    donc nouveaux paramètres, 
	    or dans la première requête il y avait selon le cas un paramètre " nomDocument". 
	
	Il faut donc faire suivre cette valeur ("partie "hidden")*/

	String identifiantMail = (String) session.getAttribute("identifiantMail");
	String mdp = (String) session.getAttribute("motPasseMail");
	String host = (String) session.getAttribute("host");
	String port = (String) session.getAttribute("port");

	if ((identifiantMail == null || mdp == null) && request.getParameter("envoyeurconnu") == null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EnvoieMail</title>
<link type="text/css" href="../style/deco.css" rel="stylesheet">
<style type="text/css">
td {
	width: 300px;
}
</style>
<form name="envoiMail" method="POST" action="envoieMail.jsp">
	<table style="width: 500;" class="Casebleu1">
		<tr>
			<td colspan="2"><strong>Remplir les informations avant</strong></td>
		</tr>
		L'identifiant Mail:
		<input type="text" name="identifiantMail">
		<br /> Le mot de passe Mail:
		<input type="password" name="motPasseMail" pattern=".{1,100}">
		<br /> Host:
		<input type="text" value="z.imt.fr" name="host">
		<br /> Port:
		<input type="text" value="587" name="port">
		<br />

		<tr>
			<td colspan="2">
				<button name="envoyeurconnu" type="submit" value="se connecter"
					style="width: 120px">Envoyer</button>
			</td>
		</tr>
	</table>
</form>
</body>





</html>

<%
	} else if ((identifiantMail == null || mdp == null) && request.getParameter("envoyeurconnu") != null) {
		System.out.println("set sessions for sending mail");

		identifiantMail = request.getParameter("identifiantMail");
		mdp = request.getParameter("motPasseMail");
		host = request.getParameter("host");
		port = request.getParameter("port");

		session.setAttribute("identifiantMail", identifiantMail);
		session.setAttribute("motPasseMail", mdp);
		session.setAttribute("host", host);
		session.setAttribute("port", port);

		// send mail
		host = (host == null) ? "z.imt.fr" : host;
		port = (port == null) ? "587" : port;

		Fiche fiche = gerelesCitoyen.getLastFiche();
		String object = fiche.objet;
		String contenu = fiche.contenu;
		String demandeur = fiche.demandeur;
		String mailDemandeur = fiche.mailDemandeur;

		System.out.println("DB object:" + object);
		System.out.println("DB contenu:" + contenu);
		System.out.println("DB demandeur: " + demandeur);
		System.out.println("DB mailDemandeur: " + mailDemandeur);

		utile.GereCitoyen.envoieMailSecure(object, identifiantMail, mailDemandeur, contenu, mdp, host, port);
	} else {
		System.out.println("all in sessions for sending mail");
		// send mail
		host = (host == null) ? "z.imt.fr" : host;
		port = (port == null) ? "587" : port;

		Fiche fiche = gerelesCitoyen.getLastFiche();
		String object = fiche.objet;
		String contenu = fiche.contenu;
		String demandeur = fiche.demandeur;
		String mailDemandeur = fiche.mailDemandeur;

		System.out.println("DB object:" + object);
		System.out.println("DB contenu:" + contenu);
		System.out.println("DB demandeur: " + demandeur);
		System.out.println("DB mailDemandeur: " + mailDemandeur);
		
		System.out.println("mdp: " + mdp);

		utile.GereCitoyen.envoieMailSecure(object, identifiantMail, mailDemandeur, contenu, mdp, host, port);
	}

	/*
	2) Si à l'appel de la page,  
	   les variables de session qui représentent  l'adresse mail et le mot de passe de l'expéditeur: 
		   ne sont pas connues, mais que vous revenez du formulaire, (envoyeurconnu présent) :
	   Vous mettez les variables (adresseMail, motPasse, serveur, port) en session.
	   
	
	
	3) Si les variables de session qui représentent  l'adresse mail et le mot de passe de l'expéditeur 
	sont connues (vous venez de les créer ou vous les avez créées lors d'un autre appel), 
	vous pouvez envoyer le mail.
	
	
	
	Envoi du mail :
	     Recherche dans la base de la dernière fiche de la personne connectée
	     Recherche des caractéristiques de cette fiche et du mail de la personne connectée
	
	     Le mail contient en objet, l'objet de la fiche.
	     et en contenu, le texte que vous voulez et le champ description de la fiche
	S'il y a eu un document avec la fiche, le nom de ce document
	
	*/
%>