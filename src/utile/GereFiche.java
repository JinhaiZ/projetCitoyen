package utile;

import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;

public class GereFiche {
	// les 4 propriétés
	private String demandeur, objet, description, datedemande;

	static Connection connection, connectionPret = null;
	private ResultSet rset = null;
	private PreparedStatement pstmt;

	public void setDemandeur(String demandeur) {
		this.demandeur = demandeur;
	}

	public void setObjet(String objet) {
		this.objet = objet;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setDatedemande(String datedemande) {
		this.datedemande = datedemande;
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


	public void inscrireFiche() {
		try {
			pstmt = connection
					.prepareStatement("insert into fiche(demandeur, objet, description, datedemande) VALUES (?,?,?,?)");
			pstmt.setString(1, demandeur);
			pstmt.setString(2, objet);
			pstmt.setString(3, description);
			pstmt.setString(4, datedemande);
			//System.out.println("pstmt="+pstmt.toString());	
			pstmt.executeUpdate();
		} catch (Exception E) {
			System.out.println(" -------- probleme inscrireFiche " + E.getClass().getName());
			E.printStackTrace();
		}
	}
}