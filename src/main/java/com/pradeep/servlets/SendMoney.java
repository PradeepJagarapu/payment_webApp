package com.pradeep.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.pradeep.model.BankAccount;
import com.pradeep.model.BankAccountDAO;


public class SendMoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		
		Double amount=Double.parseDouble(request.getParameter("amount"));
		String fromAccNo=request.getParameter("from");
		String toType=request.getParameter("toType");
		String toAccount=request.getParameter("toAccount");
		//String toWallet=request.getParameter("toWallet");
		
		
		if(toAccount!=null) {
			BankAccountDAO bankDAO=new BankAccountDAO();
			boolean success=bankDAO.sendMoney(fromAccNo, toAccount, amount);
			if(success) {
				out.print("Money successfully sent to " + toAccount);
			}else {
	            response.sendRedirect("/PaginationTest/sendMoney.jsp?error=Transaction Failed");
			}
		}
	}

}
