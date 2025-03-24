<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    /* Body Styling */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        margin: 0;
    }

    /* Form Container */
    .login-container {
        background-color: #ffffff;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
        text-align: center;
    }

    /* Form Title */
    .login-container h2 {
        margin-bottom: 1.5rem;
        color: #333333;
        font-size: 1.5rem;
    }

    /* Input Fields */
    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 100%;
        padding: 0.75rem;
        margin: 0.5rem 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    .login-container input[type="text"]:focus,
    .login-container input[type="password"]:focus {
        border-color: #007bff;
        outline: none;
    }

    /* Submit Button */
    .login-container button {
        width: 100%;
        padding: 0.75rem;
        margin-top: 1rem;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .login-container button:hover {
        background-color: #0056b3;
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .login-container {
            padding: 1.5rem;
        }

        .login-container h2 {
            font-size: 1.25rem;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            padding: 0.6rem;
            font-size: 0.9rem;
        }

        .login-container button {
            padding: 0.6rem;
            font-size: 0.9rem;
        }
    }
</style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>