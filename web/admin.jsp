<%-- 
    Document   : admin
    Created on : Jan 1, 2026, 9:47:53 PM
    Author     : avish
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Game Store</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            font-family: 'Segoe UI', Roboto, Helvetica, sans-serif;
            overflow: hidden;
        }

        
        body {
            background: url('https://images.pexels.com/photos/194511/pexels-photo-194511.jpeg');
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

       
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

       
        .menu {
            position: relative;
            z-index: 2;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 50px 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.8);
            width: 350px;
        }

        h2 {
            color: #fff;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-size: 1.2rem;
            border-bottom: 2px solid #0078f2;
            padding-bottom: 10px;
        }

       
        .menu a {
            display: block;
            text-decoration: none;
            color: #fff;
            background: rgba(255, 255, 255, 0.1);
            margin: 15px 0;
            padding: 15px;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s ease;
            text-transform: uppercase;
            font-size: 0.9rem;
            border: 1px solid transparent;
        }

       
        .menu a:hover {
            background: #0078f2;
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 120, 242, 0.6);
            border: 1px solid #00d2ff;
        }

        
    </style>
</head>
<body>
    <div class="overlay"></div>
    
    <div class="menu">
        <h2>Game Store</h2>
        <a href="displayrecords.jsp">Game Collection</a>
        <a href="library.jsp">My Library</a>
    </div>

</body>
</html>
