<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp"%>
<jsp:useBean id="gerelesCitoyen" class="utile.GereCitoyen"
	scope="session" />
<%
	/*
	
	Pour envoyer un mail, il faut en g�n�ral disposer d'un op�rateur (serveur et port) 
	  qui dispose d'un serveur d'envoi de mail (serveur SMTP), et d'un compte chez cet op�rateur.
	   
	Une exception est parfois permise, par exemple si vous �tes sur un r�seau local derri�re une 
	 livebox (ou autre), dans ce cas vous avez la possibilit� d'envoyer un mail 
	 sans vous identifier et sans donner l'op�rateur, en effet la livebox a son op�rateur, 
	 et si vous y �tes connect� c'est que vous y avez un compte. 
	 Dans ce cas, utilisez   la m�thode  de G�reCitoyen.envoieMail :
	
	public static void envoieMail( String objet, String deLaPart, String pour , String contenu) 
	   ici deLaPart  est une adresse mail correcte, que vous pouvez donner. 
	
	Dans le cas plus g�n�ral, par exemple si vous voulez passez par le serveur SMTP de l'�cole 
	c'est la m�thode de GereCitoyen.envoieMailSecure :
	
	  public static void envoieMailSecure( String objet, String deLaPart, String pour , String contenu, String motpasse, String host, String port) {
	
	   Dans ce cas, 
	     host et port d�signent le serveur smtp d'un op�rateur et le port associ�
	    deLaPart  et  motpasse d�signent une adresse mail et son mot de passe chez cet op�rateur;
	
	Dans cette m�thode, au premier passage vous devrez donc donner ces indications.
	
	Par la suite ces informations (deLaPart , motpasse, serveur, port) sont stock�es 
	  dans des variables de session et il est donc inutile de les demander.
	
	Voici donc les trois parties de cette page :
	
	   1) Si � l'appel de la page,  les variables de session qui repr�sentent  
	   l'adresse mail et le mot de passe de l'exp�diteur: ne sont pas connues 
	   et que ces informations ne sont pas en param�tre  (envoyeurconnu = null) , 
	     un formulaire est envoy� pour   demander 
	  l'adresse mail, 
	le mot de passe, 
	le serveur,  par defaut     "z.imt.fr"  et 
	le port   par defaut  "587" , 
	ce formulaire a un bouton submit, de nom envoyeurconnu, 
	l'action de ce formulaire est la page courante.
	   
	Attention, l'envoi d'un formulaire, c'est une autre requ�te, 
	    donc nouveaux param�tres, 
	    or dans la premi�re requ�te il y avait selon le cas un param�tre " nomDocument". 
	
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
	2) Si � l'appel de la page,  
	   les variables de session qui repr�sentent  l'adresse mail et le mot de passe de l'exp�diteur: 
		   ne sont pas connues, mais que vous revenez du formulaire, (envoyeurconnu pr�sent) :
	   Vous mettez les variables (adresseMail, motPasse, serveur, port) en session.
	   
	
	
	3) Si les variables de session qui repr�sentent  l'adresse mail et le mot de passe de l'exp�diteur 
	sont connues (vous venez de les cr�er ou vous les avez cr��es lors d'un autre appel), 
	vous pouvez envoyer le mail.
	
	
	
	Envoi du mail :
	     Recherche dans la base de la derni�re fiche de la personne connect�e
	     Recherche des caract�ristiques de cette fiche et du mail de la personne connect�e
	
	     Le mail contient en objet, l'objet de la fiche.
	     et en contenu, le texte que vous voulez et le champ description de la fiche
	S'il y a eu un document avec la fiche, le nom de ce document
	
	*/
%>