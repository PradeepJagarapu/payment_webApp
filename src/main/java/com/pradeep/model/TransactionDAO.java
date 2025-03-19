package com.pradeep.model;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
	static Connection con=DBConnection.getCon();
	
	public static List<TransactionDetails> getAllRecords(int pageSize, int offSet){
		List<TransactionDetails> transactions=new ArrayList<TransactionDetails>();
		TransactionDetails t=null;
//		Connection con=DBConnection.getCon();
//		String query="Select * from transaction_details LIMIT ? OFFSET ?";
		String query="Select * from transaction_details";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
		//	ps.setInt(1, pageSize);
		//	ps.setInt(2, offSet);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int transactionId=rs.getInt(1);
				Date date=rs.getDate(2);
				int description=rs.getInt(3);
				int amount=rs.getInt(4);
				String sourceType=rs.getString(5);
				String des_Type=rs.getString(6);
				BigDecimal balance=rs.getBigDecimal(7);
				
				t=new TransactionDetails(transactionId, date, description, amount, sourceType, des_Type, balance);
				transactions.add(t);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return transactions;
	}
	
	public static int getTransactionsCount() throws SQLException {
		int count=0;
		String query="Select Count(*) from transaction_details";
		PreparedStatement ps=con.prepareStatement(query);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			count=rs.getInt(1);
		}
		
		return count;
	}
	
}
