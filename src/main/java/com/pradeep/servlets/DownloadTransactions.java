package com.pradeep.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
//import com.itextpdf.text.Document;

/**
 * Servlet implementation class DownloadTransactions
 */
public class DownloadTransactions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/pdf");
		
		response.setHeader("content-disposition","attachment; filename=\"transactions.pdf\"");
		
		
	}

}
