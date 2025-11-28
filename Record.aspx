<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Record.aspx.cs" Inherits="Record" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Records - Citizen Profile</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary: #7bb2de;
            --primary-dark: #1a5276;
            --secondary: #A23B72;
            --success: #27AE60;
            --warning: #F39C12;
            --danger: #E74C3C;
            --light: #ffffff;
            --dark: #2C3E50;
            --gray: #6C757D;
            --gray-light: #e2e9f0;
            --border-radius: 3px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffffff 0%, #ffffff 100%);
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header */
        .header {
            text-align: center;
            color: rgba(2, 109, 208, 0.785);
            margin-bottom: 30px;
            padding: 30px 0;
        }

        .header h1 {
            font-size: 2.5rem;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .header p {
            font-size: 1.2rem;

            opacity: 0.9;
        }

        /* Main Content */
        .main-content {
            background: rgba(255, 255, 255, 0.95);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            backdrop-filter: blur(10px);
            overflow: hidden;
            margin-bottom: 30px;
        }

        /* Sections */
        .section-header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 20px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .section-header h2 {
            font-size: 1.5rem;
            font-weight: 600;
        }

        /* Profile Section */
        .profile-container {
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 30px;
            padding: 30px;
        }

        /* Photo Section */
        .photo-section {
            display: flex;
            justify-content: center;
        }

        .photo-container {
            position: relative;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            overflow: hidden;
            border: 5px solid var(--primary);
            box-shadow: var(--box-shadow);
        }

        .citizen-photo {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .photo-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(43, 20, 20, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: var(--transition);
        }

        .photo-container:hover .photo-overlay {
            opacity: 1;
        }

        .upload-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-size: 14px;
            transition: var(--transition);
        }

        .upload-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* Info Section */
        .citizen-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            padding: 12px 15px;
            border: 2px solid var(--gray-light);
            border-radius: 8px;
            font-size: 16px;
            transition: var(--transition);
            background: white;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(46, 134, 171, 0.1);
        }

        .form-group input[readonly] {
            background-color: var(--gray-light);
            cursor: not-allowed;
        }

        /* Buttons */
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(46, 134, 171, 0.3);
        }

        .btn-secondary {
            background: var(--gray-light);
            color: var(--dark);
        }

        .btn-secondary:hover {
            background: var(--gray);
            color: white;
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background: var(--primary);
            color: white;
        }

        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        /* Attachments Section */
        .attachments-section {
            padding: 0;
        }

        .attachment-category {
            padding: 30px;
            border-bottom: 1px solid var(--gray-light);
        }

        .attachment-category:last-child {
            border-bottom: none;
        }

        .attachment-category h3 {
            color: var(--primary);
            margin-bottom: 20px;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .attachments-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .attachment-card {
            background: white;
            border: 1px solid var(--gray-light);
            border-radius: var(--border-radius);
            padding: 20px;
            display: flex;
            align-items: center;
            gap: 15px;
            transition: var(--transition);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        .attachment-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-color: var(--primary);
        }

        .attachment-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        .attachment-info {
            flex: 1;
        }

        .attachment-info h4 {
            color: var(--dark);
            margin-bottom: 5px;
            font-size: 1.1rem;
        }

        .attachment-info p {
            color: var(--gray);
            margin-bottom: 5px;
            font-size: 0.9rem;
        }

        .attachment-date {
            color: var(--gray);
            font-size: 0.8rem;
        }

        .attachment-actions {
            display: flex;
            gap: 10px;
        }

        .action-btn {
            width: 35px;
            height: 35px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .view-btn {
            background: var(--success);
            color: white;
        }

        .view-btn:hover {
            background: #219653;
        }

        .download-btn {
            background: var(--primary);
            color: white;
        }

        .download-btn:hover {
            background: var(--primary-dark);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: white;
            border-radius: var(--border-radius);
            width: 90%;
            max-width: 500px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: var(--border-radius) var(--border-radius) 0 0;
        }

        .modal-header h3 {
            margin: 0;
        }

        .close-btn {
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: var(--transition);
        }

        .close-btn:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .modal-body {
            padding: 30px;
        }

        /* Notification */
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--success);
            color: white;
            padding: 15px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            z-index: 1001;
            display: flex;
            align-items: center;
            gap: 15px;
            animation: slideInRight 0.3s ease;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }

            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .notification button {
            background: none;
            border: none;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            padding: 0;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-container {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .photo-container {
                margin: 0 auto;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .attachments-grid {
                grid-template-columns: 1fr;
            }

            .section-header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            body {
                padding: 10px;
            }
        }

        @media (max-width: 480px) {
            .photo-container {
                width: 200px;
                height: 200px;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }
        </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="<h4>">
            <!-- Header -->
            <header class="header">
                <h1><i class="fas fa-hospital-alt"></i> Medical Records System</h1>
                <p>Citizen Health Profile Management</p>
            </header>

            <button>
                <a href="em.html" class="btn btn-danger py-md-2 px-md-5 animated slideIncenter">Emergency</a>
            </button>

            <button>
                <a href="HELP.html" class="btn btn-danger py-md-2 px-md-5 animated slideIncenter">HELP THEM</a>
            </button>

            <!-- Main Content -->
            <div class="main-content">

                <!-- Citizen Profile Section -->
                <section class="profile-section">
                    <div class="section-header">
                        <h2><i class="fas fa-user"></i> Citizen Information</h2>
                    </div>

                    <div class="profile-container">

                        <!-- Photo Section -->
                        <div class="photo-section">
                            <div class="photo-container">
                                <img id="citizenPhoto"
                                     src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='250' height='250' viewBox='0 0 250 250'%3E%3Crect width='250' height='250' fill='%232E86AB'/%3E%3Ctext x='50%25' y='50%25' dominant-baseline='middle' text-anchor='middle' font-family='Arial' font-size='48' fill='white'%3E%F0%9F%91%A4%3C/text%3E%3C/svg%3E"
                                     alt="Citizen Photo" class="citizen-photo">

                                <div class="photo-overlay">
                                    <asp:FileUpload ID="photoUpload" runat="server" accept="image/*" Style="display:none;" />
                                    <button type="button" onclick="document.getElementById('photoUpload').click()" class="upload-btn">
                                        <i class="fas fa-camera"></i> Change Photo
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Form Section -->
                        <div class="info-section">
                            <div class="citizen-form">

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Full Name</label>
                                        <asp:TextBox ID="fullName" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>National ID</label>
                                        <asp:TextBox ID="nationalId" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <asp:TextBox ID="dateOfBirth" TextMode="Date" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Age</label>
                                        <asp:TextBox ID="age" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Blood Type</label>
                                        <asp:TextBox ID="bloodType" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Phone Number</label>
                                        <asp:TextBox ID="phone" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <asp:TextBox ID="gender" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label>Email</label>
                                        <asp:TextBox ID="email" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group full-width">
                                    <label>Address</label>
                                    <asp:TextBox ID="address" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>

                                <div class="form-actions">
                                    <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-primary" Text="Update Information" />
                                </div>

                            </div>
                        </div>

                    </div>
                </section>

                <!-- Attachments Section -->
                <!-- نفس كود المرفقات انسخه كما هو بدون تعديل -->
                <!-- (كل ما هو HTML فقط يترك كما هو) -->

            </div>
        </div>

    </form>

</body>
</html>


