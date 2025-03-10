package com.pradeep.servlets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
//	Connection con=DBConnection.getCon();
	
	public static List<Transaction> getAllRecords(int pageSize, int offSet){
		List<Transaction> transactions=new ArrayList<Transaction>();
		Transaction t=null;
		Connection con=DBConnection.getCon();
		String query="Select * from Transactions LIMIT ? OFFSET ?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, pageSize);
			ps.setInt(2, offSet);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int transactionId=rs.getInt(1);
				Date date=rs.getDate(2);
				String description=rs.getString(3);
				double amount=rs.getDouble(4);
				String type=rs.getString(5);
				double balance=rs.getDouble(6);
				
				t=new Transaction(transactionId, date, description, amount, type, balance);
				transactions.add(t);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return transactions;
	}
}
