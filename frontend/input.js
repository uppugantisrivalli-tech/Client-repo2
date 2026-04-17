<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Validation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background: #ffffff;
            padding: 25px;
            width: 300px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #0078D4;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        .error {
            color: red;
            font-size: 14px;
        }
    </style>

    <script>
        function validateLogin() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var errorMsg = "";

            if (username === "") {
                errorMsg += "Username is required.\n";
            } else if (username.length < 4) {
                errorMsg += "Username must be at least 4 characters.\n";
            }

            if (password === "") {
                errorMsg += "Password is required.\n";
