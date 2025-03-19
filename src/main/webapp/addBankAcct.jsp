<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Bank Account</title>
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
            border: 2px solid red;
            padding: 20px;
            width: 300px;
            text-align: center;
        }
        h2 {
            color: red;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            color: blue;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid blue;
            box-sizing: border-box;
        }
        .submit-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            width: 100%;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Bank Account</h2>
        <form action="processAddBankAcct.jsp" method="post">
            <div class="form-group">
                <label for="bankName">BANK NAME:</label>
                <input type="text" id="bankName" name="bankName" required>
            </div>
            <div class="form-group">
                <label for="accountNumber">ACCOUNT NUMBER:</label>
                <input type="text" id="accountNumber" name="accountNumber" required>
            </div>
            <div class="form-group">
                <label for="accountType">ACCOUNT TYPE:</label>
                <input type="text" id="accountType" name="accountType" required>
            </div>
            <div class="form-group">
                <label for="ifscCode">IFSC CODE:</label>
                <input type="text" id="ifscCode" name="ifscCode" required>
            </div>
            <div class="form-group">
                <label for="currentBalance">CURRENT BALANCE:</label>
                <input type="number" id="currentBalance" name="currentBalance" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="pin">PIN:</label>
                <input type="password" id="pin" name="pin" required>
            </div>
            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>
</body>
</html>