<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Statement Request Page</title>
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
            color: orange;
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
        .form-group input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid blue;
            box-sizing: border-box;
        }
        .checkbox-group {
            display: flex;
            justify-content: space-around;
            margin-bottom: 15px;
        }
        .checkbox-group label {
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
        <h2>Statement Request Page</h2>
        <form action="href="DisplayTransactions" method="post">
            <div class="form-group">
                <label for="startDate">Start DATE:</label>
                <input type="text" id="startDate" name="startDate" required>
            </div>
            <div class="form-group">
                <label for="endDate">END DATE:</label>
                <input type="text" id="endDate" name="endDate" required>
            </div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="txnType" value="all" checked>
                    ALL
                </label>
                <label>
                    <input type="checkbox" name="txnType" value="credit">
                    Credit Txns
                </label>
                <label>
                    <input type="checkbox" name="txnType" value="debit">
                    Debit Txns
                </label>
                <label>
                    <input type="checkbox" name="txnType" value="wallet">
                    Wallet Txns
                </label>
                <label>
                    <input type="checkbox" name="txnType" value="bank">
                    Bank Txns
                </label>
            </div>
            <button type="submit" class="submit-button">GENERATE</button>
        </form>
    </div>
</body>
</html>