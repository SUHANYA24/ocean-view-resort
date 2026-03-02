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
    </style>
</head>
<body>

<nav class="navbar navbar-expand admin-nav sticky-top py-2 px-4">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold text-dark d-flex align-items-center" href="dashboard.jsp">
            <span class="bg-primary text-white p-2 rounded-3 me-2">
                <i class="fa-solid fa-hotel"></i>
            </span>
            <span class="d-none d-lg-inline">Ocean View Admin</span>
        </a>

        <form class="d-none d-sm-inline-block form-inline ms-4 me-auto my-2 my-md-0 mw-100">
            <div class="input-group">
                <input type="text" class="form-control search-input" placeholder="Search Reservation #..." aria-label="Search">
                <button class="btn btn-primary rounded-end-pill" type="button">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </form>

        <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item dropdown no-arrow mx-3">
                <a class="nav-link text-muted position-relative" href="#" id="alertsDropdown" role="button" data-bs-toggle="dropdown">
                    <i class="fas fa-bell fa-fw"></i>
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="font-size: 0.6rem;">
                        3+
                    </span>
                </a>
            </li>

            <div class="vr mx-2 text-gray-400"></div>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                    <div class="me-2 text-end d-none d-lg-block">
                        <div class="fw-bold small text-dark"><%= session.getAttribute("username") != null ? session.getAttribute("username") : "Admin User" %></div>
                        <div class="text-muted" style="font-size: 0.7rem;">Manager</div>
                    </div>
                    <img class="user-profile-img border" src="https://ui-avatars.com/api/?name=Admin&background=0077b6&color=fff">
                </a>
                <ul class="dropdown-menu dropdown-menu-end shadow border-0 animated--grow-in">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i> Profile</a></li>
                    <li><a class="dropdown-item" href="help.jsp"><i class="fas fa-question-circle fa-sm fa-fw me-2 text-gray-400"></i> Help Center</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item text-danger" href="../logout.jsp"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2"></i> Logout</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>