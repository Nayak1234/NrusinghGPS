package com.nru.test;
import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.FileReader;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Properties;
import java.util.Vector;

public class Utilities {
	Connection con;
	FileReader reader;
	String mysql_driver_string="";
	String mysql_connection_string="";
	String mysql_username="";
	String mysql_password="";
	String query ="";

	public Utilities() {
		this.con = getConnection();
	}

	public Connection getConnection(){
		try {
			//reader = new FileReader("config.properties");
			InputStream inputStream = 
				    getClass().getClassLoader().getResourceAsStream("config.properties");
			Properties properties=new Properties();
			properties.load(inputStream);
			/*System.out.println("");
			Properties properties = new Properties();
		     InputStream in = this.getClass()
		           .getClassLoader()
		           .getResourceAsStream("com/package/props/config.properties");
		     properties.load(in);*/
			
			String mysql_driver_string=properties.getProperty("mysql_driver_string");
			String mysql_connection_string=properties.getProperty("mysql_connection_string");
			String mysql_username=properties.getProperty("mysql_username");
			String mysql_password=properties.getProperty("mysql_password");
			//System.out.println("mysql_driver_string: "+mysql_driver_string+"\nmysql_connection_string: "+mysql_connection_string+"\nmysql_username: "+mysql_username+"\nmysql_password: "+mysql_password);
			this.mysql_driver_string = mysql_driver_string;
			this.mysql_connection_string = mysql_connection_string;
			this.mysql_username = mysql_username;
			this.mysql_password = mysql_password;

			Class.forName(mysql_driver_string).newInstance();
			Connection con = DriverManager.getConnection(mysql_connection_string, mysql_username, mysql_password);
			System.out.println("-- connected --");
			this.con = con;
		} catch (Exception e) {e.printStackTrace();}
		return con;
	}
	
	public void closeConnection(Connection con) {
		try {
			con.close();
		} catch (Exception e) {e.printStackTrace();}
	}

	public Vector selectQuery(String query, int params, Connection con){
		Vector result = new Vector();
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Vector temp = new Vector();
				for (int i = 1; i <= params; i++) {
					String str = (String) rs.getString(i);
					temp.add(str);
				}
				result.add(temp);
			}
		} catch (Exception e) {e.printStackTrace();}
		return result;
	}
	
	public String getField(String query, Connection con){
		String result = "";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				result = (String) rs.getString(1);
			}
		} catch (Exception e) {e.printStackTrace();}
		return result;
	}

	public void insertQuery(String query, Connection con){
		try {
			Statement st = con.createStatement();
			int ins = st.executeUpdate(query);
			System.out.println("  >>  ins: "+ins);
		} catch (Exception e) {e.printStackTrace();}
	}
	
	public Dimension getScreenDimension(){
		int screen_width = (int)Toolkit.getDefaultToolkit().getScreenSize().getWidth();
		int screen_height = (int)Toolkit.getDefaultToolkit().getScreenSize().getHeight();
		//System.out.println("####Screen width: "+screen_width+"    screen_height: "+screen_height);
		Dimension screen_dimension = new Dimension(screen_width, screen_height);
		return screen_dimension;
	}
}
