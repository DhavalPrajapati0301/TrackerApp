<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Activity Log</title>
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
            padding: 30px 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.4);
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
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-clipboard-list me-2"></i>Add Activity Log</h2>

    <form action="saveActivityLog" method="post">
        <div class="mb-3">
            <label for="measurements" class="form-label">Measurements</label>
            <input type="text" id="measurements" name="countable" class="form-control" placeholder="Enter measurement value" required>
        </div>

        <div class="mb-3">
            <label for="notes" class="form-label">Notes</label>
            <textarea id="notes" name="notes" class="form-control" rows="4" placeholder="Enter additional notes..."></textarea>
        </div>

        <div class="mb-3">
            <label for="logDateTime" class="form-label">Log Date & Time</label>
            <input type="datetime-local" id="logDateTime" name="logDateTime" class="form-control" required>
        </div>

        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-save me-2"></i>Save Log
            </button>
        </div>

        <a href="TrackerDashboard.jsp" class="back-link">
            <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
        </a>
    </form>
</div>

</body>
</html>
