<%-- 
    Document   : displayrecords
    Created on : Jan 1, 2026, 9:48:17 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Game Store</title>
    <style>
       
        body {
            font-family: 'Courier New', Courier, monospace; 
            background-color: #000000;
            color: #ffffff;
            margin: 0;
            padding: 40px;
        }

        h1 {
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 10px;
            font-size: 3rem;
            border-bottom: 1px solid #333;
            padding-bottom: 20px;
            margin-bottom: 50px;
        }

        .game-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
        }

        
        .game-card {
            background: #000;
            border: 1px solid #333;
            border-radius: 0px; 
            padding: 20px;
            width: 250px;
            text-align: left;
            transition: all 0.4s ease;
            position: relative;
        }

        .game-card:hover {
            border-color: #ffffff;
            background: #111;
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.1);
        }

       
        .game-img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            filter: grayscale(100%);
            transition: filter 0.5s ease;
            margin-bottom: 15px;
            border: 1px solid #222;
        }

        .game-card:hover .game-img {
            filter: grayscale(0%); 
        }

        .game-name {
            font-size: 1.2rem;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .game-price {
            font-size: 1.5rem;
            color: #ffffff;
            font-weight: lighter;
            margin-bottom: 20px;
            border-left: 3px solid #fff;
            padding-left: 10px;
        }

       
        .buy-btn {
            display: block;
            background: #ffffff;
            color: #000000;
            padding: 12px;
            text-decoration: none;
            border-radius: 0;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            border: 1px solid #ffffff;
            width: 100%;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .buy-btn:hover {
            background: #000000;
            color: #ffffff;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 60px;
            color: #666;
            text-decoration: none;
            font-size: 0.8rem;
            letter-spacing: 2px;
        }

        .back-link:hover { color: #fff; }

        .game-id { color: #444; font-size: 0.7rem; }
    </style>
</head>
<body>

    <h1>The Collection</h1>

    <div class="game-container">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamelogin","root","avi@2004");
                String query = "SELECT * FROM gamelist";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM gamelist");
                
                while(rs.next()) {
        %>
                <div class="game-card">
                    <img src="<%= rs.getString("gameimage") %>" class="game-img" alt="cover">
                    
                   
                    <span class="game-name"><%= rs.getString("gamename") %></span>
                    <div class="game-price">₹<%= rs.getInt("gameprice") %></div>
                    
                    <form action="payment.jsp" method="post">
                        <input type="hidden" name="gname" value="<%= rs.getString("gamename") %>">
                        <input type="hidden" name="gprice" value="<%= rs.getInt("gameprice") %>">
                        <input type="hidden" name="gimg" value="<%= rs.getString("gameimage") %>">
                        <button type="submit" class="buy-btn">BUY</button>
                    </form>
                </div>
        <%
                }
                conn.close();
            } catch(Exception ex) {
                out.println("<p style='color:white; background:red; padding:10px;'>System Error: " + ex.getMessage() + "</p>");
            }
        %>
    </div>

    <a href="admin.jsp" class="back-link">Back to Admin Page</a>

</body>
</html>