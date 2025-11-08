<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.entity.UserEntity" %>
<%
    // Retrieve logged-in user from session
    UserEntity user = (UserEntity) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Activity | Tracker App</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: radial-gradient(circle at top left, #0f2027, #203a43, #2c5364);
            color: #f1f1f1;
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
        }

        .container {
            max-width: 700px;
            margin-top: 60px;
            background: rgba(255,255,255,0.05);
            padding: 35px 45px;
            border-radius: 18px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #4cc9f0;
            font-weight: 600;
        }

        label {
            color: #b0c4de;
            font-weight: 500;
        }

        .form-control {
            background: rgba(255,255,255,0.08);
            border: none;
            border-radius: 10px;
            color: #fff;
        }

        .form-control:focus {
            background: rgba(255,255,255,0.12);
            box-shadow: 0 0 5px #4cc9f0;
            color: #fff;
        }

        .btn-primary {
            background: linear-gradient(90deg, #4361ee, #3a0ca3);
            border: none;
            border-radius: 12px;
            padding: 10px 25px;
            transition: all 0.3s;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            background: linear-gradient(90deg, #3a0ca3, #4361ee);
        }

        .back-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #4cc9f0;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        option {
            color: #000;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-dumbbell me-2"></i>Add Activity</h2>

    <form action="saveactivity" method="post">
        <!-- Hidden user ID (from session) -->
        <input type="hidden" name="userId" value="<%= user.getUserId() %>">

        <div class="mb-3">
            <label for="activityName" class="form-label">Activity Name</label>
            <select id="activityName" name="activityName" class="form-control" required>
                <option value="">Select Activity</option>
                <option value="Yoga">Yoga</option>
                <option value="Water Intake">Water Intake</option>
                <option value="Exercise">Exercise</option>
                <option value="Meditation">Meditation</option>
                <option value="Walking">Walking</option>
                <option value="Running">Running</option>
                <option value="Cycling">Cycling</option>
                <option value="Reading">Reading</option>
                <option value="Sleeping">Sleeping</option>
                <option value="Screen Time">Screen Time</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="countable" class="form-label">Countable Unit</label>
            <select id="countable" name="countable" class="form-control" required>
                <option value="">Select Unit</option>
                <option value="Minutes">Minutes</option>
                <option value="ML">ML</option>
                <option value="Steps">Steps</option>
                <option value="Pages">Pages</option>
                <option value="Hours">Hours</option>
                <option value="Calories">Calories</option>
                <option value="Reps">Reps</option>
                <option value="Km">Kilometers</option>
                <option value="Laps">Laps</option>
                <option value="Sessions">Sessions</option>
            </select>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save me-2"></i>Save Activity
            </button>
        </div>

        <a href="TrackerDashboard.jsp" class="back-link">
            <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
        </a>
    </form>
</div>

</body>
</html>
