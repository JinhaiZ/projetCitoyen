
<%@ page isELIgnored="false" %>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql2" %>

<%@ include file="ouvreBase2.jsp" %>  
<%
Statement stmt = conn1.createStatement();
ResultSet rset = null;
PreparedStatement pstmt=null;
String mailCitoyen = null;
String reponse = request.getParameter("reponse");
String objet = null;
String description =null;

String valider = request.getParameter("valider");
int id = Integer.parseInt((String)session.getAttribute("id"));
String mail=(String)session.getAttribute("mail");
int numFiche  =  (request.getParameter("numFiche")!=null)? Integer.parseInt(request.getParameter("numFiche")):0;
int numDemande  =  (request.getParameter("numDemande")!=null)? Integer.parseInt(request.getParameter("numDemande")):0;
int num=0, num2=0;
System.out.println(response);
System.out.println(valider);
pstmt= conn1.prepareStatement
    ("SELECT  mail, objet, description FROM personne , fiche  where fiche.demandeur = personne.id and fiche.id=?"); 
pstmt.setInt(1,numFiche);
rset = pstmt.executeQuery();
if (rset.next()) {
	mailCitoyen =rset.getString("mail");
	objet =rset.getString("objet");
	description =rset.getString("description");
}

  // envoi mail au citoyen 
  String objetMail ="Réponse à votre  fiche Citoyenne ";
  String mailMairie = "jinhai.zhou@imt-atlantique.net";
  String motpasse = "******"; // besoin mot de passe en claire
  String signature = "Mail de Mairie";
  String contenu = "Bonjour \r\n";
  contenu = contenu + "voici le contenu et la reponse  de votre fiche, elle a été enregistée sous le numéro " + numFiche +"\r\n";
  contenu = contenu + "objet : " + objet +"\r\n";
  contenu = contenu + "description : " + description +"\r\n";
  contenu = contenu + "reponse : " + reponse +"\r\n";
  contenu = contenu + "Si nous apportons une autre reponse vous en serez averti"  +"\r\n";
  contenu = contenu + "Cordialement, La mairie";
  GereCitoyen.envoieMailSecure(objetMail, mailMairie, mailCitoyen, contenu, motpasse, "z.imt.fr", "587", signature);

  /*
// en scriplet  inscription de la reponse par un administrateur et retour administration  
 if (  (valider != null) && (reponse != null))  { 
  pstmt= conn1.prepareStatement
             ("UPDATE  fiche  set reponse=?  where id =?"); 
  pstmt.setString(1,reponse);
  pstmt.setInt(2,numFiche);
  pstmt.executeUpdate();			 
	 	 	 	  	  
  response.sendRedirect("gereDemandeCitoyen.jsp");
    } 
  */
 %>


  <!--  en jstl  inscription de la reponse par un administrateur et retour administration  -->
 
  <c:if test="${(param.valider != null) and (param.reponse != null) }" >
  <sql2:update var="result" dataSource="DonneesBase">
    update  fiche set reponse="${param.reponse}"  where id= ${param.numFiche}
 </sql2:update>
  <c:redirect url="gereDemandeCitoyen.jsp"/>
</c:if>

