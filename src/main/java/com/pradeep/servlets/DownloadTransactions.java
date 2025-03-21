//package com.pradeep.servlets;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//import com.itextpdf.text.Document;
//import com.itextpdf.text.DocumentException;
//import com.itextpdf.text.Element;
//import com.itextpdf.text.Font;
//import com.itextpdf.text.Paragraph;
//import com.itextpdf.text.pdf.PdfPTable;
//import com.itextpdf.text.pdf.PdfWriter;
//
//
///**
// * Servlet implementation class DownloadTransactions
// */
//public class DownloadTransactions extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.setContentType("application/pdf");
//		
//		response.setHeader("content-disposition","attachment; filename=\"transactions.pdf\"");
//		
//		List<Transaction> transactions=TransactionDAO.getAllRecords(15,0); 		
//		Document document=new Document();
//		
//		try {
//			PdfWriter writer=PdfWriter.getInstance(document, response.getOutputStream());
//			document.open();
//			
//			 Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
//		     Paragraph title = new Paragraph("Transaction History", titleFont);
//		     title.setAlignment(Element.ALIGN_CENTER);
//		     document.add(title);
//		       
//		     // Add a table for the transaction details
//		     PdfPTable table = new PdfPTable(6); // 6 columns
//		     table.setWidthPercentage(100);
//
//		  // Add table headers
//	         table.addCell("Transaction ID");
//	         table.addCell("Date");
//	         table.addCell("Description");
//	         table.addCell("Amount");
//	         table.addCell("Type");
//	         table.addCell("Balance");
//		 
//	      // Add rows of transaction data
//	         for (Transaction transaction : transactions) {
//	             table.addCell(String.valueOf(transaction.getTransactionId()));
//	             table.addCell(transaction.getDate().toString());
//	             table.addCell(transaction.getDescription());
//	             table.addCell(String.valueOf(transaction.getAmount()));
//	             table.addCell(transaction.getType());
//	             table.addCell(String.valueOf(transaction.getBalance()));
//	         }
//
//	         // Add the table to the document
//	         document.add(table);
//
//	         document.close(); // Close the document
//		} catch (DocumentException | IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//}
