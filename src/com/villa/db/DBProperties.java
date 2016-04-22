package com.villa.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class DBProperties {
	public static Connection getDBConnection() throws Exception{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://197.248.5.16/cityscen_project","cityscen_kimaiga","nelsonkimaiga2016");
      return conn;
	}
	
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		
		ResourceBundle rb=ResourceBundle.getBundle("connection_config");
		
		String sDriverName=rb.getString("driver.name");
		String sServerName=rb.getString("server.name");
		String sDatabaseName=rb.getString("database.name");
		String sUserName=rb.getString("user.name");
		String sPassword=rb.getString("password");
		
		
		Class.forName(sDriverName).newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://"+sServerName+"/"+sDatabaseName,sUserName, sPassword);
      return conn;
	}
}
