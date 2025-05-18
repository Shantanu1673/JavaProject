package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil 
{
    Connection cn = null;
    public Connection getConnection()
    {
    
    	
    		try 
    		{
				Class.forName("com.mysql.jdbc.Driver");
				cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/anime_db","root","");
				System.out.println("Connection Established.....");
			} 
    		catch (Exception e) 
    		{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    		
		
    	
    	return cn;
    }
}
