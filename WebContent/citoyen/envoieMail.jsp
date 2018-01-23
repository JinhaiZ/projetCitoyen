<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp" %> 

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

Il faut donc faire suivre cette valeur ("partie "hidden")




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