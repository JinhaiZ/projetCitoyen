<%@attribute name="methode"%>
<%@attribute name="action"%>
<%@attribute name="couleur"%>
<%@attribute name="taille"%>
<%@attribute name="ligneTexte" type="java.util.LinkedHashMap"
	required="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="${methode}" action="${action}">
	<table style="background-color:${couleur};">
		<c:forEach var="ligne" begin="0" items="${ligneTexte}"
			varStatus="loopCounter">
			<c:if test="${ligne.value[0]!='submit'}">
				<tr>
					<c:set var="nom" value="${ligne.key}" />
					<td>${ligne.value[1]}:</td>
					<c:if test="${not empty ligne.value[2]}">
						<td>
						<input type="${ligne.value[0]}" name="${nom}" pattern="${ligne.value[2]}" size="${taille}" />
						</td>
					</c:if>
					<c:if test="${empty ligne.value[2]}">
						<td><input type="${ligne.value[0]}" name="${nom}" size="${taille}" /></td>
					</c:if>
				</tr>
			</c:if>
		</c:forEach>
		<c:forEach var="ligne" begin="0" items="${ligneTexte}"
			varStatus="loopCounter">
			<c:if test="${ligne.value[0]=='submit'}">
				<tr>
					<td>${ligne.value[1]}:</td>
					<td><input type="${ligne.value[0]}" name="${ligne.key}"
						size="${taille}" /></td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</form>