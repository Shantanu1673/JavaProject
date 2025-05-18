package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.Viewer;
import com.util.DBUtil;

public class ViewerDao
{
	Connection cn=null;
	public int ViewerRegisteration(Viewer vmodel)
	{
		int x=0;
		
		cn=new DBUtil().getConnection();
		String qry="insert into viewer(username,email,password) values(?,?,?)";
		
		try 
		{
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, vmodel.getUsername());
			st.setString(2, vmodel.getEmail());
			st.setString(3, vmodel.getPassword());
			
			x=st.executeUpdate();
			cn.close();
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 
		
		return x;
	}
	
	public Viewer ViewerLogin(Viewer lmodel)
	{
		 Viewer model= null;
		 
		 cn=new DBUtil().getConnection();
		 String qry="select * from viewer where email=? and password=? ";
		 
		 try 
		 {
			PreparedStatement st=cn.prepareStatement(qry);
			st.setString(1, lmodel.getEmail());
			st.setString(2, lmodel.getPassword());
			
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				model = new Viewer();
				model.setViewerid(rs.getInt(1));
				model.setUsername(rs.getString(2));
				model.setEmail(rs.getString(3));
				model.setPassword(rs.getString(4));
			}
		 } 
		 catch (Exception e) 
		 {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
		 
		 return model;
	}
}
