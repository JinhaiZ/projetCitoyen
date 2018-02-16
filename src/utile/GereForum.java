package utile;

import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;

public class GereForum {
	// les 4 propriétés
	private String numFiche, admin, demande, timeDemandemysql;

	static Connection connection, connectionPret = null;
	private ResultSet rset = null;
	private PreparedStatement pstmt;

	public void setNumFiche(String numFiche) {
		this.numFiche = numFiche;
	}

	public void setIdentity(String admin) {
		this.admin = admin;
	}

	public void setDemande(String demande) {
		this.demande = demande;
	}

	public void setTimeDemande(String timeDemandemysql) {
		this.timeDemandemysql = timeDemandemysql;
	}
	
	public String getNumFiche() {
		return this.numFiche;
	}
	
	public String getIdentity() {
		return this.admin;
	}
	
	public String getDemande() {
		return this.demande;
	}

	public String imeDemande() {
		return this.timeDemandemysql;
	}


	public Connection getConnection() {
		return connection;
	}

	public ResultSet getRset() {
		return rset;
	}

	public Connection ouverture(String base) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + base, "root", "");
			connection.setAutoCommit(true);
		} catch (Exception E) {
			System.out.println(" -------- probleme ouverture  " + E.getClass().getName());
			E.printStackTrace();
		}
		return connection;
	}


	public void inscrireForum() {
		try {
			pstmt = connection
					.prepareStatement("insert into forum(fiche, admin, timereponse, reponse) VALUES (?,?,?,?)");
			pstmt.setString(1, numFiche);
			pstmt.setString(2, admin);
			pstmt.setString(3, timeDemandemysql);
			pstmt.setString(4, demande);
			//System.out.println("pstmt="+pstmt.toString());	
			pstmt.executeUpdate();
		} catch (Exception E) {
			System.out.println(" -------- probleme inscrireForum " + E.getClass().getName());
			E.printStackTrace();
		}
	}
}