<%@ page import="java.util.*" %>
<%@ page import="com.oceanviewresort.model.*" %>
<%
    Object loggedUser = session.getAttribute("loggedUser");

    if (loggedUser == null || !(loggedUser instanceof Admin)) {
        response.sendRedirect("../login.jsp");
        return;
    }

    Admin admin = (Admin) loggedUser;
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">
    
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

<nav class="navbar navbar-expand-lg admin-nav position-fixed w-100 sticky-top py-2 px-4 shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-dark d-flex align-items-center me-4" href="dashboard">
            <span class="bg-primary text-white p-2 rounded-3 me-2">
                <i class="fa-solid fa-hotel"></i>
            </span>
            <span>Ocean View Admin</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNavbarContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNavbarContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark active" href="dashboard">
                        <i class="fa-solid fa-chart-pie me-1 small text-primary"></i> Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark" href="manage-bookings">
                        <i class="fa-solid fa-calendar-days me-1 small text-primary"></i> Bookings
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark" href="manage-rooms">
                        <i class="fa-solid fa-bed me-1 small text-primary"></i> Rooms
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-3 fw-medium text-dark" href="manage-users">
                        <i class="fa-solid fa-user-shield me-1 small text-primary"></i> Users
                    </a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <form class="me-3 d-none d-xl-block">
                    <div class="input-group input-group-sm">
                        <input type="text" class="form-control border-0 bg-light" placeholder="Search Res #">
                        <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                    </div>
                </form>

                <div class="dropdown">
                    <a class="btn btn-link text-dark dropdown-toggle text-decoration-none d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-2 border" src="https://ui-avatars.com/api/?name=Admin&background=0077b6&color=fff" width="32">
                        <span class="small fw-bold"><%= admin.getEmail() %></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end border-0 shadow mt-2">
                        <li><a class="dropdown-item" href="manage-profile.jsp"><i class="fa-solid fa-circle-question me-2 text-muted"></i> Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-power-off me-2"></i> Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>