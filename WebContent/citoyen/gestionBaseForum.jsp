<%@ page isELIgnored="false" %>
<%@ page import="java.util.*"%>
<%@ page import="utile.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="ouvreBase2.jsp" %>
<jsp:useBean id="gerelesForum" class="utile.GereForum"  scope="session" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var = "numFiche" value="${param.numFiche}" />
<c:set var = "admin" value="${param.admin}" />
<c:set var = "demande" value="${param.demande}" />
<c:set var = "timeDemandemysql" value="${param.timeDemandemysql}" />

<c:out value="${gerelesForum.ouverture('demandecitoyen')}" />
<c:out value="${gerelesForum.setNumFiche(numFiche)}" />
<c:out value="${gerelesForum.setIdentity(admin)}" />
<c:out value="${gerelesForum.setDemande(demande)}" />
<c:out value="${gerelesForum.setTimeDemande(timeDemandemysql)}" />
<c:out value="${gerelesForum.inscrireForum()}" />


<jsp:forward page="ficheCitoyenne.jsp">
  <jsp:param name="numeroDemande" value="${param.numFiche}" ></jsp:param>
</jsp:forward>

