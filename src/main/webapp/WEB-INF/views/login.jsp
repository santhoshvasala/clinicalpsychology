<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-container {
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 8px 16px rgba(0,0,0,0.2);
      width: 300px;
      text-align: center;
    }

    .login-container h2 {
      margin-bottom: 20px;
      color: #333;
    }

    .login-container input {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
    }

    .login-container input:focus {
      border-color: #6c63ff;
      outline: none;
      box-shadow: 0 0 5px rgba(108,99,255,0.5);
    }

    .login-container button {
      width: 100%;
      padding: 12px;
      background: #6c63ff;
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .login-container button:hover {
      background: #574b90;
    }

    .login-container p {
      margin-top: 15px;
      font-size: 13px;
      color: #666;
    }

    .login-container a {
      color: #6c63ff;
      text-decoration: none;
    }

    .login-container a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Login</h2>
    <c:if test="${not empty errMessage}">
			<div style="color: red;">${errMessage}</div>
		</c:if>
    <form 	id="loginForm" modelAttribute="login" action="loginProcess"
			method="post">
      <input type="text" placeholder="Username" required name="username">
      <input type="password" placeholder="Password" required name="password">
      <button type="submit">Login</button>
    </form>
     </div>
</body>
</html>
