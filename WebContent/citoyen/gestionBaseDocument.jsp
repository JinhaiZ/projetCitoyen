 <%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp" %>  
<jsp:useBean id="gerelesDocument" class="utile.GereDocument"  scope="session" />
<%
ResultSet rset = null;
PreparedStatement pstmt=null;
String docmise = request.getParameter("docmise");
//int id = ((Integer)(session.getAttribute("id"))).intValue();
int id = Integer.parseInt((String)session.getAttribute("id"));

 /*
<!--   stockage document, le document est associé au citoyen qui l'a chargé -->
<!--    mettre le nom du document dans la base  avec ID du citoyen -->
*/

/*  première partie appel de 
                mesInformationsPersonelles.jsp

     puis lorsque que vous avez écrit envoieMail.jsp, 
     appel de envoieMail.jsp 
     avec un paramètre    le nom du document pour mettre dans le mail
*/


gerelesDocument.ouverture("demandecitoyen");
gerelesDocument.setNom(docmise);
gerelesDocument.setProprietaire(Integer.toString(id));
gerelesDocument.inscrireDocument();

System.out.println("docmise: "+docmise);
System.out.println("id: "+id);

%>
<jsp:forward page="envoieMail.jsp">
  <jsp:param name="docmise" value="<%=docmise%>" ></jsp:param>
</jsp:forward>
<%

%>