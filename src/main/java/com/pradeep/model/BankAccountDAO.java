package com.pradeep.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BankAccountDAO {
	
	public List<BankAccount> getBankAccounts(int user_Id) {
		Connection con=DBConnection.getCon();
		BankAccount bankAcc=null;
		List<BankAccount> bankAccs=new ArrayList<BankAccount>();
		String query="select * from bank_accounts where user_id=?";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, user_Id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) { 
				bankAcc=new BankAccount();
				String bankAccNo=rs.getString(3);
				String ifscCode=rs.getString(4);
				String bankName=rs.getString(5);
				String bankLocation=rs.getString(6);
				Double balance=rs.getDouble(8);
				
				bankAcc.setAccountNumber(bankAccNo);
				bankAcc.setIfscCode(ifscCode);
				bankAcc.setBankName(bankName);
				bankAcc.setBranchLocation(bankLocation);
				bankAcc.setBalance(balance);
				
				bankAccs.add(bankAcc);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bankAccs;
	}
}
