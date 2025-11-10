<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tracker Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            background: radial-gradient(circle at top left, #0f2027, #203a43, #2c5364);
            color: #f1f1f1;
            font-family: 'Segoe UI', sans-serif;
            height: 100vh;
            overflow: hidden;
        }

        .sidebar {
            width: 260px;
            background: #0d1b2a;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding: 30px 20px;
            box-shadow: 2px 0 15px rgba(0,0,0,0.3);
        }

        .sidebar h3 {
            color: #4cc9f0;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 700;
        }

        .sidebar a {
            display: block;
            color: #b0c4de;
            text-decoration: none;
            padding: 12px 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            transition: all 0.3s;
        }

        .sidebar a:hover, .sidebar a.active {
            background: linear-gradient(90deg, #4361ee, #3a0ca3);
            color: #fff;
        }

        .main-content {
            margin-left: 270px;
            padding: 30px;
            overflow-y: auto;
            height: 100vh;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            border: none;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            padding: 20px;
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-3px);
        }

        .card h5 {
            color: #4cc9f0;
            font-weight: 600;
        }

        canvas {
            max-height: 250px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .topbar h4 {
            font-weight: 600;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
            font-size: 0.95rem;
        }

        .user-info i {
            color: #4cc9f0;
        }
        
        .profile-pic-container {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .profile-pic {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #4cc9f0;
            background-color: #2c5364;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        
        .profile-pic i {
            font-size: 20px;
            color: #b0c4de;
        }
        
        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .dropdown-menu {
            background-color: #0d1b2a;
            border: 1px solid #2c5364;
        }
        
        .dropdown-item {
            color: #b0c4de;
        }
        
        .dropdown-item:hover {
            background-color: #2c5364;
            color: #fff;
        }
        
        .dropdown-divider {
            border-color: #2c5364;
        }
        
        /* Default profile picture styling */
        .default-profile {
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #4361ee, #3a0ca3);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3><i class="fas fa-bullseye"></i> Tracker App</h3>

        <a href="TrackerDashboard.jsp" class="active"><i class="fas fa-home me-2"></i> Dashboard</a>
        <a href="signup"><i class="fas fa-user-plus me-2"></i> Add Users</a>
        <a href="members"><i class="fas fa-users me-2"></i> Add Members</a>
        <a href="activity"><i class="fas fa-tasks me-2"></i> Add Activity</a>
        <a href="activitylog"><i class="fas fa-clipboard-list me-2"></i> Add Activity Log</a>
        <hr class="text-secondary">
        <a href="listusers"><i class="fas fa-list me-2"></i> User List</a>
        <a href="membersList.jsp"><i class="fas fa-list-ul me-2"></i> Member List</a>
        <a href="activityList.jsp"><i class="fas fa-chart-line me-2"></i> Activity List</a>
        <a href="activityLogList.jsp"><i class="fas fa-history me-2"></i> Activity Log List</a>
    </div>

    <!-- Main Dashboard -->
    <div class="main-content">
        <div class="topbar">
            <h4>Welcome back, <span style="color:#4cc9f0;"><%= ((com.entity.UserEntity)session.getAttribute("user")) != null ? ((com.entity.UserEntity)session.getAttribute("user")).getFirstName() : "User" %></span></h4>
            <div class="user-info">
                <div class="profile-pic-container">
                    <div class="profile-pic">
                        <!-- Dynamic profile picture based on user data -->
                        <c:choose>
                            <c:when test="${not empty user.profilePicUrl}">
                                <img src="${user.profilePicUrl}" alt="Profile Picture" onerror="this.style.display='none'; document.getElementById('defaultProfile').style.display='flex';">
                                <div id="defaultProfile" class="default-profile" style="display: none;">
                                    ${not empty user.firstName ? user.firstName.charAt(0) : 'U'}
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="default-profile">
                                    ${not empty user.firstName ? user.firstName.charAt(0) : 'U'}
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-sm text-white dropdown-toggle" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <%= ((com.entity.UserEntity)session.getAttribute("user")) != null ? ((com.entity.UserEntity)session.getAttribute("user")).getFirstName() : "User" %>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                            <li><a class="dropdown-item" href="#"><i class="fas fa-user me-2"></i> My Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i> Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-3">
                <div class="card text-center">
                    <h5>Today's Users</h5>
                    <h3>2,300 <small class="text-success">+5%</small></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <h5>New Clients</h5>
                    <h3>3,052 <small class="text-danger">-14%</small></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <h5>Total Sales</h5>
                    <h3>$173,000 <small class="text-success">+8%</small></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center">
                    <h5>Satisfaction Rate</h5>
                    <h3>95%</h3>
                </div>
            </div>
        </div>

        <div class="row mt-4 g-4">
            <div class="col-md-8">
                <div class="card">
                    <h5>Sales Overview</h5>
                    <canvas id="salesChart"></canvas>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5>Active Users</h5>
                    <canvas id="usersChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Sales Chart
        const ctx = document.getElementById('salesChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
                datasets: [{
                    label: 'Sales',
                    data: [120,190,300,500,200,300,400,600,800,1000,950,1200],
                    borderColor: '#4cc9f0',
                    backgroundColor: 'rgba(76,201,240,0.2)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.4
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
        });

        // Active Users Chart
        const ctx2 = document.getElementById('usersChart').getContext('2d');
        new Chart(ctx2, {
            type: 'bar',
            data: {
                labels: ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'],
                datasets: [{
                    label: 'Active Users',
                    data: [200,300,250,400,450,350,500],
                    backgroundColor: 'rgba(67,97,238,0.8)',
                    borderRadius: 6
                }]
            },
            options: { scales: { y: { beginAtZero: true } } }
        });
    </script>

</body>
</html>