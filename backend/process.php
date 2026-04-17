<?php
// Get form values
$username = $_POST['username'];
$password = $_POST['password'];

// Server-side validation
if (empty($username) || empty($password)) {
    echo "Username and Password are required!";
    exit;
}

// Hardcoded credentials (for demo only)
$validUsername = "admin";
$validPassword = "admin123";

// Authentication
if ($username === $validUsername && $password === $validPassword) {
    echo "✅ Login successful! Welcome, " . htmlspecialchars($username);
} else {
    echo "❌ Invalid username or password";
}
?>