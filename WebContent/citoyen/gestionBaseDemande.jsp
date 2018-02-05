<%@ page isELIgnored="false" %>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp" %>
<jsp:useBean id="gerelesFiche" class="utile.GereFiche"  scope="session" />
<%
ResultSet rset = null;
PreparedStatement pstmt=null;
String ajoutdoc = request.getParameter("ajoutdoc");
String valider = request.getParameter("valider");
String objet = request.getParameter("objet");
String description = request.getParameter("description");
String dateDemande = request.getParameter("dateDemande");

if (valider != null && valider.equals("false")) {
	%>
	<jsp:forward page="mesInformationsPersonnelles.jsp" />
	<%
}

//int id = ((Integer)(session.getAttribute("id"))).intValue();
int id = Integer.parseInt((String)session.getAttribute("id"));
String dateDemandemysql = request.getParameter("dateDemandemysql");

System.out.format("gestionBaseDemande, id=%s\n", id);
System.out.format("gestionBaseDemande, ajoutdoc=%s\nvalider=%s\nobjet=%s\ndescription=%s\ndateDemande=%s\ndateDemandemysql=%s\n", 
ajoutdoc, valider, objet, description, dateDemande, dateDemandemysql);

/*	
* inscription de la fiche dans la base   (id du Citoyen, objet, description, datedemande)
*   
*
*/
if (valider != null && valider.equals("true")) {
	gerelesFiche.ouverture("demandecitoyen");
	gerelesFiche.setDemandeur(Integer.toString(id));
	gerelesFiche.setObjet(objet);
	gerelesFiche.setDescription(description);
	gerelesFiche.setDatedemande(dateDemandemysql);
	gerelesFiche.inscrireFiche();
	%>
	<jsp:forward page="envoieMail.jsp" />
	<%
}

	 
if (ajoutdoc != null && ajoutdoc.equals("true")) {
/*
* demande de upload d'un document appel à la page pour le choix du fichier : uploadPage.jsp  
*/
	%>
	<jsp:forward page="uploadPage.jsp" />
	<%

}  
else
  {
/*
* fiche sans document on retourne à une page d'accueil, par exemple
*                       suivreMesDemandes.jsp
*/
 }  %>

 

