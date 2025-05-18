	package com.dao;
	
	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	
	import com.model.Admin;
	import com.model.NewAnime;
	import com.model.NewEpisode;
	import com.util.DBUtil;
	
	public class AdminDao
	{
		Connection cn=null;
		public Admin AdminLogin(Admin almodel)
		{
			 Admin model= null;
			 
			 cn=new DBUtil().getConnection();
			 String qry="select * from admin where username=? and password=? ";
			 
			 try 
			 {
				PreparedStatement st=cn.prepareStatement(qry);
				st.setString(1, almodel.getUsername());
				st.setString(2, almodel.getPassword());
				
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{
					model = new Admin();
					model.setAdminid(rs.getInt(1));
					model.setUsername(rs.getString(2));
					model.setPassword(rs.getString(3));
				}
			 } 
			 catch (Exception e) 
			 {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			  
			 
			 return model;
		}
	    public int addAnime(NewAnime nm) 
	    {
	        Connection cn = (new DBUtil()).getConnection();
	        int x = 0;
	        String qry = "insert into newanime(animename,description,image) values (?,?,?)";
	
	        try {
	            PreparedStatement st = cn.prepareStatement(qry);
	            st.setString(1, nm.getAnimename());
	            st.setString(2, nm.getDescription());
	            st.setString(3, nm.getImage());
	            x = st.executeUpdate();
	            cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	        return x;
	    }
	    public int addepisode(NewEpisode nae) 
	    {
	        Connection cn = (new DBUtil()).getConnection();
	        int z = 0;
	        String qry = "insert into newepisode(animeid,video,episodeno) values (?,?,?)";
	
	        try {
	            PreparedStatement st = cn.prepareStatement(qry);
	            st.setInt(1, nae.getAnimeid());
	            st.setString(2, nae.getVideo());
	            st.setInt(3, nae.getEpisodeno());
	            z = st.executeUpdate();
	            cn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	        return z;
	    }
	}
