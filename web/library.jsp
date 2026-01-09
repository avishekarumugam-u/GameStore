<%-- 
    Document   : library
    Created on : Jan 1, 2026, 9:48:50 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Library</title>
    <style>
        /* Unique Monochrome Global Styles */
        body { 
            font-family: 'Courier New', Courier, monospace; /* Tech/Terminal feel */
            background: #000000; 
            color: #ffffff; 
            padding: 60px;
            margin: 0;
        }

        .header { 
            border-left: 10px solid #ffffff;
            padding-left: 20px;
            margin-bottom: 60px;
        }

        h1 { 
            font-size: 3rem; 
            text-transform: uppercase; 
            letter-spacing: -2px; 
            margin: 0;
        }

        .header p { color: #666; letter-spacing: 2px; text-transform: uppercase; font-size: 0.8rem; }

        /* Unique Grid and Slot Design */
        .lib-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); 
            gap: 40px; 
        }

        .game-slot { 
            background: #000; 
            border: 1px solid #333; 
            position: relative;
            transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .game-slot:hover { 
            border-color: #ffffff;
            transform: scale(1.02);
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.1);
        }

        /* Grayscale Image Container */
        .cover { 
            height: 300px; 
            background: #111;
            display: flex; 
            align-items: center; 
            justify-content: center; 
            overflow: hidden;
            border-bottom: 1px solid #333;
        }

        .cover img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: grayscale(100%) contrast(1.2); /* Stark Black and White */
            transition: 0.5s;
        }

        .game-slot:hover .cover img {
            filter: grayscale(0%); /* Color pops back on hover */
        }

        .game-info { padding: 20px; }

        .game-title {
            font-weight: bold;
            text-transform: uppercase;
            font-size: 1.1rem;
            margin-bottom: 15px;
            display: block;
        }

        /* Stark Buttons */
        .install-btn { 
            background: #ffffff; 
            color: #000000; 
            border: none; 
            padding: 12px; 
            cursor: pointer; 
            width: 100%; 
            font-weight: bold; 
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .install-btn:hover { background: #cccccc; }

        .remove-btn { 
            background: transparent; 
            color: #666; 
            border: 1px solid #333; 
            padding: 8px; 
            cursor: pointer; 
            width: 100%; 
            font-size: 10px; 
            text-transform: uppercase;
            transition: 0.3s;
        }

        .remove-btn:hover { 
            color: #ffffff; 
            border-color: #ff0000; 
            background: rgba(255, 0, 0, 0.1);
        }

        .back-link { 
            margin-top: 80px;
            display: inline-block;
            color: #fff; 
            text-decoration: none; 
            border-bottom: 1px solid #fff;
            padding-bottom: 5px;
            font-size: 0.9rem;
        }
        
        .back-link:hover { color: #666; border-color: #666; }
    </style>
</head>
<body>

    <div class="header">
        <h1>My Library</h1>
        <p>Collection</p>
    </div>

    <div class="lib-grid">
       <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamelogin","root","avi@2004");

        // ACTION 1: SAVE LOGIC
        String gameToSave = request.getParameter("saveGame");
        String imgToSave = request.getParameter("saveImg");
        
        if (gameToSave != null && !gameToSave.isEmpty()) {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO library (gamename, gameimage) VALUES (?, ?)");
            ps.setString(1, gameToSave);
            ps.setString(2, imgToSave);
            ps.executeUpdate();
            
            // --- ADD THIS REDIRECT TO CLEAN THE URL ---
            response.sendRedirect("library.jsp");
            return; // Stop execution of the rest of the page until redirect happens
        }

                // Delete Logic
                String gameToRemoveId = request.getParameter("removeId");
                if (gameToRemoveId != null) {
                    PreparedStatement psDel = conn.prepareStatement("DELETE FROM library WHERE libid = ?");
                    psDel.setInt(1, Integer.parseInt(gameToRemoveId));
                    psDel.executeUpdate();
                response.sendRedirect("library.jsp");
            return;
                }

                // Display Logic
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM library");
                
                boolean hasGames = false;
                while(rs.next()) {
                    hasGames = true;
                    String gameName = rs.getString("gamename");
                    String gameImg = rs.getString("gameimage");
                    // Default image if null
                    if(gameImg == null) gameImg = "https://via.placeholder.com/300x400?text=NO+IMAGE";
        %>
                    <div class="game-slot">
                        <div class="cover">
                            <% 
           // 1. Get the image from the database
           String displayImg = rs.getString("gameimage");
           
           // 2. Check if it's empty or null
           if(displayImg == null || displayImg.trim().isEmpty()) {
               // 3. Apply the placeholder if no data is found
               displayImg = "https://via.placeholder.com/300x400?text=No+Image+Found";
           }
        %>
                            <img src="<%= displayImg %>" alt="cover">
    </div>
                       
                        <div class="game-info">
        <span class="game-title"><%= rs.getString("gamename") %></span>
        <button class="install-btn" onclick="alert('Accessing Core Files...')">RUN</button>
        
        <form method="POST">
            <input type="hidden" name="removeId" value="<%= rs.getInt("libid") %>">
            <button type="submit" class="remove-btn" onclick="return confirm('Erase from archives?')">
                Remove the Game
            </button>
        </form>
    </div>
</div>
        <%
                }
                
                if(!hasGames) {
                    out.println("<p style='color:#444; text-transform: uppercase;'>[ Archive Empty ]</p>");
                }

                conn.close();
            } catch(Exception e) {
                out.println("System Error: " + e.getMessage());
            }
        %>
    </div>

    <div style="text-align: left;">
        <a href="displayrecords.jsp" class="back-link">Return to Store</a>
    </div>
        
</body>
</html>