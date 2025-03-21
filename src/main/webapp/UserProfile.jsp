<%@page import="com.pradeep.model.BankAccount"%>
<%@page import="java.util.List"%>
<%@page import="com.pradeep.model.BankAccountDAO"%>
<%@page import="com.pradeep.model.UserDetails"%>
<%@page import="com.pradeep.model.UserDetailsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payments Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #f8f9fa;
            border: 2px solid red;
            padding: 10px;
            text-align: center;
        }
        .user-details {
            background-color: #e9ecef;
            border: 2px solid green;
            padding: 10px;
            margin-bottom: 10px;
        }
        .account-info {
            background-color: #e9ecef;
            border: 2px solid blue;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .bank-accounts {
            background-color: #e9ecef;
            border: 2px solid purple;
            padding: 10px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .bank-account {
            background-color: #fff;
            border: 2px solid orange;
            padding: 10px;
            width: calc(25% - 20px);
        }
        .transactions {
            background-color: #e9ecef;
            border: 2px solid blue;
            padding: 10px;
        }
        .add-button, .edit-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .add-button:hover, .edit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h2>Payments Web App</h2>
        <p>Welcome <User Full Name></p>
        <a href="logout.jsp"><button>Logout</button></a>
    </div>
	    <!-- User Details Section -->
	<%
		UserDetailsDAO userDao=new UserDetailsDAO();
		UserDetails user=userDao.getUser(1);
	%>
    <div class="user-details">
        <h3>User Information</h3>
        <p><strong>Name:</strong><%=user.getUserName()%></p>
        <p><strong>Email:</strong><%=user.getEmail()%></p>
        <p><strong>Phone:</strong><%=user.getPhoneNumber()%></p>
        <p><strong>Address:</strong><%=user.getAddress()%></p>
    </div>
    <!-- Account Information Section -->
    <div class="account-info">
        <div>
            <p>primary Bank Account No:<1234></p>
            <p>Account Balance: <90.00></p>
            <p>Wallet Balance: <77.00> <a href="addWalletBalance.jsp">[+]</a></p>
        </div>
        <a href="sendMoney.jsp"><button>Send Money</button></a>
    </div>

    <!-- Bank Accounts Section -->
    <div class="bank-accounts">
    <%
	    BankAccountDAO bankDao=new BankAccountDAO();
		List<BankAccount> bankAccs=bankDao.getBankAccounts(1);
    	for(BankAccount bankAcc:bankAccs){
    %>
        <div class="bank-account">
            <p><%= bankAcc.getBankName() %></p>
            <p>Bank Acct No:<%=bankAcc.getAccountNumber()%></p>
            <p>Balance:<%=bankAcc.getBalance()%></p>
            <p>IFSC Code:<%=bankAcc.getIfscCode() %></p>
            <p>Branch:<%=bankAcc.getBranchLocation() %></p>
            <a href="editBankAcct.jsp?acctNo=1234"><button class="edit-button">Edit</button></a>
        </div>
    <%	} %>
        <div>
            <a href="addBankAcct.jsp"><button class="add-button">[+]</button></a>
        </div>
    </div>

    <!-- Recent Transactions Section -->
    <div class="transactions">
        <h3>Recent 10 Txns List</h3>
        <ul>
            <li>1000 sent to satya</li>
            <li>1300 received from ravi</li>
            <li>120 received from 78877</li>
            <li>...</li>
            <li>...</li>
            <li>...</li>
        </ul>
        <a href="stmtRequest.jsp"><button>Detailed Stmt</button></a>
    </div>
</body>
</html>