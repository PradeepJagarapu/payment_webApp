package com.pradeep.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.pradeep.model.BankAccount;
import com.pradeep.model.BankAccountDAO;


public class AddBankAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddBankAccountServlet() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountNumber = request.getParameter("accountNumber");
        String ifscCode = request.getParameter("ifscCode");
        String bankName = request.getParameter("bankName");
        String branchLocation = request.getParameter("branchLocation");
        double balance = Double.parseDouble(request.getParameter("currentBalance"));
        
     // Get the user ID (you might retrieve this from the session or another source)
        int userId = 1; // Replace with actual user ID logic
        
        BankAccount bankAcc = new BankAccount();
        bankAcc.setUserId(userId);
        bankAcc.setAccountNumber(accountNumber);
        bankAcc.setIfscCode(ifscCode);
        bankAcc.setBankName(bankName);
        bankAcc.setBranchLocation(branchLocation);
        bankAcc.setBalance(balance);
        
        BankAccountDAO bankAccountDAO = new BankAccountDAO();
        boolean success=bankAccountDAO.addBankAcc(bankAcc);
        
        if (success) {
            response.sendRedirect("UserProfile.jsp"); // Redirect to the user profile page
        } else {
            response.sendRedirect("error.jsp"); // Redirect to an error page
        }
	}

}
