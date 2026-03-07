<%@ page import="com.oceanviewresort.model.*" %>
<%
    Object loggedUser = session.getAttribute("loggedUser");

    if (loggedUser == null || !(loggedUser instanceof StFF)) {
        response.sendRedirect("../login.jsp");
        return;
    }

    Staff staff = (Staff) loggedUser;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ocean View | Management Console</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/all.min.css">
    
    <style>
        :root {
            --sidebar-width: 250px;
            --ocean-dark: #001219;
            --ocean-blue: #0077b6;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8f9fa;
            overflow-x: hidden;
        }

        /* Top Admin Navbar */
        .admin-nav {
            background-color: white;
            border-bottom: 1px solid #e3e6f0;
            z-index: 1030;
        }

        .search-input {
            background-color: #f8f9fa;
            border: 1px solid #d1d3e2;
            border-radius: 20px;
            padding-left: 15px;
            font-size: 0.85rem;
        }

        /* Sidebar Styling */
        #sidebar {
            min-height: 100vh;
            background-color: var(--ocean-dark);
            transition: all 0.3s;
        }

        #sidebar .nav-link {
            color: rgba(255,255,255,0.7);
            font-weight: 500;
            padding: 12px 20px;
            border-radius: 0;
            transition: 0.2s;
        }

        #sidebar .nav-link:hover {
            color: white;
            background: rgba(255,255,255,0.1);
        }

        #sidebar .nav-link.active {
            color: white;
            background: var(--ocean-blue);
            border-left: 4px solid #90e0ef;
        }

        .user-profile-img {
            width: 35px;
            height: 35px;
            object-fit: cover;
            border-radius: 50%;
        }

        /* Card Adjustments for Dashboards */
        .card {
            border: none;
            border-radius: 12px;
        }
        
        footer{
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        main{
            margin-top: 7vh;
            margin-bottom: 7vh
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg admin-nav position-fixed w-100 sticky-top py-2 px-4 shadow-sm bg-white">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-dark d-flex align-items-center me-4" href="staff-dashboard.jsp">
            <span class="bg-info text-white p-2 rounded-3 me-2">
                <i class="fa-solid fa-concierge-bell"></i>
            </span>
            <span>Ocean View Staff</span>
        </a>

        <div class="collapse navbar-collapse" id="staffNavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark active" href="dashboard.jsp">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark" href="bookings.jsp">Reservations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark" href="room-status.jsp">Housekeeping</a>
                </li>
            </ul>

            <div class="dropdown">
                <a class="btn btn-link text-dark dropdown-toggle text-decoration-none d-flex align-items-center" href="#" data-bs-toggle="dropdown">
                    <img class="rounded-circle me-2 border" src="https://ui-avatars.com/api/?name=Staff+User&background=0dcaf0&color=fff" width="32">
                    <span class="small fw-bold">Front Desk</span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end border-0 shadow mt-2">
                    <li><a class="dropdown-item" href="manage-profile.jsp">My Profile</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="../logout.jsp">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</nav>