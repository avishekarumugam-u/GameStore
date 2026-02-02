/usr/local/tomcat/webapps/ROOT/index.jsp

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title> Login Page</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #202020;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            
        }
        .login-container {
            background: #2c2c2c;
            padding: 40px;
            border-radius: 8px;
            width: 300px;
            text-align: center;
            box-shadow: 0 0 15px rgba(0,0,0,0.5);
        }
        .login-container h2 {
            margin-bottom: 20px;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #0078f2;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background: #005bb5;
        }
        .login-container .links {
            margin-top: 15px;
            font-size: 14px;
        }
        .login-container .links a {
            color: #0078f2;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Sign In</h2>
        <form action="process.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required/>
            <input type="password" name="password" placeholder="Password" required/>
            <input type="submit" value="Login"/>
        </form>
        <div class="links">         
        </div>
    </div>

</body>
</html>




