<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Tracker - Welcome</title>
    <style>
        :root {
            --primary-color: #667eea;
            --secondary-color: #764ba2;
            --accent-color: #4fd1c7;
            --dark-color: #2d3748;
            --light-color: #f7fafc;
            --text-color: #4a5568;
            --success-color: #48bb78;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: white;
            line-height: 1.6;
        }

        /* Navigation Bar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-link {
            color: var(--text-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: var(--primary-color);
        }

        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3);
        }

        .btn-outline {
            background: transparent;
            color: var(--primary-color);
            border: 2px solid var(--primary-color);
        }

        .btn-outline:hover {
            background: var(--primary-color);
            color: white;
        }

        .btn-signup {
            background: var(--success-color);
            color: white;
            padding: 0.75rem 2rem;
        }

        .btn-signup:hover {
            background: #38a169;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(72, 187, 120, 0.3);
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 6rem 2rem 2rem;
            text-align: center;
        }

        .hero-content {
            max-width: 800px;
        }

        .hero-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-size: 0.9rem;
            margin-bottom: 2rem;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2.5rem;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 3rem;
        }

        /* Features Grid */
        .features {
            background: white;
            padding: 5rem 2rem;
            color: var(--text-color);
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark-color);
            margin-bottom: 1rem;
        }

        .section-title p {
            font-size: 1.1rem;
            color: var(--text-color);
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background: var(--light-color);
            padding: 2.5rem;
            border-radius: 15px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: 1px solid #e2e8f0;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }

        /* Signup CTA */
        .signup-cta {
            background: linear-gradient(135deg, var(--dark-color) 0%, #4a5568 100%);
            padding: 5rem 2rem;
            text-align: center;
        }

        .signup-cta h2 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .signup-cta p {
            font-size: 1.1rem;
            margin-bottom: 2rem;
            opacity: 0.9;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Footer */
        .footer {
            background: var(--dark-color);
            color: white;
            padding: 3rem 2rem 1rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            margin-bottom: 1rem;
            color: var(--accent-color);
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.5rem;
        }

        .footer-links a {
            color: #cbd5e0;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: white;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid #4a5568;
            color: #cbd5e0;
        }

        /* Mobile Menu */
        .mobile-menu-btn {
            display: none;
            background: none;
            border: none;
            color: var(--primary-color);
            font-size: 1.5rem;
            cursor: pointer;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                padding: 1rem;
            }

            .nav-links {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                width: 100%;
                background: white;
                flex-direction: column;
                padding: 1rem;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .nav-links.active {
                display: flex;
            }

            .mobile-menu-btn {
                display: block;
            }

            .hero h1 {
                font-size: 2.5rem;
            }

            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 200px;
                justify-content: center;
            }
        }

        /* Animation */
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.6s ease;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }

        /* Stats */
        .stats {
            display: flex;
            justify-content: center;
            gap: 3rem;
            margin-top: 3rem;
            flex-wrap: wrap;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--accent-color);
            display: block;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="logo">
                <span>📊</span>
                MemberTracker
            </a>
            
            <div class="nav-links" id="navLinks">
                <a href="#features" class="nav-link">Features</a>
                <a href="#pricing" class="nav-link">Pricing</a>
                <a href="#about" class="nav-link">About</a>
                <a href="login.jsp" class="nav-link">Login</a>
                <a href="signup" class="btn btn-signup">
                    <span>🚀</span>
                    Sign Up Free
                </a>
            </div>

            <button class="mobile-menu-btn" id="mobileMenuBtn">
                ☰
            </button>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <div class="hero-badge fade-in">
                🎉 No credit card required • Free forever
            </div>
            
            <h1 class="fade-in">Track Your Members<br>Like Never Before</h1>
            
            <p class="fade-in">
                Powerful member management platform to organize, track, and grow your community. 
                Join thousands of organizations that trust us with their member data.
            </p>

            <div class="hero-buttons">
                <a href="AddMember.jsp" class="btn btn-signup">
                    <span>👥</span>
                    Start Tracking Members - It's Free!
                </a>
                <a href="#features" class="btn btn-outline">
                    <span>📚</span>
                    Learn More
                </a>
            </div>

            <div class="stats fade-in">
                <div class="stat-item">
                    <span class="stat-number">10K+</span>
                    <span class="stat-label">Active Members</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">500+</span>
                    <span class="stat-label">Organizations</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">99.9%</span>
                    <span class="stat-label">Uptime</span>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="features">
        <div class="section-title">
            <h2>Why Choose Member Tracker?</h2>
            <p>Everything you need to manage your members effectively and efficiently</p>
        </div>
        <div class="features-grid">
            <div class="feature-card fade-in">
                <div class="feature-icon">👥</div>
                <h3>Easy Member Management</h3>
                <p>Add, edit, and organize member information with our intuitive drag-and-drop interface.</p>
            </div>
            <div class="feature-card fade-in">
                <div class="feature-icon">📊</div>
                <h3>Smart Analytics</h3>
                <p>Track member growth, engagement, and performance with beautiful, insightful dashboards.</p>
            </div>
            <div class="feature-card fade-in">
                <div class="feature-icon">✉️</div>
                <h3>Automated Communications</h3>
                <p>Send welcome emails, reminders, and updates automatically to keep members engaged.</p>
            </div>
            <div class="feature-card fade-in">
                <div class="feature-icon">🔒</div>
                <h3>Enterprise Security</h3>
                <p>Your data is protected with bank-level security and regular backups.</p>
            </div>
            <div class="feature-card fade-in">
                <div class="feature-icon">📱</div>
                <h3>Mobile Ready</h3>
                <p>Access your member data from anywhere with our mobile-optimized interface.</p>
            </div>
            <div class="feature-card fade-in">
                <div class="feature-icon">⚡</div>
                <h3>Lightning Fast</h3>
                <p>Built for speed with instant search and real-time updates across all devices.</p>
            </div>
        </div>
    </section>

    <!-- Signup CTA Section -->
    <section class="signup-cta">
        <h2 class="fade-in">Ready to Get Started?</h2>
        <p class="fade-in">Join thousands of organizations managing their members with our platform. No credit card required.</p>
        <div class="hero-buttons">
            <a href="AddMember.jsp" class="btn btn-signup" style="font-size: 1.1rem; padding: 1rem 2.5rem;">
                <span>🚀</span>
                Sign Up Free - Start Now!
            </a>
        </div>
        <div style="margin-top: 2rem; opacity: 0.8;">
            <small>No credit card required • Free plan includes up to 100 members • Setup in 2 minutes</small>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Member Tracker</h3>
                <p>Powerful member management solution for organizations of all sizes.</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="AddMember.jsp">Add Member</a></li>
                    <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="reports.jsp">Reports</a></li>
                    <li><a href="pricing.jsp">Pricing</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Support</h3>
                <ul class="footer-links">
                    <li><a href="help.jsp">Help Center</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="privacy.jsp">Privacy Policy</a></li>
                    <li><a href="terms.jsp">Terms of Service</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Member Tracker. All rights reserved.</p>
        </div>
    </footer>


</body>
</html>