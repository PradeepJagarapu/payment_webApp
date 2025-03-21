package com.pradeep.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BankAccountDAO {
	
	public boolean addBankAcc(BankAccount bankAccount){
		Connection con=DBConnection.getCon();
		String query="insert into bank_accounts(user_id, account_number, ifsc_code, bank_name, branch_location,balance,is_active) values(?,?,?,?,?,?,'yes')";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, bankAccount.getUserId());
	        ps.setString(2, bankAccount.getAccountNumber());
	        ps.setString(3, bankAccount.getIfscCode());
	        ps.setString(4, bankAccount.getBankName());
	        ps.setString(5, bankAccount.getBranchLocation());
	        ps.setDouble(6, bankAccount.getBalance());
			
			int rowsAffected=ps.executeUpdate();
			
			return rowsAffected>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
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
