<%-- 
    Document   : processpayment
    Created on : Jan 5, 2026, 10:54:49 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Mode</title>
    <style>
        body {
            /* Consistent terminal font */
            font-family: 'Courier New', Courier, monospace;
            background-color: #000000;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: hidden;
        }

        .auth-box {
            background: #000000;
            padding: 40px;
            border: 1px solid #333;
            text-align: center;
            width: 350px;
            position: relative;
        }

        /* Scanline effect for that retro-tech look */
        .auth-box::after {
            content: "";
            position: absolute;
            top: 0; left: 0; width: 100%; height: 2px;
            background: rgba(255, 255, 255, 0.05);
            animation: scan 3s linear infinite;
        }

      
        

        h3 {
            text-transform: uppercase;
            letter-spacing: 3px;
            border-bottom: 1px solid #333;
            padding-bottom: 15px;
            margin-bottom: 25px;
        }

        .meta-data {
            font-size: 11px;
            color: #666;
            text-align: left;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        input[type="password"] {
            width: 80%;
            padding: 15px;
            margin: 20px 0;
            border: none;
            border-bottom: 2px solid #ffffff;
            background: transparent;
            color: #ffffff;
            text-align: center;
            font-size: 24px;
            letter-spacing: 12px;
            outline: none;
        }

        input[type="password"]::placeholder {
            color: #222;
            letter-spacing: 5px;
        }

        .btn-confirm {
            background: #ffffff;
            color: #000000;
            border: none;
            padding: 15px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 10px;
            transition: 0.3s;
        }

        .btn-confirm:hover {
            background: #666;
            color: #fff;
        }

        .abort-text {
            display: block;
            margin-top: 25px;
            color: #444;
            font-size: 10px;
            text-decoration: none;
            text-transform: uppercase;
        }

        .abort-text:hover {
            color: #ff0000;
        }
    </style>
</head>
<body>

    <div class="auth-box">
        <h3>Payment Mode</h3>
        
        <div class="meta-data">
            <br>
            PAYMENT TYPE: <%= request.getParameter("method") %><br>
            GAME NAME: <%= request.getParameter("gname") %>
        </div>
        
        <p style="font-size: 10px; color: #888; text-transform: uppercase;">Enter the PIN</p>
        
        <form action="library.jsp" method="GET">
            <input type="hidden" name="saveGame" value="<%= request.getParameter("gname") %>">
            <input type="hidden" name="saveImg" value="<%= request.getParameter("gimg") %>">
            
            <input type="password" maxlength="6" placeholder="000000" required autofocus>
            
            <button type="submit" class="btn-confirm">VERIFY</button>
        </form>

        <a href="displayrecords.jsp" class="abort-text">[ ADMIN PAGE ]</a>
    </div>

</body>
</html>