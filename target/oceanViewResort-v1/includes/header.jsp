<%@ page import="com.oceanviewresort.model.User, com.oceanviewresort.model.Guest, com.oceanviewresort.model.Staff, com.oceanviewresort.model.Admin" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ocean View Resort | Galle</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/all.min.css">

        <style>
            body {
                font-family: 'Poppins', sans-serif;
            }
            .navbar {
                background: rgba(255, 255, 255, 0.95);
                transition: 0.3s;
            }
            .hero-section {
                background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
                    url('https://images.unsplash.com/photo-1544124499-58912cbddaad?auto=format&fit=crop&w=1920&q=80');
                background-size: cover;
                background-position: center;
                height: 90vh;
                display: flex;
                align-items: center;
                color: white;
            }
            .booking-bar {
                background: rgba(255, 255, 255, 0.2);
                backdrop-filter: blur(15px);
                border-radius: 15px;
                padding: 25px;
                margin-top: -60px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                border: 1px solid rgba(255,255,255,0.3);
            }
            .btn-primary {
                background-color: #0077b6;
                border: none;
                padding: 12px 30px;
                border-radius: 8px;
            }
            .btn-primary:hover {
                background-color: #005f8d;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg sticky-top shadow-sm">
            <div class="container">
                <a class="navbar-brand fw-bold text-primary" href="index.jsp">
                    <i class="fa-solid fa-umbrella-beach me-2"></i>OCEAN VIEW
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <%
        User user = (User) session.getAttribute("loggedUser");
        if(user != null) {
            if(user instanceof Guest) {
                        %>
                        <li class="nav-item"><a class="nav-link px-3" href="myReservations.jsp">My Reservations</a></li>
                        <li class="nav-item"><a class="nav-link px-3" href="login?logout=true">Logout</a></li>
                            <%
                                    } else if(user instanceof Staff || user instanceof Admin) {
                            %>
                        <li class="nav-item"><a class="nav-link px-3" href="adminDashboard.jsp">Panel</a></li>
                        <li class="nav-item"><a class="nav-link px-3" href="login?logout=true">Logout</a></li>
                            <%
                                    }
                                } else {
                            %>
                        <li class="nav-item"><a class="nav-link px-3 text-dark fw-semibold" href="login.jsp">Login</a></li>
                        <li class="nav-item ms-lg-3"><a class="btn btn-primary" href="register.jsp">Join Now</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </nav>