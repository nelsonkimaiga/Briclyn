package com.villa.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ResourceBundle;

public class DBProperties {
	public static Connection getDBConnection() throws Exception{
		Connection conn = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/project","root", "303seminarian");
      return conn;
	}
	
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		
		ResourceBundle rb=ResourceBundle.getBundle("connection_config");
		
		String sDriverName=rb.getString("driver.name");
		String sServerName=rb.getString("server.name");
		String sPort=rb.getString("port.no");
		String sDatabaseName=rb.getString("database.name");
		String sUserName=rb.getString("user.name");
		String sPassword=rb.getString("password");
		
		
		Class.forName(sDriverName).newInstance();
		conn = DriverManager.getConnection("jdbc:mysql://"+sServerName+":"+sPort+"/"+sDatabaseName,sUserName, sPassword);
      return conn;
	}
}
