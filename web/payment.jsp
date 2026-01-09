<%-- 
    Document   : payment
    Created on : Jan 1, 2026, 9:48:33 PM
    Author     : avish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .payment-box {
            background: #1e1e1e;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            width: 400px;
            border: 1px solid #333;
        }
        .item-details {
            background: #2a2a2a;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .price-tag {
            font-size: 24px;
            color: #39ff14;
            font-weight: bold;
        }
        .method {
            background: #333;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 6px;
            cursor: pointer;
            border: 1px solid transparent;
            display: flex;
            align-items: center;
        }
        .method:hover {
            border-color: #00d2ff;
            background: #3d3d3d;
        }
        .btn-pay {
            background: #0078f2;
            color: white;
            border: none;
            width: 100%;
            padding: 15px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="payment-box">
        <h2 style="margin-top:0;">CHECKOUT</h2>
        
        <div class="item-details">
            <span style="color: #888; font-size: 12px;">ORDER SUMMARY</span>
            <div style="font-size: 18px; margin: 5px 0;"><%= request.getParameter("gname") %></div>
            <div class="price-tag">₹<%= request.getParameter("gprice") %></div>
        </div>

        <p style="font-size: 14px; color: #aaa;">Select Payment Method:</p>
        
        <div class="method" onclick="process('UPI')">
            <span style="font-size: 20px; margin-right: 15px;">📱</span> UPI (GPay, PhonePe, Paytm)
        </div>
        
        <div class="method" onclick="process('Card')">
            <span style="font-size: 20px; margin-right: 15px;">💳</span> Credit / Debit Card
        </div>
        
        <div class="method" onclick="process('NetBanking')">
            <span style="font-size: 20px; margin-right: 15px;">🏦</span> Net Banking
        </div>

        <button class="btn-pay" onclick="confirmOrder()">PLACE ORDER</button>
        <a href="displayrecords.jsp" style="display:block; text-align:center; color:gray; text-decoration:none; margin-top:15px; font-size:13px;">Cancel and return</a>
    </div>

    <script>
        let selectedMethod = "";
        function process(m) {
            selectedMethod = m;
            alert(m + " selected as payment method.");
        }

        function confirmOrder() {
  
        var gameName = "<%= request.getParameter("gname") %>";
        // Get the image URL passed from displayrecords.jsp
        var gameImg = "<%= request.getParameter("gimg") %>"; 
        if(selectedMethod === "") {
        alert("Please select a payment method!");
    } else {
        // Redirect to the Password/PIN page
        window.location.href = "processpayment.jsp?gname=" + encodeURIComponent(gameName) + 
                               "&gimg=" + encodeURIComponent(gameImg) + 
                               "&method=" + encodeURIComponent(selectedMethod);
    }
}

    </script>
</body>
</html>

