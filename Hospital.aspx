<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hospital.aspx.cs" Inherits="Hospital" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Provider Portal</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary: #2c7fb8;
            --primary-dark: #1e5a8a;
            --hospital-color: #45B7D1;
            --dark: #2c3e50;
            --light: #ecf0f1;
            --gray: #95a5a6;
            --success: #2ecc71;
            --warning: #f39c12;
            --error: #e74c3c;
        }

        body {
            background: #f5f7fa;
            color: var(--dark);
            min-height: 100vh;
        }

        /* Header Styles */
        .header {
            background: white;
            padding: 15px 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            display: flex;
            align-items: center;
        }

        .logo-icon {
            font-size: 28px;
            margin-right: 10px;
            color: var(--hospital-color);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--hospital-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 30px 20px;
        }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }

        .card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-icon {
            font-size: 32px;
            margin-right: 15px;
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--hospital-color);
            color: white;
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .card-subtitle {
            color: var(--gray);
            font-size: 14px;
        }

        /* Search Section */
        .search-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .search-title {
            font-size: 24px;
            margin-bottom: 20px;
            color: var(--dark);
        }

        .search-form {
            display: flex;
            gap: 15px;
            align-items: end;
        }

        .form-group {
            flex: 1;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--hospital-color);
            box-shadow: 0 0 0 3px rgba(69, 183, 209, 0.1);
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: var(--hospital-color);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* Citizen Info Section */
        .citizen-info {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            display: none;
        }

        .citizen-info.active {
            display: block;
        }

        .citizen-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 2px solid #f0f0f0;
        }

        .citizen-name {
            font-size: 24px;
            font-weight: 600;
            color: var(--dark);
        }

        .citizen-id {
            color: var(--gray);
            font-size: 16px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 25px;
        }

        .info-item {
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
        }

        .info-label {
            font-size: 12px;
            color: var(--gray);
            margin-bottom: 5px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .info-value {
            font-size: 16px;
            font-weight: 500;
            color: var(--dark);
        }

        /* Upload Section */
        .upload-section {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            display: none;
        }

        .upload-section.active {
            display: block;
        }

        .upload-area {
            border: 2px dashed #e0e0e0;
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            margin-bottom: 20px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .upload-area:hover {
            border-color: var(--hospital-color);
            background: #f8f9fa;
        }

        .upload-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: var(--gray);
        }

        .upload-text {
            color: var(--gray);
            margin-bottom: 15px;
        }

        .file-input {
            display: none;
        }

        .file-list {
            margin-top: 20px;
        }

        .file-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 8px;
            margin-bottom: 10px;
        }

        .file-name {
            font-weight: 500;
        }

        .file-size {
            color: var(--gray);
            font-size: 14px;
        }

        .file-actions {
            display: flex;
            gap: 10px;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
        }

        .btn-success {
            background: var(--success);
            color: white;
        }

        .btn-error {
            background: var(--error);
            color: white;
        }

        /* Recent Activity */
        .recent-activity {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .activity-list {
            margin-top: 20px;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 15px;
            border-left: 4px solid var(--hospital-color);
            background: #f8f9fa;
            margin-bottom: 10px;
            border-radius: 0 8px 8px 0;
        }

        .activity-icon {
            font-size: 20px;
            margin-right: 15px;
        }

        .activity-content {
            flex: 1;
        }

        .activity-title {
            font-weight: 500;
            margin-bottom: 5px;
        }

        .activity-time {
            color: var(--gray);
            font-size: 12px;
        }

        

        .action-btn {
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .action-btn:hover {
            border-color: var(--hospital-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .action-icon {
            font-size: 32px;
            margin-bottom: 10px;
            color: var(--hospital-color);
        }

        .action-text {
            font-weight: 600;
            color: var(--dark);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }

            .search-form {
                flex-direction: column;
            }

            .dashboard-cards {
                grid-template-columns: 1fr;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .quick-actions {
                grid-template-columns: 1fr 1fr;
            }
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <!-- Header -->
        <div class="header">
            <div class="logo">
                <span class="logo-icon">🏥</span>
                <span>General Hospital Portal</span>
            </div>
            <div class="user-info">
                <div class="user-avatar">DR</div>
                <div>
                    <div>Dr. Sarah Johnson</div>
                    <div style="font-size: 12px; color: var(--gray);">Chief Medical Officer</div>
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Dashboard Cards -->
            <div class="dashboard-cards">
                <div class="card">
                    <div class="card-header">
                        <div class="card-icon">🏥</div>
                        <div>
                            <div class="card-title">Hospital Dashboard</div>
                            <div class="card-subtitle">Patient Care & Management</div>
                        </div>
                    </div>
                    <div class="card-stats">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>Patients Today:</span>
                            <span style="font-weight: 600;">45</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>Available Beds:</span>
                            <span style="font-weight: 600;">12</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>Surgeries Today:</span>
                            <span style="font-weight: 600;">8</span>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <span>Emergency Cases:</span>
                            <span style="font-weight: 600; color: var(--error);">5</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div class="card-icon">📊</div>
                        <div>
                            <div class="card-title">Department Status</div>
                            <div class="card-subtitle">Current operational status</div>
                        </div>
                    </div>
                    <div class="card-stats">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>Emergency Dept:</span>
                            <span style="color: var(--error); font-weight: 600;">Busy</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>ICU Capacity:</span>
                            <span style="color: var(--warning); font-weight: 600;">85%</span>
                        </div>
                        <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                            <span>Operating Rooms:</span>
                            <span style="color: var(--success); font-weight: 600;">Available</span>
                        </div>
                        <div style="display: flex; justify-content: space-between;">
                            <span>Staff On Duty:</span>
                            <span style="font-weight: 600;">67</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search Citizen Section -->
            <div class="search-section">
                <div class="search-title">Search Citizen Medical Records</div>
                <div class="search-form">

                    <div class="form-group">
                        <label for="nationalId">National ID Number</label>

                        <asp:TextBox ID="txtNationalId" CssClass="form-control" runat="server"
                                     placeholder="Enter citizen's national ID"></asp:TextBox>

                    </div>

                    <asp:Button ID="btnSearch" OnClick="btnSearch_Click"
                                CssClass="btn btn-primary"
                                runat="server" Text="Search Citizen" />

                </div>
            </div>

            <!-- Citizen Info -->
            <asp:Panel ID="citizenInfo" CssClass="citizen-info" runat="server" Visible="false">
            </asp:Panel>

            <!-- Upload Section -->
            <asp:Panel ID="uploadSection" CssClass="upload-section" runat="server" Visible="false">
                <div style="font-size: 20px; margin-bottom: 20px;">Upload Medical Documents</div>

                <div class="upload-area" id="uploadArea">
                    <div class="upload-icon">📋</div>
                    <div class="upload-text">Drag & drop medical documents or click to browse</div>
                    <div style="font-size: 12px; color: var(--gray);">Supported formats: PDF, DOC, JPG, PNG (Max 15MB)</div>

                    <asp:FileUpload ID="fileUploader" runat="server" AllowMultiple="true" CssClass="file-input" />
                </div>

                <div id="fileList" class="file-list"></div>

                <div style="display: flex; gap: 10px; margin-top: 20px;">
                    <asp:Button ID="btnUpload" runat="server" Text="Upload to Citizen Record" CssClass="btn btn-success" />
                    <asp:Button ID="btnAddPrescription" runat="server" Text="Add Prescription" CssClass="btn btn-primary" />
                    <asp:Button ID="btnAddNote" runat="server" Text="Add Clinical Note" CssClass="btn btn-primary" />
                </div>
            </asp:Panel>

            <!-- Recent Activity -->
            <div class="recent-activity">
                <div style="font-size: 20px; margin-bottom: 10px;">Recent Medical Activities</div>

                <div class="activity-list">
                    <div class="activity-item">
                        <div class="activity-icon">💊</div>
                        <div class="activity-content">
                            <div class="activity-title">Prescription Updated - Amoxicillin 500mg</div>
                            <div class="activity-time">ID: 19907512345678 • 30 minutes ago</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">📋</div>
                        <div class="activity-content">
                            <div class="activity-title">Discharge Summary Created</div>
                            <div class="activity-time">ID: 19908276543210 • 2 hours ago</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">🩺</div>
                        <div class="activity-content">
                            <div class="activity-title">Clinical Assessment Completed</div>
                            <div class="activity-time">ID: 19851103456789 • 3 hours ago</div>
                        </div>
                    </div>

                    <div class="activity-item">
                        <div class="activity-icon">📄</div>
                        <div class="activity-content">
                            <div class="activity-title">Lab Results Reviewed</div>
                            <div class="activity-time">ID: 19907512345678 • 4 hours ago</div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </form>

    <script>
        // Sample citizen data
        const citizenDatabase = {
            '19907512345678': {
                name: 'Ahmed Mohamed Hassan',
                dob: '1990-07-15',
                gender: 'Male',
                bloodType: 'O+',
                address: '123 Main Street, Cairo',
                phone: '+20 100 123 4567',
                emergencyContact: 'Fatima Hassan (Sister) - +20 100 765 4321',
                medicalHistory: ['Hypertension', 'Allergy to Penicillin'],
                insurance: 'National Health Insurance - Gold Plan',
                currentMedications: ['Lisinopril 10mg', 'Aspirin 81mg'],
                allergies: ['Penicillin', 'Shellfish'],
                lastVisit: '2024-01-15',
                primaryDoctor: 'Dr. Sarah Johnson'
            },
            '19908276543210': {
                name: 'Mona Salah Abdelrahman',
                dob: '1990-08-27',
                gender: 'Female',
                bloodType: 'A-',
                address: '456 Garden City, Alexandria',
                phone: '+20 122 345 6789',
                emergencyContact: 'Omar Abdelrahman (Husband) - +20 122 987 6543',
                medicalHistory: ['Asthma', 'Diabetes Type 2'],
                insurance: 'Private Insurance - Comprehensive',
                currentMedications: ['Metformin 500mg', 'Albuterol Inhaler'],
                allergies: ['Latex', 'Iodine'],
                lastVisit: '2024-01-10',
                primaryDoctor: 'Dr. Sarah Johnson'
            },
            '19851103456789': {
                name: 'Youssef Mahmoud Ibrahim',
                dob: '1985-11-03',
                gender: 'Male',
                bloodType: 'B+',
                address: '789 Heliopolis, Giza',
                phone: '+20 111 222 3333',
                emergencyContact: 'Nora Ibrahim (Wife) - +20 111 333 2222',
                medicalHistory: ['High Cholesterol'],
                insurance: 'National Health Insurance - Basic Plan',
                currentMedications: ['Atorvastatin 20mg'],
                allergies: ['None'],
                lastVisit: '2024-01-08',
                primaryDoctor: 'Dr. Sarah Johnson'
            }
        };

        let files = [];

        // Search functionality
        document.getElementById('searchBtn').addEventListener('click', function () {
            const nationalId = document.getElementById('nationalId').value.trim();

            if (!nationalId) {
                alert('Please enter a national ID number');
                return;
            }

            if (citizenDatabase[nationalId]) {
                const citizen = citizenDatabase[nationalId];
                const citizenInfo = document.getElementById('citizenInfo');

                citizenInfo.innerHTML = `
                    <div class="citizen-header">
                        <div>
                            <div class="citizen-name">${citizen.name}</div>
                            <div class="citizen-id">National ID: ${nationalId}</div>
                        </div>
                        <div style="color: var(--success); font-weight: 600;">✓ Medical Record Found</div>
                    </div>
                    <div class="info-grid">
                        <div class="info-item">
                            <div class="info-label">Date of Birth</div>
                            <div class="info-value">${citizen.dob}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Gender</div>
                            <div class="info-value">${citizen.gender}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Blood Type</div>
                            <div class="info-value">${citizen.bloodType}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Phone</div>
                            <div class="info-value">${citizen.phone}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Address</div>
                            <div class="info-value">${citizen.address}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Emergency Contact</div>
                            <div class="info-value">${citizen.emergencyContact}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Medical History</div>
                            <div class="info-value">${citizen.medicalHistory.join(', ')}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Current Medications</div>
                            <div class="info-value">${citizen.currentMedications.join(', ')}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Allergies</div>
                            <div class="info-value">${citizen.allergies.join(', ')}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Insurance</div>
                            <div class="info-value">${citizen.insurance}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Last Visit</div>
                            <div class="info-value">${citizen.lastVisit}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Primary Doctor</div>
                            <div class="info-value">${citizen.primaryDoctor}</div>
                        </div>
                    </div>
                    <div style="text-align: center; margin-top: 20px;">
                        <button class="btn btn-primary" id="showUpload">Upload Medical Documents</button>
                    </div>
                `;

                citizenInfo.classList.add('active');

                // Show upload section when button is clicked
                document.getElementById('showUpload').addEventListener('click', function () {
                    document.getElementById('uploadSection').classList.add('active');
                });
            } else {
                alert('Citizen not found. Please check the national ID and try again.');
            }
        });

        // File upload functionality
        const uploadArea = document.getElementById('uploadArea');
        const fileInput = document.getElementById('fileInput');
        const fileList = document.getElementById('fileList');
        const uploadBtn = document.getElementById('uploadBtn');

        uploadArea.addEventListener('click', () => fileInput.click());
        uploadArea.addEventListener('dragover', (e) => {
            e.preventDefault();
            uploadArea.style.borderColor = 'var(--hospital-color)';
            uploadArea.style.background = '#f8f9fa';
        });
        uploadArea.addEventListener('dragleave', () => {
            uploadArea.style.borderColor = '#e0e0e0';
            uploadArea.style.background = 'white';
        });
        uploadArea.addEventListener('drop', (e) => {
            e.preventDefault();
            uploadArea.style.borderColor = '#e0e0e0';
            uploadArea.style.background = 'white';
            handleFiles(e.dataTransfer.files);
        });

        fileInput.addEventListener('change', (e) => {
            handleFiles(e.target.files);
        });

        function handleFiles(newFiles) {
            for (let file of newFiles) {
                if (file.size > 15 * 1024 * 1024) {
                    alert(`File ${file.name} is too large. Maximum size is 15MB.`);
                    continue;
                }
                files.push(file);
            }
            updateFileList();
        }

        function updateFileList() {
            fileList.innerHTML = '';
            files.forEach((file, index) => {
                const fileItem = document.createElement('div');
                fileItem.className = 'file-item';
                fileItem.innerHTML = `
                    <div>
                        <div class="file-name">${file.name}</div>
                        <div class="file-size">${formatFileSize(file.size)}</div>
                    </div>
                    <div class="file-actions">
                        <button class="btn btn-error btn-sm" onclick="removeFile(${index})">Remove</button>
                    </div>
                `;
                fileList.appendChild(fileItem);
            });
        }

        function removeFile(index) {
            files.splice(index, 1);
            updateFileList();
        }

        uploadBtn.addEventListener('click', () => {
            if (files.length === 0) {
                alert('Please select at least one file to upload.');
                return;
            }

            // Simulate upload process
            uploadBtn.textContent = 'Uploading Medical Documents...';
            uploadBtn.disabled = true;

            setTimeout(() => {
                alert(`Successfully uploaded ${files.length} medical document(s) to citizen record!`);
                files = [];
                updateFileList();
                uploadBtn.textContent = 'Upload to Citizen Record';
                uploadBtn.disabled = false;
                fileInput.value = '';
            }, 2000);
        });

        // Additional functionality buttons
        document.getElementById('addPrescriptionBtn').addEventListener('click', function () {
            alert('Opening prescription management system...');
        });

        document.getElementById('addNoteBtn').addEventListener('click', function () {
            alert('Opening clinical notes editor...');
        });

        function formatFileSize(bytes) {
            if (bytes === 0) return '0 Bytes';
            const k = 1024;
            const sizes = ['Bytes', 'KB', 'MB', 'GB'];
            const i = Math.floor(Math.log(bytes) / Math.log(k));
            return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
        }

        // Quick actions functionality
        document.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const action = this.querySelector('.action-text').textContent;
                alert(`Opening ${action} module...`);
            });
        });
    </script>

</body>
</html>
