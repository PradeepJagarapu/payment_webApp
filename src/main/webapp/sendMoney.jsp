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
</head>
<body>
    <div class="container">
        <h2>SEND MONEY</h2>
        <form action="processSendMoney.jsp" method="post">
            <div class="form-group">
                <label for="amount">AMOUNT TO SEND:</label>
                <input type="number" id="amount" name="amount" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="from">FROM:</label>
                <select id="from" name="from" required>
                    <option value="">Select Account</option>
                    <!-- Add options dynamically from your backend -->
                </select>
            </div>
            <div class="radio-group">
                <label>
                    <input type="radio" name="toType" value="account" checked>
                    TO ACCOUNT NUMBER
                </label>
                <label>
                    <input type="radio" name="toType" value="wallet">
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
</body>
</html>