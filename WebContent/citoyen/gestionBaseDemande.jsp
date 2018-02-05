<%@ page isELIgnored="false" %>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp" %>
<jsp:useBean id="gerelesFiche" class="utile.GereFiche"  scope="session" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var = "ajoutdoc" value="${param.ajoutdoc}" />
<c:set var = "valider" value="${param.valider}" />
<c:set var = "objet" value="${requestScope.objet}" />
<c:set var = "description" value="${requestScope.description}" />
<c:set var = "dateDemande" value="${requestScope.dateDemande}" />

<%System.out.println(pageContext.findAttribute("valider")); %>
<c:if test = "${not empty valider && valider == 'false'}">
<jsp:forward page="mesInformationsPersonnelles.jsp" />
</c:if>

<c:set var="id" value="id" scope="session"/>
<c:set var = "dateDemandemysql" value="${requestScope.dateDemandemysql}" />

<c:if test = "${not empty valider && valider == 'true'}">
<c:out value="${gerelesFiche.ouverture('demandecitoyen')}" />
<c:out value="${gerelesFiche.setDemandeur(id)}" />
<c:out value="${gerelesFiche.setObjet(objet)}" />
<c:out value="${gerelesFiche.inscrireFiche()}" />
<jsp:forward page="envoieMail.jsp" />
</c:if>

<c:if test = "${not empty ajoutdoc && ajoutdoc == 'true'}">
<jsp:forward page="mesInformationsPersonnelles.jsp" />
</c:if>

<c:if test = "${empty ajoutdoc || ajoutdoc != 'true'}">
<jsp:forward page="mesInformationsPersonnelles.jsp" />
</c:if>

