<%@page import="com.pradeep.model.BankAccountDAO"%>
<%@page import="com.pradeep.model.BankAccount"%>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            border: 2px solid blue;
            padding: 20px;
            width: 350px;
            text-align: center;
        }
        h2 {
            color: red;
            margin-bottom: 20px;
            border: 2px solid red;
            padding: 10px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            color: blue;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid blue;
            box-sizing: border-box;
        }
        .radio-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .radio-group label {
            display: inline-block;
            margin-right: 10px;
        }
        .submit-button {
            background-color: #ff6b6b;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
            border-radius: 5px;
        }
        .submit-button:hover {
            background-color: #ff3333;
        }
    </style>
    <!-- 
    <script>
        // Function to toggle input fields based on radio button selection
        function toggleInputs() {
            const toAccountInput = document.getElementById("toAccount");
            const toWalletInput = document.getElementById("toWallet");

            const toAccountRadio = document.querySelector('input[name="toType"][value="account"]');
            const toWalletRadio = document.querySelector('input[name="toType"][value="wallet"]');

            if (toAccountRadio.checked) {
                toAccountInput.disabled = false; // Enable "TO ACCOUNT NUMBER"
                toWalletInput.disabled = true;   // Disable "TO WALLET"
            } else if (toWalletRadio.checked) {
                toAccountInput.disabled = true;  // Disable "TO ACCOUNT NUMBER"
                toWalletInput.disabled = false;  // Enable "TO WALLET"
            }
        }

        // Attach event listeners to radio buttons
        window.onload = function () {
            const radios = document.querySelectorAll('input[name="toType"]');
            radios.forEach(radio => {
                radio.addEventListener("change", toggleInputs);
            });

            // Initialize the state on page load
            toggleInputs();
        };
    </script>
    -->
</head>
<body>
    <div class="container">
        <h2>SEND MONEY</h2>
        <form action="SendMoney" method="post">
            <div class="form-group">
                <label for="amount">AMOUNT TO SEND:</label>
                <input type="number" id="amount" name="amount" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="from">FROM:</label>
                <select id="from" name="from" required>
                    <option value="" disabled selected>Select Account</option>
                    <%
                        BankAccountDAO bankDao = new BankAccountDAO();
                        List<BankAccount> bankAccs = bankDao.getBankAccounts(1);
                        for (BankAccount bankAcc : bankAccs) {
                    %>
                    <option value="<%=bankAcc.getAccountNumber()%>"><%=bankAcc.getBankName()+":"+bankAcc.getAccountNumber()%></option>
                    <%  }   %>
                </select>
            </div>
            <div class="radio-group">
                <label>
                    <input type="radio" name="toType" value="BA" checked>
                    TO ACCOUNT NUMBER
                </label>
                <label>
                    <input type="radio" name="toType" value="WA">
                    TO WALLET
                </label>
            </div>
            <div class="form-group">
                <label for="toAccount">TO ACCOUNT NUMBER:</label>
                <input type="text" id="toAccount" name="toAccount" required>
            </div>
            <div class="form-group">
                <label for="toWallet">TO WALLET:</label>
                <input type="text" id="toWallet" name="toWallet" required>
            </div>
            <button type="submit" class="submit-button">SEND</button>
        </form>
    </div>
    <script>
        // Function to toggle input fields based on radio button selection
        function toggleInputs() {
            const toAccountInput = document.getElementById("toAccount");
            const toWalletInput = document.getElementById("toWallet");

            const toAccountRadio = document.querySelector('input[name="toType"][value="BA"]');
            const toWalletRadio = document.querySelector('input[name="toType"][value="WA"]');

            if (toAccountRadio.checked) {
                toAccountInput.disabled = false; // Enable "TO ACCOUNT NUMBER"
                toWalletInput.disabled = true;   // Disable "TO WALLET"
            } else if (toWalletRadio.checked) {
                toAccountInput.disabled = true;  // Disable "TO ACCOUNT NUMBER"
                toWalletInput.disabled = false;  // Enable "TO WALLET"
            }
        }

        // Attach event listeners to radio buttons
        window.onload = function () {
            const radios = document.querySelectorAll('input[name="toType"]');
            radios.forEach(radio => {
                radio.addEventListener("change", toggleInputs);
            });

            // Initialize the state on page load
            toggleInputs();
        };
    </script>
</body>
</html>