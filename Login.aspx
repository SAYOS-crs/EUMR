<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <style>
        * {margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;}
        body {background:linear-gradient(135deg,#aec8ed 0%,#ffffff 100%);color:var(--dark);min-height:110vh;display:flex;justify-content:center;align-items:center;padding:100px;}
        .login-container {display:flex;flex-direction:column;background-color:#2d8ad1;border-radius:60px;box-shadow:0 10px 25px rgba(56,56,56,0.997);overflow:visible;position:relative;bottom:30px;width:400px;padding:40px;height:auto;}
        .login-header{text-align:center;margin-bottom:30px;}
        .login-header h1{color:#ecebebfe;font-size:33px;font-weight:bold;margin-bottom:10px;}
        .login-header p{color:#fffefe;font-size:14px;}
        .form-group{margin-bottom:20px;}
        .form-group label{display:block;margin-bottom:8px;font-size:18px;color:#c5c0c0;}
        .form-control{width:100%;padding:14px 15px;background-color:#fffcfc;border:1px solid #ffffff;border-radius:15px;color:#000000;font-size:14px;transition:all 0.3s;}
        .form-control:focus{outline:none;border-color:#f6f7f2;box-shadow:0 0 0 2px rgba(45,45,188,0.3);}
        .form-control::placeholder{color:#dfdada;}
        .remember-forgot{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;font-size:14px;}
        .remember-me{display:flex;align-items:center;color:#383838;}
        .remember-me input{margin-right:8px;}
        .forgot-password{color:#f1f3f4;text-decoration:none;}
        .forgot-password:hover{text-decoration:underline;}
        .btn-login{width:100%;padding:20px;background-color:#74a7dd;color:white;border:none;border-radius:20px;font-size:16px;font-weight:bold;cursor:pointer;transition:background-color 0.3s;}
        .btn-login:hover{background-color:#3fac6b;}
        .btn-register{width:100%;padding:20px;background-color:#74a7dd;color:white;border:none;border-radius:20px;font-size:16px;font-weight:bold;cursor:pointer;transition:background-color 0.3s;}
        .btn-register:hover{background-color:#bd1212;}
        .signup-link{text-align:center;margin-top:20px;font-size:14px;}
        .signup-link a{color:#d3dae0;text-decoration:none;}
        .signup-link a:hover{text-decoration:underline;}
        .divider{display:flex;align-items:center;margin:20px 0;}
        .divider::before,.divider::after{content:"";flex:1;border-bottom:1px solid #3e3e42;}
        .divider span{padding:0 10px;color:#100d0d;font-size:14px;}
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-container">
            <div class="login-header">
                <h1>Welcome Back</h1>
            </div>

            <div class="form-group">
                <label for="txtusername">Enter Your National_ID or E_mail</label>
                <asp:TextBox ID="txtusername" runat="server" CssClass="form-control"
                    placeholder="Enter Your National_ID or E_mail"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtpassword">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"
                    CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>

            <div class="remember-forgot">
                <div class="remember-me">
                    <input type="checkbox" id="remember">
                    <label for="remember">Remember me</label>
                </div>
                <a href="forgot.aspx" class="forgot-password">Forgot password?</a>
            </div>

            <asp:Button ID="btnLogin" runat="server" CssClass="btn-login" Text="Login"
                OnClick="btnLogin_Click" />

            <!-- ❤️ Label للرسائل -->
            <asp:Label ID="lblMsg" runat="server" ForeColor="Yellow" 
                       Style="margin-top:15px; display:block; text-align:center;"></asp:Label>

            <div class="divider"><span>or</span></div>

            <asp:Button ID="btnRegister" runat="server" CssClass="btn-register"
                Text="Register" OnClick="btnRegister_Click" />

        </div>

    </form>

</body>
</html>
