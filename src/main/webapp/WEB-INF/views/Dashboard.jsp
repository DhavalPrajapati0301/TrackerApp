<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            font-size: 0.95rem;
        }

        .user-info i {
            color: #4cc9f0;
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
                <i class="fas fa-user-circle me-2"></i> Logged in
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
