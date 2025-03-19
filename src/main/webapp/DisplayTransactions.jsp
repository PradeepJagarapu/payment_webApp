<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.pradeep.model.TransactionDetails"%>
<%@ page import="com.pradeep.model.TransactionDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<a href="DownloadTransactions"><button style="margin-left:92%; margin-bottom:5px;">Download</button></a>
	<table style='border: 1px solid black; border-collapse: collapse; width: 100%;'>
		<tr style='background-color: #f4f4f4;'>
			<th>Transaction ID</th>
			<th>Date</th>
			<th>Source ID</th>
			<th>Destination ID</th>
			<th>Source Type</th>
			<th>Destination Type</th>
			<th>Amount</th>
		</tr>
		<%	
			int currentPage=1;
			int pageSize=6;
			
			String pageParam=request.getParameter("page");
			
			if(pageParam!=null && !pageParam.isEmpty()){
				currentPage=Integer.parseInt(pageParam);
			}
			int offset=(currentPage-1)*pageSize;
			
			List<TransactionDetails> transactions=TransactionDAO.getAllRecords(0,0); 
			System.out.print(transactions.size());
		%>
		<%-- 
		<c:forEach var="transaction" items="${transactions}">
			<tr>
				<td>${transaction.transactionId}</td>
				<td>${transaction.transactionDateTime}</td>
				<td>${transaction.sourceId}</td>
				<td>${transaction.targetId}</td>
				<td>${transaction.sourceType}</td>
				<td>${transaction.destinationType}</td>
				<td>${transaction.transactionAmount}</td>
			</tr>
		</c:forEach>
		--%> 
		<%
			for(TransactionDetails t : transactions){
		%>
		<tr>
			<td><%= t.getTransactionId()%></td>
			<td><%= t.getTransactionDateTime()%></td>
			<td><%= t.getSourceId() %></td>
			<td><%= t.getTargetId()%></td>
			<td><%= t.getSourceType()%></td>
			<td><%= t.getDestinationType()%></td>
			<td><%= t.getTransactionAmount()%></td>
		</tr>
			<%}%>
	</table>
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