package com.pradeep.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.pradeep.model.TransactionDAO;
import com.pradeep.model.TransactionDetails;


public class DisplayTransactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
		int currentPage=1;
		int pageSize=6;
		
		String page=request.getParameter("page");
		if(page!=null && !page.isEmpty()) {
			currentPage=Integer.parseInt(page);
		}
		
		int previousPage=currentPage>1?currentPage-1:6;
		int nextPage=currentPage<6?currentPage+1:1;

		int offSet=(currentPage-1)*pageSize;
		List<TransactionDetails> transactions=TransactionDAO.getAllRecords(pageSize,offSet);
		
		pw.println("<table style='border: 1px solid black; border-collapse: collapse; width: 100%;'>");
		pw.println("<tr style='background-color: #f4f4f4;'>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Transaction ID</th>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Date</th>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Description</th>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Amount</th>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Type</th>");
		pw.println("<th style='border: 1px solid black; padding: 8px;'>Balance</th>");
		pw.println("</tr>");

		for (TransactionDetails t : transactions) {
		    pw.println("<tr>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getTransactionId() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getTransactionDateTime() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getSourceId() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getTargetId() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getSourceType() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getDestinationType() + "</td>");
		    pw.println("<td style='border: 1px solid black; padding: 8px;'>" + t.getTransactionAmount() + "</td>");
		    pw.println("</tr>");
		}

		pw.println("</table>");
		

		pw.print("<div style=\"text-align: center;\">");
		pw.print("<a href='DisplayTransactions?page="+previousPage+"'><<</a> ");  
		pw.print("<a href='DisplayTransactions?page=1'>1</a> ");  
        pw.print("<a href='DisplayTransactions?page=2'>2</a> ");  
        pw.print("<a href='DisplayTransactions?page=3'>3</a> ");  
        pw.print("<a href='DisplayTransactions?page=4'>4</a> ");  
        pw.print("<a href='DisplayTransactions?page=5'>5</a> ");  
        pw.print("<a href='DisplayTransactions?page=6'>6</a> ");  
        pw.print("<a href='DisplayTransactions?page="+nextPage+"'>>></a> ");  
        pw.print("</div>");
		
		
	}

}
