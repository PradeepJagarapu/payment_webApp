<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pradeep.servlets.Transaction"%>
<%@ page import="com.pradeep.servlets.TransactionDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transactions</title>
<style type="text/css">
	{
		margin:0;
		padding:0;
	}
	th,td{
		border: 1px solid black;
		padding: 8px;
	}
</style>
</head>
<body>
	<h2>Transactions Details</h2>
	<a href="DownloadTransactions?page="><button style="margin-left:92%; margin-bottom:5px;">Download</button></a>
	<table style='border: 1px solid black; border-collapse: collapse; width: 100%;'>
		<tr style='background-color: #f4f4f4;'>
			<th>Transaction ID</th>
			<th>Date</th>
			<th>Description</th>
			<th>Amount</th>
			<th>Type</th>
			<th>Balance</th>
		</tr>
		<%	
			int currentPage=1;
			int pageSize=6;
			
			String pageParam=request.getParameter("page");
			
			if(pageParam!=null && !pageParam.isEmpty()){
				currentPage=Integer.parseInt(pageParam);
			}
			int offset=(currentPage-1)*pageSize;
			
			List<Transaction> transactions=TransactionDAO.getAllRecords(pageSize,offset); 
			request.setAttribute("transactions", transactions);
		%>
		<%
			for(Transaction t : transactions){
		%>
		<tr>
			<td><%= t.getTransactionId()%></td> 
			<td><%= t.getDate()%></td>
			<td><%= t.getDescription() %></td>
			<td><%= t.getAmount()%></td>
			<td><%= t.getType()%></td>
			<td><%= t.getBalance()%></td>
		</tr>
		<%	} %>
	</table>
	<a href="DownloadTransactions"><button style="margin-left:92%; margin-bottom:5px;">Download</button></a>
	<%int numOfPages=(int)Math.ceil(TransactionDAO.getTransactionsCount()*1.0/6);%>
	<div>
	<%
		for(int i=1;i<=numOfPages;i++){	
	%>
	<a href="DisplayTransactions.jsp?page=<%=i%>"><%=i %></a>
	<% } %>
	</div>
</body>
</html>