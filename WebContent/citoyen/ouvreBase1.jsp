<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource
	var="conn1"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/demandecitoyen?user=root"
	scope="session"
/>
