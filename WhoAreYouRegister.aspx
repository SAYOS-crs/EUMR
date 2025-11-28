<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WhoAreYouRegister.aspx.cs" Inherits="WhoAreYouRegister" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Who Are You Register - Get Started</title>
    <style>
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #ffffff 0%, #ffffff 100%);
            color: #333;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            display: flex;
            width: 1000px;
            max-width: 95%;
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .left-section {
            flex: 1;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
        }

        .logo-icon {
            font-size: 35px;
            margin-right: 10px;
        }

        .left-section h1 {
            font-size: 32px;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .left-section p {
            font-size: 16px;
            line-height: 1.6;
            opacity: 0.9;
        }

        .right-section {
            flex: 1;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section p {
            color: #666;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .option-cards {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
        }

        @media (max-width: 768px) {
            .option-cards {
                flex-direction: column;
            }
        }

        .option-card {
            flex: 1;
            border: 2px solid #e0e0e0;
            border-radius: 25px;
            padding: 30px 20px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .option-card:hover {
            border-color: #4facfe;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(15, 50, 176, 0.758);
        }

        .option-card.selected {
            border-color: #4facfe;
            background-color: #f0f8ff;
        }

        .option-icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .btn-option {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            border-radius: 30px;
            border: 2px solid #333;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-option:hover {
            background-color: #4facfe;
            color: white;
            border-color: #4facfe;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="left-section">
            <div class="logo">
                <span class="logo-icon">⚡</span>
                <span>Check</span>
            </div>
            <h1>WHO ARE YOU ?</h1>
            <p>Please tell us who are you to use the application easily</p>
        </div>
        <div class="right-section">
            <p>Select the option that best describes you. This helps us customize your experience.</p>
            <div class="option-cards">
                <div class="option-card" id="citizenOption">
                    <div class="option-icon">👤</div>
                    <h3>Citizen</h3>
                    <a href="CitizenRegister.aspx" class="btn-option">Continue</a>
                </div>
                <div class="option-card" id="providerOption">
                    <div class="option-icon">🏢</div>
                    <h3>Provider</h3>
                    <a href="ProviderReg.aspx" class="btn-option">Continue</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>




