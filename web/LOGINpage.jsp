<%-- 
    Document   : LOGINpage
    Created on : 28 Nov 2024, 01.11.47
    Author     : nbpav
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - InvenTrack</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .header {
            position: fixed;
            top: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px 30px;
            background: linear-gradient(90deg, #4b6cb7, #182848);
            color: white;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .header img {
            height: 60px;
            max-width: 100%; /* Menjamin gambar tetap proporsional */
        }

        .header h1 {
            font-size: 28px;
            color: white;
            text-align: center;
            flex: 1; /* Memberi ruang proporsional */
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
            animation: fadeInBg 2s ease-out;
            background: url("<%= request.getContextPath() %>/background") no-repeat center center fixed; /* Gambar background */
            background-size: cover;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            height: 100%;
            min-height: 100%;
            background: inherit;
            filter: blur(3px);
            z-index: -1;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.85);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            text-align: center;
            max-width: 400px;
            width: 90%; /* Gunakan persentase agar fleksibel */
            animation: zoomIn 1s ease-out;
        }

        .login-container h1 {
            font-size: 32px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            font-weight: 500;
            color: #333;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .btn-login {
            background-color: #4b6cb7;
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background-color: #182848;
            transform: scale(1.05);
        }

        .forgot-password {
            margin-top: 15px;
            font-size: 14px;
            color: #4b6cb7;
            cursor: pointer;
            text-decoration: none;
        }

        .forgot-password:hover {
            color: #182848;
        }

        .error-message {
            color: red;
            margin-top: 15px;
            font-size: 14px;
        }

        @keyframes fadeInBg {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        /* Responsivitas */
        @media (max-width: 768px) {
            .header {
                flex-direction: column; /* Header lebih fleksibel pada layar kecil */
                align-items: center;
                height: auto; /* Header fleksibel */
                padding: 10px 20px;
            }

            .header img {
                height: 50px; /* Ukuran gambar lebih kecil di layar kecil */
            }

            .header h1 {
                font-size: 22px;
                margin-top: 10px;
            }

            .login-container {
                padding: 30px;
                max-width: 350px; /* Lebar maksimal lebih kecil untuk layar sempit */
            }

            .login-container h1 {
                font-size: 28px;
            }

            .form-group input {
                font-size: 14px; /* Ukuran font input lebih kecil */
                padding: 10px;
            }

            .btn-login {
                font-size: 16px;
                padding: 10px;
            }

            .forgot-password {
                font-size: 12px;
            }
        }

        @media (max-width: 576px) {
            .header {
                padding: 10px;
            }

            .header img {
                height: 40px;
            }

            .header h1 {
                font-size: 20px;
            }

            .login-container {
                padding: 20px;
                max-width: 300px; /* Lebar maksimal lebih kecil untuk layar lebih sempit */
            }

            .login-container h1 {
                font-size: 24px;
            }

            .form-group input {
                font-size: 12px;
                padding: 8px;
            }

            .btn-login {
                font-size: 14px;
                padding: 8px;
            }

            .forgot-password {
                font-size: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <img src="<%= request.getContextPath() %>/logo" alt="InvenTrack Logo">
        <h1>Welcome To InvenTrack  -  Alywas On Track</h1>
    </div>
    <div class="login-container">
        <h1>Login</h1>
        <form method="post" action="LoginServlet">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        <a href="changePass.jsp" class="forgot-password">Change Password?</a>

        <% 
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <p class="error-message"><%= error %></p>
        <% } %>
    </div>
</body>
</html>