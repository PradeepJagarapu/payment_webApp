package com.pradeep.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDetailsDAO {
	
	public int authenticateUser(String username,String password) {
		Connection con=DBConnection.getCon();
		String query="SELECT * FROM user_details where user_name=? && password=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public UserDetails getUser(int user_Id) {
		Connection con=DBConnection.getCon();
		UserDetails user=null;
		String query="select * from user_details where user_id=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, user_Id);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				user=new UserDetails();
				String name=rs.getString(2);
				String address=rs.getString(6);
				String phoneNumber=rs.getString(7);
				String email=rs.getString(8);
				
				user.setUserName(name);
				user.setAddress(address);
				user.setPhoneNumber(phoneNumber);
				user.setEmail(email);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
}
