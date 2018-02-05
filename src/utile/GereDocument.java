package utile;

import java.util.*;
import org.mindrot.jbcrypt.BCrypt;
import javax.mail.*;
import javax.mail.internet.*;
import java.sql.*;

public class GereDocument {
	// les 4 propriétés
	private String nom, proprietaire;

	static Connection connection, connectionPret = null;
	private ResultSet rset = null;
	private PreparedStatement pstmt;

	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setProprietaire(String proprietaire) {
		this.proprietaire = proprietaire;
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

	public void inscrireDocument() {
		try {
			pstmt = connection
					.prepareStatement("insert into document(nom, proprietaire) VALUES (?,?)");
			pstmt.setString(1, nom);
			pstmt.setString(2, proprietaire);
			System.out.println("pstmt="+pstmt.toString());	
			pstmt.executeUpdate();
		} catch (Exception E) {
			System.out.println(" -------- probleme inscrireFiche " + E.getClass().getName());
			E.printStackTrace();
		}
	}
}